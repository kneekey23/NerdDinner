FROM microsoft/mssql-server-windows-express

SHELL ["powershell"]

RUN mkdir c:\backups
COPY NerdDinner.bak /backups/NerdDinner.bak

RUN powershell -Command \
Import-Module sqlps -disablenamechecking; \
Add-Type -Path 'C:\Program Files\Microsoft SQL Server\140\SDK\Assemblies\Microsoft.SqlServer.Smo.dll'; \
Add-Type -Path 'C:\Program Files\Microsoft SQL Server\140\SDK\Assemblies\Microsoft.SqlServer.SmoExtended.dll'; \
$backupDeviceItem = new-object Microsoft.SqlServer.Management.Smo.BackupDeviceItem 'c:\backups\NerdDinner.bak', 'File'; \
[Microsoft.SqlServer.Management.Smo.Server]$server = New-Object ('Microsoft.SqlServer.Management.Smo.Server') '.\SQLEXPRESS'; \
$RelocateData = New-Object Microsoft.SqlServer.Management.Smo.RelocateFile('NerdDinner', 'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\NerdDinner.mdf'); \
$RelocateLog = New-Object Microsoft.SqlServer.Management.Smo.RelocateFile('NerdDinner_log', 'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\NerdDinner.ldf'); \
$restore = new-object 'Microsoft.SqlServer.Management.Smo.Restore'; \
$restore.Database = 'NerdDinner'; \
$restore.Devices.Add($backupDeviceItem); \
$restore.FileNumber = 1; \
$restore.Action = 'Database'; \
$restore.ReplaceDatabase = $true; \
$restore.RelocateFiles.Add( $RelocateData); \
$restore.RelocateFiles.Add( $RelocateLog); \
$restore.SqlRestore($server); \
$error[0]|format-list –force; \
Remove-Item c:\backups\NerdDinner.bak -Force;

EXPOSE 1433
RUN mkdir c:\volumes
VOLUME ["c:/volumes"]