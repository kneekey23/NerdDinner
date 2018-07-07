FROM microsoft/mssql-server-windows-express

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop';"]

EXPOSE 1433
RUN mkdir c:\volumes
VOLUME ["c:/volumes"]
ENV sa_password Iloveaws!

RUN mkdir c:\backups
COPY NerdDinner.bak /backups/NerdDinner.bak
RUN mkdir c:\init
COPY InitializeDatabase.ps1 /init/InitializeDatabase.ps1

CMD ./init/InitializeDatabase.ps1 -sa_password $env:sa_password -db_name NerdDinner -Verbose  

