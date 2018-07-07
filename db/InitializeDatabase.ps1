param(
    [Parameter(Mandatory=$true)]
    [string] $sa_password,

    [Parameter(Mandatory=$true)]
    [string] $db_name)


#restore db from bak file
Import-Module sqlps -disablenamechecking 
Add-Type -Path 'C:\Program Files\Microsoft SQL Server\140\SDK\Assemblies\Microsoft.SqlServer.Smo.dll' 
Add-Type -Path 'C:\Program Files\Microsoft SQL Server\140\SDK\Assemblies\Microsoft.SqlServer.SmoExtended.dll' 
$backupDeviceItem = new-object Microsoft.SqlServer.Management.Smo.BackupDeviceItem 'c:\backups\NerdDinner.bak', 'File' 
[Microsoft.SqlServer.Management.Smo.Server]$server = New-Object ('Microsoft.SqlServer.Management.Smo.Server') '.\SQLEXPRESS' 
$RelocateData = New-Object Microsoft.SqlServer.Management.Smo.RelocateFile('NerdDinner', 'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\NerdDinner.mdf') 
$RelocateLog = New-Object Microsoft.SqlServer.Management.Smo.RelocateFile('NerdDinner_log', 'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\NerdDinner.ldf') 
$restore = new-object 'Microsoft.SqlServer.Management.Smo.Restore' 
$restore.Database = 'NerdDinner' 
$restore.Devices.Add($backupDeviceItem) 
$restore.FileNumber = 1 
$restore.Action = 'Database' 
$restore.ReplaceDatabase = $true 
$restore.RelocateFiles.Add( $RelocateData) 
$restore.RelocateFiles.Add( $RelocateLog) 
$restore.SqlRestore($server) 
Remove-Item c:\backups\NerdDinner.bak -Force

Write-Verbose 'Changing SA login credentials'
$sqlcmd = "ALTER LOGIN sa with password='$sa_password'; ALTER LOGIN sa ENABLE;"
Invoke-Sqlcmd -Query $sqlcmd -ServerInstance $server

# relay SQL event logs to Docker
$lastCheck = (Get-Date).AddSeconds(-2) 
while ($true) { 
    Get-EventLog -LogName Application -Source "MSSQL*" -After $lastCheck | Select-Object TimeGenerated, EntryType, Message	 
    $lastCheck = Get-Date 
    Start-Sleep -Seconds 2 
}


