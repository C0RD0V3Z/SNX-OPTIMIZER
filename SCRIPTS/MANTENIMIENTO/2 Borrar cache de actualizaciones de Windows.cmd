@echo off
title snipexOS
echo Batch File By SNX!
net stop wuauserv
net stop UsoSvc
net stop bits
net stop dosvc
rd /s /q C:\Windows\SoftwareDistribution
md C:\Windows\SoftwareDistribution
pause