:A
@echo off
set /p UPLOADMES="UploadMessage: "
set /p ANSWER="Are you sure you want to Upload with this message? "%UPLOADMES%" (y/n)"

if %ANSWER% == NUL GOTO A:
if %ANSWER% == n GOTO A:
if %ANSWER% == y GOTO B:
:B
git diff
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo Testing for Changes
echo TimeStamp: %time%
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
git fetch origin
git pull origin
timeout 10 > NUL
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo Uploading Changes
echo TimeStamp: %time%
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo %UPLOADMES%
git add .
git commit -a -m "%UPLOADMES%"
git push
timeout 10 > NUL
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo  Changes Pushed
echo TimeStamp: %time%
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo You may close or continue 
pause
GOTO A: