cd /C/Users/sshduser
mput temp.bat
mkdir %1
cd %1
mkdir %2
mkdir %2_deploy
cd %2_deploy
mput sitefiles/*.*
