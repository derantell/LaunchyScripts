@echo off
@set command=[System.Web.HttpUtility]::UrlEncode('%1')
powershell.exe -Command "add-type -a System.Web;%command%|clip;"