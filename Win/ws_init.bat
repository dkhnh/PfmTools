@ECHO OFF
REM The directory containing this file.
SET EXDIR=%~dp0

REM WS tree
SET WS_HOME=D:\Workspace
SET WS_ART=Art
SET WS_PROJECTS=Projects
SET WS_CENTER=Center
SET WS_FACTORY=Factory
SET WS_LAB=Lab
SET WS_LIBRARY=Library
SET WS_TEMP=Temp
SET WS_UTILS=WSUtils

REM Create workspace dicrectory if it doesn't exists.
IF NOT EXIST %WS_HOME%\NUL (
  ECHO run MKDIR %WS_HOME%
	MKDIR %WS_HOME%
)

REM Create ART dicrectory if it doesn't exists.
IF NOT EXIST %WS_HOME%\%WS_ART%\NUL (
  ECHO run MKDIR %WS_HOME%\%WS_ART%
	MKDIR %WS_HOME%\%WS_ART%
)

REM Create PROJECTS dicrectory if it doesn't exists.
IF NOT EXIST %WS_HOME%\%WS_PROJECTS%\NUL (
  ECHO run MKDIR %WS_HOME%\%WS_PROJECTS%
	MKDIR %WS_HOME%\%WS_PROJECTS%
)

REM Create CENTER dicrectory if it doesn't exists.
IF NOT EXIST %WS_HOME%\%WS_CENTER%\NUL (
  ECHO run MKDIR %WS_HOME%\%WS_CENTER%
	MKDIR %WS_HOME%\%WS_CENTER%
)

REM Create FACTORY dicrectory if it doesn't exists.
IF NOT EXIST %WS_HOME%\%WS_FACTORY%\NUL (
  ECHO run MKDIR %WS_HOME%\%WS_FACTORY%
	MKDIR %WS_HOME%\%WS_FACTORY%
)

REM Create LAB dicrectory if it doesn't exists.
IF NOT EXIST %WS_HOME%\%WS_LAB%\NUL (
  ECHO run MKDIR %WS_HOME%\%WS_LAB%
	MKDIR %WS_HOME%\%WS_LAB%
)

REM Create LIBRARY dicrectory if it doesn't exists.
IF NOT EXIST %WS_HOME%\%WS_LIBRARY%\NUL (
  ECHO run MKDIR %WS_HOME%\%WS_LIBRARY%
	MKDIR %WS_HOME%\%WS_LIBRARY%
)

REM Create TEMP dicrectory if it doesn't exists.
IF NOT EXIST %WS_HOME%\%WS_TEMP%\NUL (
  ECHO run MKDIR %WS_HOME%\%WS_TEMP%
	MKDIR %WS_HOME%\%WS_TEMP%
)

REM Create TEMP dicrectory if it doesn't exists.
IF NOT EXIST %EXDIR%\%WS_UTILS%\NUL (
  ECHO %WS_UTILS% not found
  ECHO run RMDIR /Q /S %WS_HOME%
  RMDIR /Q /S %WS_HOME%
  GOTO ENDEX
)

REM Copy WS_UTILS to WS_CENTER
ECHO run Xcopy /E /I /Y %EXDIR%\%WS_UTILS% %WS_HOME%\%WS_CENTER%\%WS_UTILS%
Xcopy /E /I /Y %EXDIR%\%WS_UTILS% %WS_HOME%\%WS_CENTER%\%WS_UTILS%

ECHO Please^! Add WS_HOME=%WS_HOME% to the environment,
ECHO and add %WS_HOME%\%WS_CENTER%;%WS_HOME%\%WS_CENTER%\%WS_UTILS% to path

:ENDEX
EXIT /B 0
