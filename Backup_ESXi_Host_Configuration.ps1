<#
.SYNOPSIS
    Backup_ESXi_Host_Configuration.ps1 - PowerShell Script to backup ESXi host configuration. 
.DESCRIPTION
    This script is used to backup the ESXi host configuration.
    The script backs up your ESXi host configuration to a desired path and attaches the current date and time to it.  
.OUTPUTS
    Results are printed to the console and ESXi host configuration is being saved to the given path.
.NOTES
    Author        Falko Banaszak, https://virtualhome.blog, Twitter: @Falko_Banaszak
    
    Change Log    V1.00, 23/12/2019 - Initial version 
.LICENSE
    MIT License
    Copyright (c) 2019 Falko Banaszak
    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:
    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.
    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
    SOFTWARE.
#>
# Write Progress variables
$Activity = "Backing up the ESXi Host firmware to your destination"
$ID = 1
$Task = "Please wait, backing up..."

# Load the PowerCLI SnapIn
Add-PSSnapin VMware.VimAutomation.Core -ea "SilentlyContinue"

# Get the vCenter Server Name to connect to
$vCenterServer = read-host "Enter vCenter Server host name (DNS with FQDN or IP address)"

# Get User to connect to vCenter Server
$vCenterUser = read-host "Enter your user name (DOMAIN\User or user@domain.com)"

# Get Password to connect to the vCenter Server
$vCenterUserPassword = read-host "Enter your password (no worries it is a secure string)" -AsSecureString:$true

# Get the path where the backup should be written to
$DestinationPath = Read-Host "Enter the path where you wish to store the backup file"

# Write the Progress in the PowerShell console
Write-Progress -ID $ID -Activity $Activity -Status $Task

# Collect Username and Password as Credential
$Credentials = New-Object System.Management.Automation.PSCredential -ArgumentList $vCenterUser,$vCenterUserPassword

# Connect to the vCenter Server with collected credentials
Connect-VIServer -Server $vCenterServer -Credential $Credentials
Write-Host "Connected to your vCenter server $vCenterServer" -ForegroundColor Green

# Backing up the ESXi host firmware to the desired path
Get-VMHost | Get-VMHostFirmware -BackupConfiguration -DestinationPath $DestinationPath
Write-Host "Successfully backed up the configuration of the host of $vCenterServer to $DestinationPath" -ForegroundColor Green

# Disconnecting from the vCenter Server
Disconnect-VIServer -Confirm:$false
Write-Host "Disconnected from your vCenter Server $vCenterServer - have a great day :)" -ForegroundColor Green