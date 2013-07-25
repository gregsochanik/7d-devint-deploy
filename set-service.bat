SET SERVICE_NAME=%2
SET ACTION=%3

IF "%1"=="" (
	echo ERROR - You need to specify the environment first parameter
	exit /b 1
)

IF "%SERVICE_NAME%"=="" (
	echo ERROR - You need to specify the service name as the second parameter
	exit /b 1
)

IF "%ACTION%"=="" (
	echo ERROR - You need to specify the service filename as the third parameter 	
	exit /b 1
)

CALL settings\conf.bat
CALL environments\%1.bat

c:\TeamCityBuildTools\PLINK.EXE -i c:\TeamCityBuildTools\DeploymentKeyConfig\Key.ppk -P 22 %SSH_USER%@%SERVER%:%WINROOT%%ENV_NAME% net %ACTION% %SERVICE_NAME%