param( 
    [String]$versionToBuild="0.0.0"
)

$applicationName = "BuildNotifications"
$repo = "grollmus/$applicationName"
$targetFolder = "Releases"

$squirrelUrl = "https://github.com/Squirrel/Squirrel.Windows/releases/download/1.9.1/Squirrel.Windows-1.9.1.zip"
$nugetUrl = "https://dist.nuget.org/win-x86-commandline/latest/nuget.exe"

###############################################################################
Write-Output "Determining latest release"
$latestReleaseUrl = "https://api.github.com/repos/$repo/releases"
$tag = (Invoke-WebRequest $latestReleaseUrl | ConvertFrom-Json)[0].tag_name
$version = $tag
if($tag)
{
	New-Item -ItemType Directory -Force -Path $targetFolder

	if( $version.StartsWith("v") )
	{
		$version = $tag.Substring(1)
	}
    Write-Output "Latest release is $tag => $version"

    Write-Output "Downloading latest RELEASE file"
    $releasesFileUrl = "https://github.com/$repo/releases/download/$tag/RELEASES";
    $releasesFilePath = "$targetFolder/RELEASES"
    Invoke-WebRequest $releasesFileUrl -Out $releasesFilePath

    Write-Output "Downloading latest full package"    
    $fullPackageFileName = "$applicationName-$version-full.nupkg"
    $fullPackageUrl = "https://github.com/$repo/releases/download/$tag/$fullPackageFileName"
    $fullPackageFilePath = "$targetFolder/$fullPackageFileName"
    Invoke-WebRequest $fullPackageUrl -Out $fullPackageFilePath
}

Write-Output "Downloading squirrel"
$squirrelZipFile = "Squirrel.zip"
Invoke-WebRequest $squirrelUrl -Out $squirrelZipFile
Expand-Archive $squirrelZipFile -Force -DestinationPath .

Write-Output "Downloading nuget.exe"
Invoke-WebRequest $nugetUrl -Out "nuget.exe"

Write-Output "Preparing files for nuget package"
Move-Item -Path "ToastNotificationsPlugin\bin\Release\BuildNotifications.PluginInterfacesLegacy.dll" -Destination "BuildNotifications\bin\Release\netcoreapp3.1\win-x64\publish\BuildNotifications.PluginInterfacesLegacy.dll" -Force

Write-Output "Creating nuget package"
$nuspecFileName = "Scripts/$applicationName.nuspec" 
$nupkgFileName = "$applicationName.$versionToBuild.nupkg"
.\nuget.exe pack $nuspecFileName -Version $versionToBuild

Write-Output "Creating squirrel release"
$arguments = "--releasify",$nupkgFileName,"--no-msi"
Start-Process -FilePath ".\squirrel.exe" -ArgumentList $arguments -PassThru | Wait-Process

Get-Content -Path SquirrelSetup.log

Write-Output "Cleaning up"
$latestFullPackageFileName = "$applicationName-$version-full.nupkg"
Remove-Item -Path "$targetFolder/$latestFullPackageFileName"

Write-Output Done