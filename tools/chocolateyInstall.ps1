$ErrorActionPreference = 'Stop';

$packageName = 'corsairlink';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)";

Get-ChocolateyWebFile -PackageName $packageName -File "$toolsDir\linkInstaller.zip" -Url 'http://downloads.corsair.com/download?item=Files/Corsair-Link/Corsair_LINK_Installer_v4.6.0.86.zip';
Get-ChocolateyUnzip -File "$toolsDir\linkInstaller.zip" -Destination "$toolsDir";
Get-ChocolateyUnzip -File "$toolsDir\Corsair-LINK-Installer-v4.6.0.86.zip" -Destination "$toolsDir";

$fileLocation = Join-Path $toolsDir "Corsair LINK Installer v4.6.0.86.exe";

$packageArgs = @{
  packageName   = $packageName
  fileType 	= 'EXE'
  file		= $fileLocation
  silentArgs	= '/quiet'
  validExitCodes= @(0)
  softwareName	= 'corsairlink*'
};

Install-ChocolateyInstallPackage @packageArgs;