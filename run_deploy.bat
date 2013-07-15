CALL settings\conf.bat

CALL environments\%1.bat

type environments\%1.bat > temp.bat
echo. >> temp.bat
type unpack-service.bat >> temp.bat
type add-website.bat >> temp.bat

IF NOT "%VIRTUAL_APP%"=="not_used" (
	type add-app-to-website.bat >> temp.bat
)

IF NOT "%SSL_PORT%"=="not_used" (
	type add-ssl.bat >> temp.bat
)

REM - Put all files on server
%BIN_FOLDER%\psftp.exe %SERVER% -i %KEY_FOLDER%\Key.ppk -l %SSH_USER% -b put.bat %WEBROOT% %ENV_NAME%

REM - Run the setup script in full on the server
%BIN_FOLDER%\PLINK -i %KEY_FOLDER%\Key.ppk -P 22 %SSH_USER%@%SERVER% -batch temp.bat

curl.bat