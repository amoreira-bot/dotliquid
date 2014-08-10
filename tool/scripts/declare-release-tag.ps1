$here = Split-Path -Parent $MyInvocation.MyCommand.Definition
$functions = Join-Path (Split-Path -Parent $here) 'functions'
. "$functions\Get-VersionFromGitTag.ps1"

if ($env:APPVEYOR) {
    Push-Location $env:APPVEYOR_BUILD_FOLDER

    $version = Get-VersionFromGitTag
    Write-Host "version '$version'"

    $variable = "release_tag"
    $value = "true"
    Write-Host "Setting environment variable '$variable' to '$value'"
    [environment]::SetEnvironmentVariable($variable, $value, "Process")
    
    Write-Host "Pop-Location"
    Pop-Location
}

Write-Host "DEPOIS do IF"
