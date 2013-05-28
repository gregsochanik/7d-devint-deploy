SET target=%1
SET env=%2
SET login=ubuntu
SET webroot=/var/www/%3/

c:\TeamCityBuildTools\pscp\pscp -i c:\TeamCityBuildTools\DeploymentKeyConfig\sochanik.ppk -P 22 -r sitefiles/*.* %login%@%target%:%webroot%%env%_deploy