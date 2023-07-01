$apps_silent = @(
    "OpenJS.NodeJS.LTS",
    "Notepad++.Notepad++",
    "WinMerge.WinMerge",
    "Mozilla.Firefox",
    "Valve.Steam",
    "VideoLAN.VLC",
    "Git.Git",
    "Microsoft.SQLServerManagementStudio",
    "7zip.7zip",
    "Python.Python.3.11",
    "9NKSQGP7F2NH" # WhatsApp
)

$gui = @( # Next execution test script without --scope machine
    "Microsoft.VisualStudioCode",
    "Microsoft.VisualStudio.2022.Community"
)

function silent_installation {
    foreach ($currentApp in $apps_silent) {
        Write-Host -ForegroundColor Yellow "Installing:" $currentApp
        winget install --silent --exact --scope machine $currentApp
        Write-Host -ForegroundColor Green "Installed:" $currentApp
    }
}

function gui_installation {
    foreach ($currentApp in $gui) {
        Write-Host -ForegroundColor Yellow "Installing:" $currentApp
        winget install --interactive --exact --scope machine $currentApp
        Write-Host -ForegroundColor Green "Installed:" $currentApp
    }
}

Clear-Host
Write-Warning "Starting installation..."

silent_installation
# gui_installation

Write-Warning "Finished installation..."