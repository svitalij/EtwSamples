@echo off

setlocal
pushd "%~dp0"

set manifest=%~dp0ProviderManifest1.man
set resource=%~dp0Provider1.exe

icacls "%resource%" /grant "NT AUTHORITY\Local Service":RX /Q
wevtutil.exe im "%manifest%" /rf:"%resource%" /mf:"%resource%" /pf:"%resource%"

popd
endlocal

exit /b
