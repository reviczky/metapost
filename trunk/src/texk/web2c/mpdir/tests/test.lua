
-- There are two interfaces:
-- new * run
-- or
-- new * execute^1 * finish

if false then 
  mpx = mp.new({ini_version = true, command_line = "plain \\dump"})
  print (mpx:run());
  mpx = nil;
end

function finder (a,b,c)
   print(a,b,c)
   if a == "mpost.map" then
     return "/opt/tex/texmf-local/fonts/map/pdftex/pdftex.map"
   end
   if a =="cmr10.tfm" then
     return "/opt/tex/texmf/fonts/tfm/public/cm/cmr10.tfm"
   end
   return a
end

-- if you don't do this, it only finds local files
mp.find_file_function (finder)

function dorun (m, s) 
  local v = m:execute(s)
--  print ('<<term:'..v.term..'>>')
  print ('<<log:'..v.log..'>>')
  if v.fig then
    print(v.fig:postscript())
  end
end

-- chunks have to have 'complete file' nesting state
local lines = {
-- "prologues:=3;",
 "path p;",
 "p = (0,0){right}..(20,100)..(50,60)..(75,50)...(25,25)..cycle;",
 "pickup pencircle scaled 2;",
 "beginfig(1); fill p withcolor (1,0,0); draw p dashed evenly; endfig;",
 "beginfig(2); fill p withcolor (0,1,0); draw p dashed evenly; endfig;",
 "beginfig(3); fill p withcolor (0,0,1); draw p dashed evenly; endfig;",
 "beginfig(4); fill p withcolor (1,1,0); draw p dashed evenly; endfig;",
 "beginfig(5); fill p withcolor (1,0,1); draw p dashed evenly; endfig;",
 "beginfig(6); fill p withcolor (0,1,1); draw p dashed evenly; endfig;",
 "beginfig(7); label(\"stuff\", (0,0)); endfig;",
}

mpx = mp.new({mem_name = "plain.mem", command_line = "\\relax "})

for _,l in ipairs(lines) do
   dorun (mpx, l)
end

v = mpx:finish();

