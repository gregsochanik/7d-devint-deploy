cd /d %WINROOT%

ls -l

cd /d %WINROOT%%ENV_NAME%_deploy

REM - create temp folder
set NEW_FOLDER=%ENV_NAME%_%RANDOM%%RANDOM%
REM - unzip to this folder
C:/7zip/7z.exe x *.zip -o../%NEW_FOLDER% -y

cd /d %WINROOT%

chgrp -hR Administrators * 

REM Delete deploys older than 1 day
REM forfiles /m %APP%_* /d -1 /c "cmd /c rmdir /s /q @FILE"