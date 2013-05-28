SET target=%1
SET env=%2
SET login=sshduser
SET webroot=%3

c:\TeamCityBuildTools\PLINK -i c:\TeamCityBuildTools\DeploymentKeyConfig\Key.ppk -P 22 %login%@%target%:%webroot%%env% cp %webroot%%env%/Web.configtemp.%env% %webroot%%env%/Web.config -rf

c:\TeamCityBuildTools\PLINK -i c:\TeamCityBuildTools\DeploymentKeyConfig\Key.ppk -P 22 %login%@%target%:%webroot%%env% rm %webroot%%env%/Web.configtemp* -rf