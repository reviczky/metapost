#!/usr/bin/env texlua

--[[ This is p2cweb.lua

Copyright (C) Taco Hoekwater 2007, Donated to the Public Domain

This program is not really a proper converter of pascal web to
C web, but it does help to prevent RSI while doing such a conversion
manually

--]]

all_functions = {}
all_procedures = {}
all_globals = {}
is_void  = {}

function parse_pascal (code) 
   local tree = code
   local P, R, S, C =  lpeg.P, lpeg.R, lpeg.S, lpeg.C
   local comments = {}
   local the_tokens = {}
   code = string.gsub (code,"@{","@B")
   code = string.gsub (code,"@}","@E")

   code = string.gsub (code,"\\\\","@s")
   code = string.gsub (code,"\\{", "@b")
   code = string.gsub (code,"\\}", "@e")

   local function save_body (body)
      body = string.gsub(body,"@s","\\\\")
      body = string.gsub(body,"@b","\\{")
      body = string.gsub(body,"@e","\\}")
      comments[#comments+1] = body
      return "@C" .. #comments
   end

   code = string.gsub (code,"\'{\'",save_body)
   code = string.gsub (code,"\'}\'",save_body)
   code = string.gsub (code,"\"{\"",save_body)
   code = string.gsub (code,"\"}\"",save_body)
   code = string.gsub (code,"(@%^.-@>)",save_body)
   code = string.gsub (code,"(@%..-@>)",save_body)
   code = string.gsub (code,"(@t.-@>)",save_body)
   code = string.gsub (code,"(@=.-@>)",save_body)
   code = string.gsub (code,"(@:.-@>)",save_body)
   code = string.gsub (code,"(@<.-@>)",save_body)
   code = string.gsub (code,"(%b{})", save_body)
   local function do_token (a) the_tokens[#the_tokens+1] = a end
   local function do_literal (l) 
      l = string.gsub(l,"@C([0-9]+)",function(a) return comments[tonumber(a)] end)
      do_token(l) 
   end
   local function do_webcommand (a,b) 
      if a == "@s" then 
	 do_token("\\\\") 
      elseif a == "@b" then
	 do_token("\\{") 
      elseif a == "@e" then
	 do_token("\\}") 
      elseif a == "@B" then 
	 do_token("@{") 
      elseif a == "@E" then
	 do_token("@}") 
      elseif a == "@C" then
         l = comments[tonumber(b)]
	 l = string.gsub(l,"@C([0-9]+)",function(a) return comments[tonumber(a)] end)
	 do_token(l) 
      else
	 do_token(a)
      end
   end

   local whitespace = C(S' \t\v\n\f' ) / do_token
   local digit = R'09'
   local letter = R('az', 'AZ') + P'_'
   local letters = letter^1
   local alphanum = letter + digit
   local hex = R('af', 'AF', '09')
   local number = digit^1 +  digit^0 * P'.' * digit^1 +  digit^1 * P'.' * digit^0
   local charlit =  P"'" * (1 - P"'")^0 * P"'"
   local stringlit = P'"' * (1 - P'"')^0 * P'"'
   local literal = C(number + charlit + stringlit) / do_literal
   local macro = C(P"\\" * (letters + 1)) / do_token
   local identifier = (letter * alphanum^0) / do_token
   local op = C(
		   P".." +
		   P"==" +
		   P"<=" +
		   P">=" +
		   P":=" +
		   P"<>" +
		   P"!=" +
		   S";{},:=()[].-+*<>"
	     ) / do_token
   local comment = C(P"@C") * C(number) / do_webcommand
   local webcommand = C(P"@" * 1) / do_webcommand
   local whatever = C(1) / do_token
   local tokens = (macro + identifier + comment + webcommand +
		   literal + op + whitespace + whatever)^0

   lpeg.match(tokens, code)
   return the_tokens
end


function read_modules (f) 
  local file = io.open(f)
  if not file then return nil  end
  local data = file:read('*a')
  file:close()
  if not data then return nil  end
  local webmodules = {}
  local function store_module (a) webmodules[#webmodules+1] = a  end
  local modulestart = lpeg.P("@ ") + lpeg.P("@\n") + lpeg.P("@*")
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
   local non_doc = lpeg.P("@d") + lpeg.P("@f") + lpeg.P("@<") + lpeg.P("@p")
   local non_def = lpeg.P("@<") + lpeg.P("@p")
   local documentation = lpeg.C((1 - non_doc)^0) / sdoc
   local definitions = lpeg.C((1 - non_def)^0) / sdef
   local code = lpeg.C(lpeg.P(1)^0) / scod
   local parts = documentation * definitions * code
   lpeg.match(parts, m)
   if a.adef and #(a.adef)>0 then
      a.def = {}
      local function cdef (v) a.def[(#a.def)+1]  = v end
      local start_def = lpeg.P("@d")
      local start_fmt = lpeg.P("@f")
      local start = start_def + start_fmt
      local body_def = (1-start)^1
      local fmt = lpeg.C(start_fmt * body_def) / cdef
      local def = lpeg.C(start_def * body_def) / cdef
      local defs = (def + fmt)^1
      lpeg.match(defs, a.adef)
      a.adef = nil
   end
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

function fix_function_declarations(code) 
   local t, f = {}, {}
   local infunction = false
   local instate = ''
   local name = ''
   for _,v in ipairs(code) do
	  if not infunction then
		 if v == 'procedure' or v == 'function' then
			infunction = true
			f[0] = v
		 else
			t[#t+1] = v
		 end
	  else 
		 if instate == '' then 
			if  string.match(v,'%a') then
			   f[#f+1] = 'mp_' .. v 
			   name = v 
			   if f[0] == 'procedure' then
				  all_procedures[v] = 1
			   else
				  all_functions[v] = 1
			   end
			   instate = 'startbrace'
			end
		 elseif instate == 'startbrace' then
			if v == '(' then
			   f[#f+1] = ' '
			   f[#f+1] = v 
			   f[#f+1] = 'MP mp' 
			   f[#f+1] = ',' 
			   instate = 'startarg'
			   curarg = ''
			elseif v == ';' then
			   f[#f+1] = ' (MP mp)'
			   is_void[name] = 1
			   if f[0] == 'procedure'  then
				  t[#t+1] = 'void'
				  t[#t+1] = ' '
			   end
			   t = append_to(t,f)
			   f = {}
			   infunction = false
			   instate = ''
			   name = ''
			elseif v == ':' then
			   f[#f+1] = ' (MP mp)'
			   is_void[name] = 1
			   instate  = 'retval'
			end
		 elseif instate == 'startarg' then
			if  v == ':' then
			   instate = 'argtype'			   
			elseif v == '@!' then
			elseif v == 'var' then
			else
			   curarg = curarg .. v
			end
		 elseif instate == 'argtype' then
			if  string.match(v,'%a') then
			   f[#f+1] = v .. ' ' .. curarg
			   curarg = ''
			   instate = 'nextarg'
			end
		 elseif instate == 'nextarg' then
			if  v == ';' then
			   f[#f+1] = ', '
			   instate = 'startarg'
			elseif v == ')' then
			   f[#f+1] = v
			   instate = 'retval'
			end
		 elseif instate == 'retval' then
			if  string.match(v,'%a') then
			   t[#t+1] = v
			   t[#t+1] = ' '
			   instate = 'done'
			elseif v == ';' then
			   if f[0] == 'procedure'  then
				  t[#t+1] = 'void'
				  t[#t+1] = ' '
			   end
			   t = append_to(t,f)
			   f = {}
			   infunction = false
			   instate = ''
			   name = ''
			end
		 elseif instate == 'done' then
			if v == ';' then
			   if f[0] == 'procedure'  then
				  t[#t+1] = 'void'
				  t[#t+1] = ' '
			   end
			   t = append_to(t,f)
			   f = {}
			   infunction = false
			   instate = ''
			   name = ''
			end
		 end
	  end
   end   
   return t;
end

function fix_globals (code)
   local t, f = {}, {}
   local instate = 'startarg'
   local curarg = ''
   local curtype = ''
   for a,v in ipairs(code) do
	  if instate == 'startarg' then
		 if  v == ':' then
			f[#f+1] = curarg
			curarg = ''
			instate = 'argtype'			   
		 elseif v == '@!' then
		 elseif v == 'var' then
		 elseif string.match(v,'{') then
			t[#t+1] =  v
		 elseif string.match(v,'^%s+$') then
			t[#t+1] =  v
		 elseif v == ',' then
			f[#f+1] = curarg
			curarg = ''
		 else
			if string.match(v,"%a") then
			   all_globals[v] = 1
			end
			curarg = curarg .. v
		 end
	  elseif instate == 'argtype' then
		 if  v == ';' then
			for _,w in ipairs(f) do
			   t[#t+1] = curtype .. ' ' .. w .. ';'
			end
			instate = 'startarg'
			curtype = ''
			f = {}
		 else
			curtype = curtype .. v
		 end
	  end
   end
   for _,w in ipairs(f) do
	  t[#t+1] = curtype .. ' ' .. w .. ';'
   end
   return t
end

function fix_constants (code)
   local t = {}
   t[#t+1] = 'static int '
   for a,v in ipairs(code) do
	  if string.match(v,"\n$") then
		 t[#t+1] = v
		 t[#t+1] = 'static int '
	  elseif v == '=' then
		 t[#t+1] = ':='
	  else
		 t[#t+1] = v
	  end
   end
   return t
end


function parse_module (module) 
  local space  = lpeg.S(" \t\n\r")^0
  local equal  = lpeg.P("=")
  local equals = lpeg.P("==")
  if module.def then
     for a,def in pairs(module.def) do
       local thedef = {}
       local function scode (v) thedef.code  = v end
       local function sname (v) thedef.name  = v end
       local function stype (v) thedef.type  = v end
       local param = lpeg.P("(#)") * space * equals
       local equaltype = lpeg.C((equals+equal+param)^1) / stype
       local definame = lpeg.C((1-equaltype)^1) / sname
       local body = lpeg.C(lpeg.P(1)^1) / scode
       local definition = (lpeg.P("@d")+lpeg.P("@f")) * space * definame * equaltype * body
       lpeg.match(definition,def)
       if thedef.code and #(thedef.code)>0 then
		  thedef.class = string.sub(def,1,2);
		  thedef.code = parse_pascal (thedef.name .. thedef.type .. thedef.code)
       end
       module.def[a] = thedef
     end
  end
  if module.cod and #(module.cod)>0 then
      local function scode (v) module.code  = v end
      local function sname (v) module.name  = v end
      local function sspace (v) module.space  = v end
      local name_end = lpeg.P("@>")
      local name_start = lpeg.P("@<")
      local name_body = lpeg.C((1-name_end)^1) / sname
      local name =  name_start * name_body * name_end
      local unnamed = lpeg.P("@p") 
      local ispace = lpeg.C(space) / sspace
      local body = lpeg.C(lpeg.P(1)^1) / scode
      local pascal = lpeg.P(lpeg.P(name * space * equal) + unnamed)^1 * ispace * body
      lpeg.match(pascal,module.cod)
      module.cod = nil
      if module.code and #(module.code)>0 then
         module.code = parse_pascal (module.code)
		 module.code = fix_function_declarations(module.code)
		 if module.name and string.match(module.name,"^Glob") then
			module.code = fix_globals(module.code)			
		 end
		 if module.name and string.match(module.name,"^Constants") then
			module.code = fix_constants(module.code)			
		 end
      end
  end
  return
end


function handle_comment (file,str)
   str = string.gsub(str,"^{","/* ")
   str = string.gsub(str,"}$"," */")
   file.write(file, str)
end


function handle_stringlit (file,str)
   if #str>=3 then
      if (#str==3) or (#str==4 and string.sub(str,2,2)==string.sub(str,3,3)) then 
		 str = string.gsub(str,'^"', "'")
		 str = string.gsub(str,'"$', "'")
      else
		 str = string.gsub(str,"^'", '"')
		 str = string.gsub(str,"'$", '"')
      end
      str = string.gsub(str,'\\', '\\\\')
   end
   if str == "'''" then str = "''''" end
   file.write(file, str)
end


function handle_proc (file,start,code)
  local type = code[start]
  local s = start
  local level = 1
  return s
end

function handle_varlist (file,start,code)
  return start
end

function handle_pcode (file,code)
   local start = 1
   local ops = {
      [";"] = ";",
      ["="] = "==",
      [":="] = "=",
      ["#"] = "(A)",
      ["<>"] = "!=",
      ["begin"] = "{",
      ["end"] = "}",
      ["not"] = "!",
      ["and"] = "&&",
      ["or"] = "||",
      ["div"] = "/",
      ["mod"] = "%",
      ["if"] = "if (",
      ["then"] = ")",
      ["while"] = "while (",
      ["do"] = ")",
      ["repeat"] = "do { ",
      ["until"] = "} while !",
   }
   while #code>=start do 
      local d = code[start]
      local t = string.sub(d,1,1)
      if t == "@" then
		 tt = string.sub(d,2,2)
		 if tt == "'" then
			file.write(file, '0')
		 elseif tt == "\"" then
			file.write(file, '0x')
		 elseif tt == "!" then
		 else
			file.write(file, d)
		 end
      elseif t == "var" then
		 start = handle_varlist(file,start,code)
      elseif t == "{" then
		 handle_comment(file,d)
      elseif t == "\"" or t == "\'" then
		 handle_stringlit(file,d)
      elseif ops[d] then
		 file.write(file, ops[d])
	  elseif all_globals[d] then
		 file.write(file, 'mp->' .. d)
	  elseif all_functions[d] then
		 file.write(file, 'mp_' .. d)
		 if is_void[d] then
			file.write(file, '(mp)')
		 else
			inproc = true
		 end
	  elseif all_procedures[d] then
		 file.write(file, 'mp_' .. d)
		 if is_void[d] then
			file.write(file, '(mp)')
		 else
			inproc = true
		 end
	  elseif d == '(' and inproc then
		 file.write(file, d)
		 file.write(file, 'mp, ')
		 inproc = false
	  else
		 file.write(file, d)
      end
      start = start + 1
   end
end

function table.slice(code, start, stop) 
   local n = {}
   for a = start,stop do
      n[#n+1]  = code[a]
   end
   return n
end

function handle_macro (file,code)
   local start = 1
   local done = 0
   while #code>=start do 
      local d = code[start]
      if d == "==" or d == "=" then
	 file.write(file, " ")
         done = 1
      elseif d == "#" then
	 file.write(file, "A")
      else
	 file.write(file, d)
      end
      start = start + 1
      if done>0 then
         local body = table.slice(code,start,#code)
	 handle_pcode(file,body)
         return
      end
   end
end


function handle_docpart (file,doc) 
   doc = string.gsub(doc,"@'","0")
   doc = string.gsub(doc,'@"',"0x")
   file.write(file,doc)
end

function write_cweb(file,module)
   handle_docpart(file,module.doc)
   if module.def then
      for a,def in pairs(module.def) do
	 file.write(file, def.class .. " ")
	 handle_macro(file, def.code)
      end
   end
   if module.code then
      if module.name then
	 file.write(file, "@<" .. module.name .. "@>=" .. module.space)
	 handle_pcode(file,module.code)
      else
	 file.write(file,"@c" .. module.space)
	 handle_pcode(file,module.code)
      end
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
  io.write('Pweb file '.. file .. '\n');
  local cfile = string.gsub(file,'.web$','.w')
  io.write('Cweb file '.. cfile .. '\n');
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

