SET target=%1
SET env=%2
SET servicename=%3
SET file=%4
SET login=sshduser
SET webroot=%5

c:\TeamCityBuildTools\PLINK.EXE -i c:\TeamCityBuildTools\DeploymentKeyConfig\Key.ppk -P 22 %login%@%target%:%webroot%%env% C:/Windows/Microsoft.NET/Framework/v4.0.30319/InstallUtil %webroot%%env%/%file% 

c:\TeamCityBuildTools\PLINK.EXE -i c:\TeamCityBuildTools\DeploymentKeyConfig\Key.ppk -P 22 %login%@%target%:%webroot%%env% net start %servicename%
