@ECHO OFF
SETLOCAL ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION

REM ############################################################################
REM #
REM #   BUILD Externals
REM #

IF %MODE%==debug (
	echo Skipping debug builds of externals
	GOTO :EOF
)

ECHO Building Externals

CALL "%~dp0\build-external.bat" mergJSON "https://github.com/montegoulding/mergjson.git"

ECHO Finished building externals for all configurations
