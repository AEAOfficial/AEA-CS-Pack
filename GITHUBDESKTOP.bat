:A
@echo off
set /p UPLOADMES="UploadMessage: "
set /p ANSWER="Are you sure you want to Upload with this message? "%UPLOADMES%" (y/n)"
if %ANSWER% == NUL GOTO A:
if %ANSWER% == n GOTO A:
if %ANSWER% == y GOTO B:
:B
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo Adding Changes
echo TimeStamp: %time%
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo %UPLOADMES%
git add .
git commit -a -m "%UPLOADMES%"
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo Testing for Changes
echo TimeStamp: %time%
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
git fetch origin
git pull origin
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo Pushing Changes
echo TimeStamp: %time%
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
git push origin
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo All Done! 
echo TimeStamp: %time%
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
pause
GOTO A: