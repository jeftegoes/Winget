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
    "Python.Python.3.12",
    "REALiX.HWiNFO",
    "GitHub.cli",
    "JGraph.Draw",
    "Mobatek.MobaXterm",
    "Amazon.AWSCLI",
    "Logitech.GHUB"
)

$gui = @( # Next execution test script without --scope machine
    "Microsoft.VisualStudioCode",
    "Microsoft.VisualStudio.2022.Community"
)

$especial = @(
    "Insomnia.Insomnia"
)

function especial_installation {
    foreach ($currentApp in $especial) {
        Write-Host -ForegroundColor Yellow "Installing:" $currentApp
        winget install -e --silent --exact --scope machine --accept-source-agreements --accept-package-agreements --id $currentApp
        Write-Host -ForegroundColor Green "Installed:" $currentApp
    }
}

function silent_installation {
    foreach ($currentApp in $apps_silent) {
        Write-Host -ForegroundColor Yellow "Installing:" $currentApp
        winget install --silent --exact --scope machine --accept-source-agreements --accept-package-agreements $currentApp
        Write-Host -ForegroundColor Green "Installed:" $currentApp
    }
}

function gui_installation {
    foreach ($currentApp in $gui) {
        Write-Host -ForegroundColor Yellow "Installing:" $currentApp
        winget install --interactive --exact --scope machine --accept-source-agreements --accept-package-agreements $currentApp
        Write-Host -ForegroundColor Green "Installed:" $currentApp
    }
}

Clear-Host
Write-Warning "Starting installation..."

silent_installation
gui_installation
especial_installation

Write-Warning "Finished installation..."