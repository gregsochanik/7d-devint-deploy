CALL settings\conf.bat

CALL environments\%1.bat

type environments\%1.bat > temp.bat
echo. >> temp.bat
type add-website.bat >> temp.bat

IF NOT "%VIRTUAL_APP%"=="not_used" (
	type add-app-to-website.bat >> temp.bat
)

%BIN_FOLDER%\psftp.exe %SERVER% -i %KEY_FOLDER%\Key.ppk -l %SSH_USER% -b put.bat

%BIN_FOLDER%\PLINK -i %KEY_FOLDER%\Key.ppk -P 22 %SSH_USER%%SERVER% -batch temp.bat

curl.bat