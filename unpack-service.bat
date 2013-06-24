SET target=%1
SET env=%2
SET login=sshduser
SET webroot=C:/inetpub/%3/
SET filename=%4
SET output=%5

c:\TeamCityBuildTools\PLINK -i c:\TeamCityBuildTools\DeploymentKeyConfig\Key.ppk -P 22 %login%@%target%:%webroot%%env%_deploy C:/7zip/7za.exe x %webroot%%env%_deploy/\*.zip -o%webroot%%env%/%output% -y