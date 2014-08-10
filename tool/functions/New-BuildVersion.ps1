$here = Split-Path -Parent $MyInvocation.MyCommand.Definition
. "$here\Get-VersionFromGitTag.ps1"

function New-BuildVersion {
    Write-Host "New-BuildVersion"
    $buildNumber = Get-AppveyorBuildNumber
    $version = Get-VersionFromGitTag

    Write-Host "BuildNumber '$buildNumber'"
    Write-Host "Version '$version'"

    if ($version) { "$version+$buildNumber" } else { $buildNumber }
    Write-Host "New-BuildVersion-End"
}

function Get-AppveyorBuildNumber {
    $env:APPVEYOR_BUILD_NUMBER
}
