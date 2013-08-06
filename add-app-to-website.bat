REM appcmd=%appcmd%

REM website named %HOST% and app pool named %HOST% must already exist - %VIRTUAL_APP% must have leading forwardslash(/)

REM 1. add app to %HOST%

IF NOT "%WEBSITE_SET%"=="true" (
	SET VIRTUAL_APP_ROOT=%NEW_FOLDER%
)

%appcmd% add app /site.name:%HOST% /path:%VIRTUAL_APP% /physicalPath:%VIRTUAL_APP_ROOT%

REM 2. set physicalpath for app to %VIRTUAL_APP_ROOT%
%appcmd% set app "%HOST%%VIRTUAL_APP%" /physicalPath:%VIRTUAL_APP_ROOT%

REM 2. set apppool for app to %HOST%
%appcmd% set app "%HOST%%VIRTUAL_APP%" /applicationPool:%HOST% 
