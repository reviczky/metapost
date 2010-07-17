#!/usr/bin/env texlua

--[[ This is cwebindent.lua

Copyright (C) Taco Hoekwater 2010, Donated to the Public Domain

This program cleans up a CWEB file by running 'indent' on the C parts of it.

--]]

function read_modules (f) 
  local file = io.open(f)
  if not file then return nil  end
  local data = file:read('*a')
  file:close()
  if not data then return nil  end
  local webmodules = {}
  local function store_module (a) webmodules[#webmodules+1] = a  end
  local modulestart = lpeg.P("\n") * (lpeg.P("@ ") + lpeg.P("@\n") + lpeg.P("@*"))
  local module = lpeg.C(modulestart * (1 - modulestart)^1) / store_module
  local limbo = lpeg.C((1 - modulestart)^1) / store_module
  local modules = limbo * module^1
  lpeg.match(modules, data)
  return webmodules  
end

function disect_module (m) 
   local a = { ["src"] = m }
   local function sdoc (v) a.doc  = v end
   local function sdef (v) a.adef  = v end
   local function scod (v) a.cod  = v end
   local non_doc = lpeg.P("@d") + lpeg.P("@f") + lpeg.P("@<") + lpeg.P("@(")  + lpeg.P("@c")  + lpeg.P("@h")
   local non_def = lpeg.P("@<") + lpeg.P("@(") + lpeg.P("@c") + lpeg.P("@h")
   local documentation = lpeg.C((1 - non_doc)^0) / sdoc
   local definitions = lpeg.C((1 - non_def)^0) / sdef
   local code = lpeg.C(lpeg.P(1)^0) / scod
   local parts = documentation * definitions * code
   lpeg.match(parts, m)
   return a
end


function append_to (old, new ) 
   local m = old
   for a,b in ipairs (new)  do
--	  io.write(b)
	  m[#m+1] = b
   end
--   io.write('\n')
   return m
end

local allc = io.open("all.c","w")

function parse_module (module) 
  local space  = lpeg.S(" \t\n\r")^0
  local equal  = lpeg.P("=")
  local equals = lpeg.P("==")
  if module.cod and #(module.cod)>0 then
      local function scode (v) module.code  = v end
      local function sname (v) module.name  = v end
      local name_end = lpeg.P("@>")
      local name_start = lpeg.P("@") * lpeg.S("<(")
      local name_body = (1-name_end)^1
      local name =  lpeg.C(name_start * name_body * name_end)  / sname
      local unnamed = lpeg.C(lpeg.P("@c") + lpeg.P("@h") ) / sname
      local body = lpeg.C(lpeg.P(1)^1) / scode
      local pascal = lpeg.P(lpeg.P(name) * space * equal + unnamed)^1 * space * body
      lpeg.match(pascal,module.cod)
      if module.code then
	 local cfile = io.open("temp.c","w")
         if not cfile then
           print ("Cannot open temp file for indent")
           return
         end
         local c = module.code
         c = string.gsub(c,'@<', 'F("@<')
         c = string.gsub(c,'@%.','D("@.')
         c = string.gsub(c,'@:', 'C("@:')
         c = string.gsub(c,'@%^','H("@^')
         c = string.gsub(c,'@=', 'E("@=')
         c = string.gsub(c,'@>', '@>")')
         cfile:write(c .. '/*INDENTDONE*/;');
         allc:write(c);
         cfile:close()
         local ret = os.spawn('indent temp.c')
         if ret>0 then
	    print('indent error: ' .. ret)
            print('===================')
            os.spawn('cat temp.c')
            print('===================')
         else
	   cfile = io.open("temp.c","r")
           module.code = '\n'..cfile:read('*a')
           module.code = string.gsub(module.code, '\n?%s?/%*INDENTDONE%*/;\n',''); -- last semicolon
           module.code = string.gsub(module.code,'F%s+%("@<', '@<') 
           module.code = string.gsub(module.code,'%s?D%s+%("@%.', '\n@.') 
           module.code = string.gsub(module.code,'%s?C%s+%("@:', '\n@:') 
           module.code = string.gsub(module.code,'%s?H%s+%("@^', '\n@^') 
           module.code = string.gsub(module.code,'E%s+%("@=', '@=') 
           module.code = string.gsub(module.code,'@>"%)', '@>') 
           module.code = string.gsub(module.code,'%)\n{', ') {') 
           module.code = string.gsub(module.code,'@> @<', '@>\n@<') 
           module.code = string.gsub(module.code,'@\n#', '@#') 
           module.code = string.gsub(module.code,'\n%s*\n', '\n') 
           cfile:close()
         end
      end
      module.cod = nil
  end
  return
end


function write_cweb(file,module)
   if module.doc then
	 file.write(file, module.doc)
   end
   if module.adef then
	 file.write(file, module.adef)
   end
   if module.code then
      if module.name == "@c" then
	 file.write(file,"@c")
      elseif module.name == "@h" then
	 file.write(file,"@h")
      elseif module.name then
	 file.write(file, module.name .. "=")
      end
      if (string.sub(module.code,1,1) ~= "\n") then
         file.write(file, "\n")
      end
      file.write(file, module.code)
      file.write(file, "\n")
   end
end

function main () 
  local file = arg[1]
  if not file or not lfs.isfile(file) then
     print ("no pascal web file given")
    return 
  end
  local webmodules = read_modules (file) 
  if not webmodules then
     print ("file loading failed")
     return
  end
  io.write('Input CWEB file '.. file .. '\n');
  local cfile = string.gsub(file,'.w$','.w.new')
  io.write('Output file '.. cfile .. '\n');
  local cweb = io.open(cfile,"w")
  if not cweb then
     print ("Cannot open output")
     return
   end

  local n = 0
  io.write('Interpreting ... ')
  for a,_ in pairs(webmodules) do
     webmodules[a] = disect_module(_)
     webmodules[a].nr = a-1 
     parse_module(webmodules[a])
     if webmodules[a].doc and #webmodules[a].doc and string.sub(webmodules[a].doc,1,2) == "@*" then
        io.write("*" .. tonumber(n))
      	io.flush()
     end
     n = n + 1;
  end

  io.write('\nWriting the output ... ')
  
  n = 0
  for a,_ in pairs(webmodules) do
     write_cweb(cweb,_)
     if _.doc and #_.doc and string.sub(_.doc,1,2) == "@*" then
        io.write("*" .. tonumber(n))
	    io.flush()
     end
     n = n + 1;
  end
  io.close(cweb)
  io.write('\nDone.\n');
end


main()

