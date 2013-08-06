cd /d %WINROOT%

ls -l

cd /d %WINROOT%%ENV_NAME%_deploy

REM - create temp folder
set NEW_FOLDER=%ENV_NAME%_%RANDOM%%RANDOM%
REM - unzip to this folder
C:/7zip/7z.exe x *.zip -o../%NEW_FOLDER% -y

REM - unzip to original folder for now until we can solve the "service" version problem
C:/7zip/7z.exe x *.zip -o../%ENV_NAME% -y

cd /d %WINROOT%

chgrp -hR Administrators * 

REM Delete deploys older than 7 days
forfiles /m %ENV_NAME%_* /d -7 /c "cmd /c rmdir /s /q @FILE"