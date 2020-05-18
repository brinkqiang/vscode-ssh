pushd %~dp0setup

@echo off

for /f %%i in ('dir %~dp0setup\*.vsix /b') do (
            echo checking "%~dp0setup\%%i"
            code --install-extension "%~dp0setup\%%i"
            if errorlevel 1 (
                echo error: "%~dp0setup\%%i"
                goto FAILED
                )
            )

goto END

:FAILED
pause

:END

popd
