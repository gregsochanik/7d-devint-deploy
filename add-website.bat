REM appcmd=%appcmd%

if %APP% == "" (
echo "APP is empty, quitting"
exit /b 1
)

REM Delete apppool
%appcmd% list apppool /apppool.name:%HOST% /xml | %appcmd% delete apppool /in

REM Create apppool
%appcmd% add apppool /apppool.name:%HOST% /managedRuntimeVersion:%APPOOLRUNTIMEVERSION%

REM Set to never recycle (fix memory leaks instead)
appcmd% set apppool /apppool.name:%HOST% /recycling.periodicRestart.time:06:00:00

REM Set to no idle timeout
%appcmd% set config /section:applicationPools /[name='%HOST%'].processModel.idleTimeout:0.00:00:00

REM delete site
%appcmd% list site /site.name:%HOST% /xml | %appcmd% delete site %HOST% /in

REM add new site
%appcmd% add sites /name:%HOST% /id:%ID% /bindings:%BINDINGS% /physicalPath:%WINROOT%%NEW_FOLDER%

REM set app pool
%appcmd% set app "%HOST%/" /applicationPool:%HOST% 

REM check site status
%appcmd% start site /site.name:%HOST%

SET WEBSITE_SET=true
