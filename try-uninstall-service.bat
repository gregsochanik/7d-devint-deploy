c:\TeamCityBuildTools\PLINK.EXE -i c:\TeamCityBuildTools\DeploymentKeyConfig\Key.ppk -P 22 %SSH_USER%@%SERVER%:%WEBROOT%%ENV% "net stop \"%SERVICE_NAME%\"" | echo

timeout /T 5

c:\TeamCityBuildTools\PLINK.exe -i c:\TeamCityBuildTools\DeploymentKeyConfig\Key.ppk -P 22 %SSH_USER%@%SERVER% C:/Windows/Microsoft.NET/Framework/v4.0.30319/InstallUtil -u  %WEBROOT%%ENV%/%SERVICE_FILE_NAME%




