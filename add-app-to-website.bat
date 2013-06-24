REM appcmd="C:\Windows\System32\inetsrv\appcmd.exe"

REM website named %HOST% and app pool named %HOST% must already exist - %VIRTUAL_APP% must have leading forwardslash(/)

REM 1. add app to %HOST%

%appcmd% add app /site.name:%HOST% /path:%VIRTUAL_APP% /physicalPath:%VIRTUAL_APP_ROOT%

REM 2. set apppool for app to %HOST%
%appcmd% set app "%HOST%%VIRTUAL_APP%" /applicationPool:%HOST% 