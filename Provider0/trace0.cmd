@echo off

setlocal
pushd "%~dp0"

set name=trace_test0
set guid={FF5D07C6-03BA-481F-B07F-97CB8A51FADF}

if exist "%~dp0%name%*.etl" del "%~dp0%name%*.etl"
if exist "%~dp0%name%*.xml" del "%~dp0%name%*.xml"

logman start trace %name% -p %guid% -o "%~dp0%name%.etl" -ets

Provider0.exe

logman stop "%name%" -ets

tracerpt "%~dp0%name%.etl" -o "%~dp0%name%.xml"

popd
endlocal

exit /b
