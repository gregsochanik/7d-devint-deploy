REM appcmd=%appcmd%

if %APP% == "" (
echo "APP is empty, quitting"
exit /b 1
)

REM Delete apppool
%appcmd% list apppool /apppool.name:%HOST% /xml | %appcmd% delete apppool /in

REM Create apppool
%appcmd% add apppool /apppool.name:%HOST% /managedRuntimeVersion:%APPOOLRUNTIMEVERSION%

REM delete site
%appcmd% list site /site.name:%HOST% /xml | %appcmd% delete site %HOST% /in

REM add new site
%appcmd% add sites /name:%HOST% /id:%ID% /bindings:%BINDINGS% /physicalPath:%WINROOT%%NEW_FOLDER%

REM set app pool
%appcmd% set app "%HOST%/" /applicationPool:%HOST% 

REM check site status
%appcmd% start site /site.name:%HOST%

SET WEBSITE_SET=true
