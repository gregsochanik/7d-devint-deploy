IF "%1"=="" (
	echo ERROR - You need to specify the environment first parameter
	exit /b 1
)

CALL settings\conf.bat
CALL environments\%1.bat

type environments\%1.bat > temp.bat
echo. >> temp.bat
type defaults.bat >> temp.bat
echo. >> temp.bat
type unpack-service.bat >> temp.bat
echo. >> temp.bat

echo cd /home/sshduser > temp-put.bat
echo mkdir %APP% >> temp-put.bat
echo cd %APP% >> temp-put.bat
echo mput temp.bat >> temp-put.bat
echo chmod 755 temp.bat >> temp-put.bat
echo cd %WWWROOT% >> temp-put.bat
echo mkdir %ROOT% >> temp-put.bat
echo chmod 755 %ROOT% >> temp-put.bat
echo cd %ROOT%/ >> temp-put.bat
echo mkdir %ENV_NAME% >> temp-put.bat
echo mkdir %ENV_NAME%_deploy >> temp-put.bat
echo chmod 755 -R * >> temp-put.bat
echo cd %ENV_NAME%_deploy >> temp-put.bat
echo mput sitefiles/*.* >> temp-put.bat

REM - Put all files on server
psftp %SERVER% -i %KEY_FOLDER%\Key.ppk -l %SSH_USER% -b temp-put.bat -be

REM - Run the setup script in full on the server - NB Cygwin style path spec
PLINK -i %KEY_FOLDER%\Key.ppk -P 22 %SSH_USER%@%SERVER% -batch ./%APP%/temp.bat 

echo %ERRORLEVEL%
