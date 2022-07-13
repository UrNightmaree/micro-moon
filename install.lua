#!/usr/bin/env lua

function exists(file)
   local ok, err, code = os.rename(file, file);
   if not ok then
      if code == 13 then
         return true;
      end
   end
   return ok, err;
end;

function isdir(path) return exists(path.."/") end;

local exec = os.execute;

if exec('which git'):match('not found') then
   print 'Install git!';
   return;
end
if exec('which micro'):match('not found') then
   print 'Install Micro!';
   return;
end

exec 'git clone https://github.com/UrNightmaree/micro-moon';

if not isdir('~/.config/micro/syntax') then
   exec 'mkdir ~/.config/micro/syntax';
end

exec 'cd micro-moon && mv moonscript.yaml ~/.config/micro/syntax';

print 'Installation complete'
