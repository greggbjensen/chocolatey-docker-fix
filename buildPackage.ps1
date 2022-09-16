$packageName = 'chocolatey.1.1.0'
$packagePath = "$PSScriptRoot\dist\$packageName-patched.nupkg"

Write-Host "Cleaning package."
if (Test-Path $packagePath) {
    Remove-Item $packagePath
}

Write-Host "Compressing archive."
$compress = @{
    Path = "$PSScriptRoot\src\$packageName\**"
    CompressionLevel = "Fastest"
    DestinationPath = "$PSScriptRoot\dist\$packageName.zip"
}
Compress-Archive @compress

Write-Host "Renaming package."
Rename-Item "$PSScriptRoot\dist\$packageName.zip" $packagePath

Write-Host "Update complete." -ForegroundColor Green
