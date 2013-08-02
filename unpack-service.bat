cd /d %WINROOT%

ls -l

cd /d %WINROOT%%ENV_NAME%_deploy
C:/7zip/7z.exe x *.zip -o../%ENV_NAME% -y

cd /d %WINROOT%

chgrp -hRc Administrators * 
