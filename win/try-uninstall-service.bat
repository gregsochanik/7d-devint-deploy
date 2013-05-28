SET target=%1
SET env=%2
SET servicename=%3
SET file=%4
SET login=sshduser
SET webroot=C:/inetpub/%5/

c:\TeamCityBuildTools\PLINK.EXE -i c:\TeamCityBuildTools\DeploymentKeyConfig\Key.ppk -P 22 %login%@%target%:%webroot%%env% "net stop \"%servicename%\"" | echo

timeout /T 5

c:\TeamCityBuildTools\PLINK.exe -i c:\TeamCityBuildTools\DeploymentKeyConfig\Key.ppk -P 22 %login%@%target% C:\Windows\Microsoft.NET\Framework\v4.0.30319\InstallUtil -u  %webroot%%env%/%4 




