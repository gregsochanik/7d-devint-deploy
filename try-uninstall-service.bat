SET SERVICE_FILE_NAME=%2
SET SERVICE_NAME=%3

IF "%1"=="" (
	echo ERROR - You need to specify the environment first parameter
	exit /b 1
)

IF "%SERVICE_FILE_NAME%"=="" (
	echo ERROR - You need to specify the service filename as the second parameter 	
	exit /b 1
)

IF "%SERVICE_NAME%"=="" (
	echo ERROR - You need to specify the service name as the third parameter
	exit /b 1
)

CALL settings\conf.bat
CALL environments\%1.bat

c:\TeamCityBuildTools\PLINK.EXE -i c:\TeamCityBuildTools\DeploymentKeyConfig\Key.ppk -P 22 %SSH_USER%@%SERVER%:%WINROOT%%ENV_NAME% net stop %SERVICE_NAME%

c:\TeamCityBuildTools\PLINK.EXE -i c:\TeamCityBuildTools\DeploymentKeyConfig\Key.ppk -P 22 %SSH_USER%@%SERVER%:%WINROOT%%ENV_NAME% C:/Windows/Microsoft.NET/Framework/v4.0.30319/InstallUtil /u  %WINROOT%%ENV_NAME%/%SERVICE_FILE_NAME%
