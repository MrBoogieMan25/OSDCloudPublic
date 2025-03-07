Write-Host -ForegroundColor Cyan "Starting My Custom OSDCloud Deployment"
Start-Sleep -Seconds 5

#Change Display Resolution for VM's
if ((Get-MyComputerModel) -match 'Virtual') {
  Write-Host -ForgroundColor Cyan "Setting Display Resolution to 1600x"
  Set-DisRes 1600
}

function Show-Menu {
    param (
        [string]$Title = 'OS Version Selection'
    )

    Clear-Host
    Write-Host "================ $Title ================"
    Write-Host "1: Press '1' to install Windows 10 Home."
    Write-Host "2: Press '2' to install Windows 11 Home"
    Write-Host "3: Press '3' to install Windows 11 24H2 Enterprise"
    Write-Host "4: Press '4' for custom installation."
    Write-Host "c: Press 'c' to cancle."
}

Show-Menu -Title 'OS Version Selection'

$selection = Read-Host "Select your preferred OS installation method"

switch ($selection) {
    '1' {
        Write-Host "Install started for Windows 10 Home"
        Start-OSDCloud -OSName 'Windows 10 24h2 x64' -OSLanguage en-us -OSEdition Home -ZTI

    }
    '2' {
        Write-Host "Starting Install for Windows 11 Home"
        Start-OSDCloud -OSName 'Windows 11 24h2 x64' -OSLanguage en-us -OSEdition Home -ZTI
    }
    '3' {
        Write-Host "Starting Install for Windows 11 24H2 Enterprise"
        Start-OSDCloud -OSName 'Windows 11 24h2 x64' -OSLanguage en-us -OSEdition Enterprise -ZTI
    }
    '4' {
        Write-Host "Launching OSDCloudGUI for custom selection"
        Start-OSDCloudGUI -BrandName 'Custom OS Deployment' -BrandColor 'Cyan'
    }
    'c' {
        # Quit the menu
        return
    }
}
