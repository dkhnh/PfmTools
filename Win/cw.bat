@ECHO OFF
REM The directory containing this file.
SET EXDIR=%~dp0

REM Dynamic workspace dicrectory.
SET DWS=..\DWS\c

REM Text editor
SET TEDT=code

REM Extension
SET EXT=c

REM Open dynamic workspace
SET ODWS=explorer

REM Create dynamic workspace dicrectory IF it doesn't exists.
IF NOT EXIST %EXDIR%%DWS%\NUL (
	mkdir %EXDIR%%DWS%
)

REM Check arguments.
IF "%1" == "" (
	GOTO HELP
)

REM For command: new
IF "%1" == "new" (
	IF "%2" == "" (
		GOTO CWRER
	)
	
	GOTO ARGVS
)

REM For command: del
IF "%1" == "del" (
	IF "%2" == "" (
		GOTO CWRER
	)
	
	REM For command: pws rm .
	REM Delete all %EXT% files.
	IF "%2" == "." (
		IF "%3" == "" (
			del %EXDIR%%DWS%\*.%EXT%
			GOTO ENDEX
		)
	)
	
	GOTO ARGVS
)

REM For command: op
IF "%1" == "op" (
	IF "%2" == "" (
		GOTO CWRER
	)
	
	REM For command: pws op .
	REM Delete all %EXT% files.
	IF "%2" == "." (
		IF "%3" == "" (
			%TEDT% %EXDIR%%DWS%\*.%EXT%
			GOTO ENDEX
		)
	)
	
	GOTO ARGVS
)

REM For command: run
IF "%1" == "run" (
	IF "%2" == "" (
		GOTO CWRER
	)
	
	GOTO ARGVS
)

REM For commands with a specified number of arguments
REM For command: pws ls
REM Show list %EXT% file.
IF "%1" == "ls" (
	IF NOT "%2" == "" (
		GOTO CWRER
	)
	
	FOR %%i IN (%EXDIR%%DWS%\*.%EXT%) DO (
		ECHO %%~ni
	)
	
	GOTO ENDEX
)

REM For command: pws ws
REM Open dynamic workspace dicrectory with '%ODWS%'.
IF "%1" == "ws" (
	IF NOT "%2" == "" (
		GOTO CWRER
	)
	
	%ODWS% %EXDIR%%DWS%
	
	GOTO ENDEX
)

REM For command: pws gtd
REM Go to dynamic workspace dicrectory.
IF "%1" == "gtd" (
	IF NOT "%2" == "" (
		GOTO CWRER
	)
	
	cd %EXDIR%%DWS%
	
	GOTO ENDEX
)

REM For command: pws help
REM Show all helps.
IF "%1" == "help" (
	IF NOT "%2" == "" (
		GOTO CWRER
	)
	:HELP
	ECHO new   ^<FILE NAME^> .. [FILE NAME]
	ECHO       Create new %EXT% files.
	ECHO del   ^<FILE NAME^> .. [FILE NAME]
	ECHO       Delete %EXT% files.
	ECHO op    ^<FILE NAME^> .. [FILE NAME]
	ECHO       Op %EXT% files with '%TEDT%'.
	ECHO run   ^<FILE NAME^> [ARGUMENTS]
	ECHO       Compile and run a %EXT% file.
	ECHO ls    Show %EXT% file list.
	ECHO ws    Open dynamic workspace dicrectory with '%ODWS%'.
	ECHO help  Show all helps.
	ECHO.
	ECHO Shortcut commands:
	ECHO del   .
	ECHO       Delete all %EXT% files in dynamic workspace dicrectory.
	ECHO op    .
	ECHO       Open all %EXT% files in dynamic workspace dicrectory.
	ECHO ^<FILE NAME^>
	ECHO       Create a new %EXT% file and opening it with '%TEDT%' if it doesn't not exists.
	ECHO ^<FILE NAME^> [ARGUMENTS]
	ECHO       Run and compile a %EXT% file if it exist.
	
	GOTO ENDEX
)

REM For shortcut command: dws <FILE NAME>
REM Create a new %EXT% file and opening it with %TEDT% if it doesn't not exists.
if NOT EXIST %EXDIR%%DWS%\%1.%EXT% (
	if "%2" == "" (
		ECHO #include ^<stdio.h^>>> %EXDIR%%DWS%\%1.%EXT%
		ECHO.>> %EXDIR%%DWS%\%1.%EXT%
		ECHO int main^(int args, char **argv^) ^{>> %EXDIR%%DWS%\%1.%EXT%
		ECHO. 	>> %EXDIR%%DWS%\%1.%EXT%
		ECHO 	return 0;>> %EXDIR%%DWS%\%1.%EXT%
		ECHO ^}>> %EXDIR%%DWS%\%1.%EXT%
		
		%TEDT% %EXDIR%%DWS%\%1.%EXT%
		
		GOTO ENDEX
	) ELSE (
		GOTO CWRER
	)
)

REM For commands with an unknown number of arguments
:ARGVS

SET FARGV=%1
SET ARGV=
:ARGVLOOP
SHIFT
IF "%1"=="" (
	GOTO EARGVLOOP
)
SET ARGV=%ARGV% %1
GOTO ARGVLOOP
:EARGVLOOP

REM For command: pws new <FILE NAME> .. [FILE NAME]
REM Create new %EXT% files.
IF "%FARGV%" == "new" (
	FOR %%i IN (%ARGV%) DO (
		IF EXIST %EXDIR%%DWS%\%%i.%EXT% (
			ECHO %%i: File already exists.
		) ELSE (
			ECHO #include ^<stdio.h^>>> %EXDIR%%DWS%\%%i.%EXT%
			ECHO.>> %EXDIR%%DWS%\%%i.%EXT%
			ECHO int main^(int args, char **argv^) ^{>> %EXDIR%%DWS%\%%i.%EXT%
			ECHO.	>> %EXDIR%%DWS%\%%i.%EXT%
			ECHO 	return 0;>> %EXDIR%%DWS%\%%i.%EXT%
			ECHO ^}>> %EXDIR%%DWS%\%%i.%EXT%
		)
	)
	GOTO ENDEX
)

REM For command: dws del <FILE NAME> .. [FILE NAME]
REM Delete %EXT% files.
IF "%FARGV%" == "del" (
	FOR %%i IN (%ARGV%) DO (
		IF NOT EXIST %EXDIR%%DWS%\%%i.%EXT% (
			ECHO %%i.%EXT%: No such file.
		) ELSE (
			IF EXIST %EXDIR%%DWS%\%%i.%EXT%\NUL (
				ECHO %%i.%EXT%: No such file.
			) ELSE (
				del %EXDIR%%DWS%\%%i.%EXT%
			)
		)
	)
	GOTO ENDEX
)

REM For command: dws op <FILE NAME> .. [FILE NAME]
REM Open %EXT% files.
IF "%FARGV%" == "op" (
	FOR %%i IN (%ARGV%) DO (
		IF NOT EXIST %EXDIR%%DWS%\%%i.%EXT% (
			ECHO %%i.%EXT%: No such file.
		) ELSE (
			IF EXIST %EXDIR%%DWS%\%%i.%EXT%\NUL (
				ECHO %%i.%EXT%: No such file.
			) ELSE (
				%TEDT% %EXDIR%%DWS%\%%i.%EXT%
			)
		)
	)
	GOTO ENDEX
)

REM For command: dws run <FILE NAME> [ARGUMENTS]
REM Compile and run a %EXT% file.
IF "%FARGV%" == "run" (
	IF NOT EXIST %EXDIR%%DWS%\%2.%EXT% (
		ECHO %2.%EXT%: No such file.
		exit /b 3
	) ELSE (
		IF EXIST %EXDIR%%DWS%\%2.%EXT%\NUL (
			ECHO %2.%EXT%: No such file.
			exit /b 3
		) ELSE (
			g++ -o %EXDIR%%DWS%\%2.exe %EXDIR%%DWS%\%2.%EXT%
			%EXDIR%%DWS%\%2.exe %ARGV%
			del %EXDIR%%DWS%\%2.exe
		)
	)
	
	GOTO ENDEX
)

REM For shortcut command: dws <FILE NAME> [ARGUMENTS]
REM Run and compile a %EXT% file if it exist.
if EXIST %EXDIR%%DWS%\%FARGV%.%EXT% (
	g++ -o %EXDIR%%DWS%\%FARGV%.exe %EXDIR%%DWS%\%FARGV%.%EXT%
	%EXDIR%%DWS%\%FARGV%.exe %ARGV%
	del %EXDIR%%DWS%\%FARGV%.exe
	
	GOTO ENDEX
)

:CWRER
ECHO This command is wrong.
exit /b 1

:ENDEX
exit /b 0