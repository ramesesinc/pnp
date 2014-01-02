@echo off

rem Specify the java home directory 
rem set JAVA_HOME=C:\Program Files\Java\jdk1.7.0_45

rem Specify some java options
set JAVA_OPTS=-Xmx512m

rem build the java command 
set JAVA=java
if not "%JAVA_HOME%" == "" set JAVA=%JAVA_HOME%\bin\java

echo.
echo.========================================================================
echo.
echo   Platform    : Osiris3 Client Platform 
echo   Application : ePMS Version 1.0
echo.
echo   JAVA_HOME   : %JAVA_HOME%
echo   JAVA_OPTS   : %JAVA_OPTS%
echo   JAVA        : %JAVA%
echo.
echo.========================================================================

"%JAVA%" %JAVA_OPTS% -cp lib/ext/%PROCESSOR_ARCHITECTURE%;lib/*;. com.rameses.osiris3.platform.OSBootStrap
pause
