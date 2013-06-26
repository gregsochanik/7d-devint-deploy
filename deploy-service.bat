SET target=%1
SET env=%2
SET login=sshduser
SET webroot=%3

c:\TeamCityBuildTools\PLINK -i c:\TeamCityBuildTools\DeploymentKeyConfig\Key.ppk -P 22 %login%@%target%:%webroot% mkdir %webroot%%env%_deploy | echo 0

c:\TeamCityBuildTools\pscp\pscp -i c:\TeamCityBuildTools\DeploymentKeyConfig\Key.ppk -P 22 -r sitefiles/*.* %login%@%target%:%webroot%%env%_deploy