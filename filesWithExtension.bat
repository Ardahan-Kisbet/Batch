@echo off
REM @echo off is necessary to prevent displaying executed commands on terminal

@set fileExport=filesWithExtension.txt
REM if file is already exist then delete it
IF EXIST %fileExport% (
del %fileExport%
)


@set pattern=(*.xml)


for /r %%i in %pattern% do echo %%~ti %%~zi %%i >> %fileExport%