SET target=%1
SET env=%2
SET login=sshduser
SET webroot=C:\inetpub\%3\

c:\TeamCityBuildTools\PLINK -i c:\TeamCityBuildTools\DeploymentKeyConfig\Key.ppk -P 22 %login%@%target%:%webroot%%env% copy %webroot%%env%\Web.configtemp.%env% %webroot%%env%\Web.config /Y

c:\TeamCityBuildTools\PLINK -i c:\TeamCityBuildTools\DeploymentKeyConfig\Key.ppk -P 22 %login%@%target%:%webroot%%env% del %webroot%%env%\Web.configtemp* /Q /F