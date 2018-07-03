# escape=`
FROM microsoft/dotnet-framework:4.7.2-sdk AS builder

WORKDIR C:\src
COPY *.sln .
COPY NerdDinner\NerdDinner.csproj .\NerdDinner\
RUN nuget restore

COPY . C:\src
RUN msbuild NerdDinner\NerdDinner.csproj /p:OutputPath=c:\out /p:Configuration=Release

# app image
FROM microsoft/aspnet:4.7.2-windowsservercore-ltsc2016
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop';"]

ENV APP_ROOT=C:\web-app

WORKDIR ${APP_ROOT}
RUN Remove-Website -Name 'Default Web Site';`
    New-Website -Name 'web-app' -Port 80 -PhysicalPath $env:APP_ROOT; `
    New-WebApplication -Name 'app' -Site 'web-app' -PhysicalPath $env:APP_ROOT

COPY --from=builder C:\out\_PublishedWebsites\NerdDinner .