@ECHO OFF
TITLE Remote Build
set gameName=TaiFighter

:start
echo.
echo WARNING: You MUST be using x64 Native Tools Command Prompt for VS2019 to be able to use this batch file
set /P remOrLocal="Do you want to make a local build (L) or do you have the engine files elsewhere? (R) "
IF '%remOrLocal%'=='L' GOTO localBuild
IF '%remOrLocal%'=='l' GOTO localBuild
IF '%remOrLocal%'=='R' GOTO remoteChoicePrompt
IF '%remOrLocal%'=='r' GOTO remoteChoicePrompt
echo "%remOrLocal%" is not valid
echo.
GOTO start

:localBuild
call UpdateSubmodule.bat
cd PTSD-Engine
call build.bat
cd ..\
set remFolder=PTSD-Engine\bin
GOTO copyFiles

:remoteChoicePrompt
echo.
set /p choice="Do you want to build (B) or just copy the bin folder (C)? "
IF '%choice%'=='B' GOTO build
IF '%choice%'=='b' GOTO build
IF '%choice%'=='C' GOTO setRemoteFolder
IF '%choice%'=='C' GOTO setRemoteFolder
echo "%choice%" is not valid
echo.
GOTO remoteChoicePrompt

:build
echo. && echo Input the filepath for where your engine .sln is located
set /p engineFolder="Example: C:\User\PTSD-Engine\: "
set remFodler=%engineFolder%\bin
set prevFolder=%CD%
cd engineFolder
call build.bat
cd prevFolder
GOTO copyFiles

:setRemoteFolder
echo. && echo Input the filepath for where your bin folder is
set /p remFolder="Example: C:\User\PTSD-Engine\bin: "
GOTO copyFiles

:copyFiles
echo Copying engine files...
robocopy %remFolder% bin\ /s /e /NFL /NDL /NJH /NJS /nc /ns /np

echo Copying game files...
robocopy %gameName%\assets bin\assets /s /e /NFL /NDL /NJH /NJS /nc /ns /np
robocopy %gameName%\scripts bin\assets\scripts\Client /s /e /NFL /NDL /NJH /NJS /np

echo.
echo All done!