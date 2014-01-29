@echo off
setlocal enableDelayedExpansion
if exist epims_platform.conf (
	for /f "delims=" %%x in (epims_platform.conf) do (
		set str=%%x
		if not "!str:~0,1!" == "#" set "%%x" 
	) 
) 

set JAVA=java
if not "%JAVA_HOME%" == "" set JAVA=%JAVA_HOME%\bin\java

echo.
echo.========================================================================
echo.
echo   Platform    : Osiris3 Client Platform 
echo   Application : ePIMS Version 1.0
echo.
echo   JAVA_HOME   : %JAVA_HOME%
echo   JAVA_OPTS   : %JAVA_OPTS%
echo   JAVA        : %JAVA%
echo.
echo.========================================================================
echo.

"%JAVA%" %JAVA_OPTS% -cp lib/ext/%PROCESSOR_ARCHITECTURE%;lib/*;. com.rameses.osiris3.platform.OSBootStrap
endlocal
