function Get-VersionFromGitTag {
    Write-Host "VersionFromGitTag"
    $tag = Get-GitTagOnLastCommit

    Write-Host "Tag '$tag'"

    $tag | Select-String -Pattern "^v(\d+\.\d+\.\d+(-.+)?)$" |
        Foreach-Object { $_.Matches } | Foreach-Object { $_.Groups[1] } | Select-Object -First 1
    
    Write-Host "Filtrada '$tag'"
}

function Get-GitTagOnLastCommit {
    ($tag = git describe --tags --exact-match) 2> $null
    if ($?) { $tag } else { $null }
}
