SET target=%1
SET env=%2
SET login=ubuntu 
SET webroot=/var/www/%3/

c:\TeamCityBuildTools\PLINK -i c:\TeamCityBuildTools\DeploymentKeyConfig\sochanik.ppk -P 22 %login%@%target%:%webroot%%env%_deploy unzip x %webroot%%env%_deploy/site.zip -d %webroot%%env% -o














