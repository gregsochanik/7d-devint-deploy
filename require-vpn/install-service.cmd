SET target=%1
SET env=%2
SET file=%3
SET login=sshduser
SET webroot=%4

c:\TeamCityBuildTools\PLINK.exe -i c:\TeamCityBuildTools\DeploymentKeyConfig\Key.ppk -P 22 %login%@%target% C:/Windows/Microsoft.NET/Framework/v4.0.30319/InstallUtil.exe %webroot%%env%/%3 





