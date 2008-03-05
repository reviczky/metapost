
-- There are two interfaces:
-- new * run
-- or
-- new * execute^1 * finish

if true then 
   mpx = mplib.new({ini_version = true})
   vv = mpx:execute("plain ");
   v = mpx:execute("dump;");
   vvv= mpx:finish();
   print (tostring(vv.term) .. ' ' .. tostring(v.term) .. ' ' .. tostring(vvv.term))
   print (tostring(vv.log) ..  ' ' .. tostring(v.log) .. ' ' .. tostring(vvv.log))
   print (tostring(vv.error) ..  ' ' .. tostring(v.error) .. ' ' .. tostring(vvv.error))
   mpx = nil;
end

dofile("/opt/tex/texmf-local/tex/context/base/l-table.lua");

function dorun (m, s) 
  local v = m:execute(s)
--  print ('<<term:'..v.term..'>>')
  if v.log then
    print ('<<log:'..v.log..'>>')
  end
  if true and v.fig then
     for _,gs in ipairs(v.fig) do
       print(gs:postscript())
	   local b = gs:objects()
       for _,vv in ipairs(b) do
		  print(vv, vv.type, table.serialize(vv.path), table.serialize(vv.color))
          if vv.type == "text" then
		    print(vv.text, vv.font, vv.dsize, table.serialize(vv.transform))
          end
       end
     end
  end
end

-- chunks have to have 'complete file' nesting state
local lines = {
 "\\",
 "prologues:=3;",
 "path p,q;",
 "p = (0,0){right}..(20,100)..(50,60)..(75,50)...(25,25)..cycle;",
 "q = (0,0){right}..(20,100)..(50,60)..(75,50)...(25,25);",
 "pickup pencircle scaled 2;",
 "beginfig(1); fill p withcolor (1,0,0); draw p dashed evenly; endfig;",
 [[beginfig(2); fill p withcolor (1,0,1); endfig; 
   beginfig(3); draw q withcolor (0,1,1); endfig;]],
 "beginfig(4); label(\"stuff\", (0,0)); endfig;",
}

function finder (a,b,c)
   print(a,b,c)
   if a == "mpost.map" then
     return "/opt/tex/texmf-local/fonts/map/pdftex/pdftex.map"
   end
   if a =="cmr10.tfm" then
     return "/opt/tex/texmf/fonts/tfm/public/cm/cmr10.tfm"
   end
   return a
end

mpx = mplib.new({mem_name = "plain.mem", 
              command_line = "\\relax ", 
              find_file = finder})

for _,l in ipairs(lines) do
   dorun (mpx, l)
end

v = mpx:finish();

