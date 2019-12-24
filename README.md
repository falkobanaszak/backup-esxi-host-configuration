# Backing up ESXi host configuration with VMware PowerCLI

This PowerCLI script lets you back up your ESXi hosts by connecting to a vCenter Server and backing up the firmware of the available ESXi hosts.

Simply execute the script and follow the steps to fill in the relevant data like an IP address, the username, your password and your destination path in which you want to save the backup files.

![Execution of the Script](https://github.com/falkobanaszak/backup-esxi-host-configuration/blob/master/executing_the_script.png)

After executing the script you will need to fill out the necessary information to connect to the vCenter Server and therefore to backup th ESXi host configuration.

![Filled out information](https://github.com/falkobanaszak/backup-esxi-host-configuration/blob/master/filled_out_script.png)

After you provided all the information, the scripts starts to backup the ESXi host and places the files into your desired location.

![Backup Process](https://github.com/falkobanaszak/backup-esxi-host-configuration/blob/master/backup_process.png)

The script shows a progress bar while backing up the ESXi host.

After the backup is successful, your screen should look like this:

![Finished Backup](https://github.com/falkobanaszak/backup-esxi-host-configuration/blob/master/finished_backup.png)

You can check your path where you wanted to place your backups if the ESXi host backup bundles appear:

![Check for the files](https://github.com/falkobanaszak/backup-esxi-host-configuration/blob/master/check_for_files.png)

You can get the script here: [Backup ESXi Host Configuration](https://github.com/falkobanaszak/backup-esxi-host-configuration/blob/master/Backup_ESXi_Host_Configuration.ps1)
