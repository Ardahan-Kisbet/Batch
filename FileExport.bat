@echo off
REM @echo off is necessary to prevent displaying executed commands on terminal

REM since batchName is depends on envrionment we need to use ! instead of %
setlocal enabledelayedexpansion

REM set command does not takes whitespaces so do not keep whitespace between assignee and assign to
@set fileExport=fileExport.csv
@set currentPath=%cd%\%fileExport%
REM we will use this batch name to prevent exporting the batch file itself
@set batchName=%~nx0


REM if file is already exist then delete it
IF EXIST %fileExport% (
del %fileExport%
)

REM %%~nxf == fileExport.bat this conditions ensures that batch file itself will not go in exported list
for /R %%f in (*) do (
IF NOT %%~nxf == !batchName! (
@echo %%f >> %fileExport%
   )
 )