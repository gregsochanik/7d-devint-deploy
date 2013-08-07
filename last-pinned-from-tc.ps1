#TeamCity settings
$teamCityServer = $args[0]
$buildId = $args[1]
$buildTag  = $args[2]

#Local settings
$live_deploy = "./_live_deploy"

IF (Test-Path $live_deploy)
{
	Remove-Item $live_deploy -Force -Recurse
}

md $live_deploy
md $live_deploy/sitefiles 

#pull down PROD site files
Invoke-WebRequest $teamCityServer/guestAuth/repository/download/$buildId/$buildTag.tcbuildtag/sitefiles/site.zip -OutFile $live_deploy/sitefiles/site.zip

#pull down PROD production environment files (e.g. web.config etc)
Invoke-WebRequest $teamCityServer/guestAuth/repository/download/$buildId/$buildTag.tcbuildtag/prod/prod.zip -OutFile $live_deploy/sitefiles/prod.zip

#pull down Smoke tests files (e.g. web.config etc)
Invoke-WebRequest $teamCityServer/guestAuth/repository/download/$buildId/$buildTag.tcbuildtag/smokes.zip -OutFile $live_deploy/smokes.zip

# pull down project deploy scripts
Invoke-WebRequest $teamCityServer/guestAuth/repository/download/$buildId/$buildTag.tcbuildtag/deploy.zip -OutFile $live_deploy/deploy.zip

# unpack NOTE - Cannot use the $live_deploy variable above as the lack of whitespace means ps parses it as a string literal
& C:\TeamCityBuildTools\7-Zip\7z.exe x $live_deploy/deploy.zip -y -o_live_deploy/