$apps = @(
    "OpenJS.NodeJS.LTS"
)

Clear-Host
Write-Warning "Starting installation..."

foreach ($currentApp in $apps) {
    Write-Host -ForegroundColor Yellow "Installing:" $currentApp
    winget install --silent --exact --scope machine $currentApp
    Write-Host -ForegroundColor Green "Installed:" $currentApp
}

Write-Warning "Finished installation..."