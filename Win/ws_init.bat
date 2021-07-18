@ECHO OFF
REM The directory containing this file.
SET EXDIR=%~dp0

# WS tree
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
IF NOT EXIST %WS_HOME%\%ART%\NUL (
  ECHO run MKDIR %WS_HOME%\%ART%
	MKDIR %WS_HOME%\%ART%
)

REM Create PROJECTS dicrectory if it doesn't exists.
IF NOT EXIST %WS_HOME%\%PROJECTS%\NUL (
  ECHO run MKDIR %WS_HOME%\%PROJECTS%
	MKDIR %WS_HOME%\%PROJECTS%
)

REM Create CENTER dicrectory if it doesn't exists.
IF NOT EXIST %WS_HOME%\%CENTER%\NUL (
  ECHO run MKDIR %WS_HOME%\%CENTER%
	MKDIR %WS_HOME%\%CENTER%
)

REM Create FACTORY dicrectory if it doesn't exists.
IF NOT EXIST %WS_HOME%\%FACTORY%\NUL (
  ECHO run MKDIR %WS_HOME%\%FACTORY%
	MKDIR %WS_HOME%\%FACTORY%
)

REM Create LAB dicrectory if it doesn't exists.
IF NOT EXIST %WS_HOME%\%LAB%\NUL (
  ECHO run MKDIR %WS_HOME%\%LAB%
	MKDIR %WS_HOME%\%LAB%
)

REM Create LIBRARY dicrectory if it doesn't exists.
IF NOT EXIST %WS_HOME%\%LIBRARY%\NUL (
  ECHO run MKDIR %WS_HOME%\%LIBRARY%
	MKDIR %WS_HOME%\%LIBRARY%
)

REM Create TEMP dicrectory if it doesn't exists.
IF NOT EXIST %WS_HOME%\%TEMP%\NUL (
  ECHO run MKDIR %WS_HOME%\%TEMP%
	MKDIR %WS_HOME%\%TEMP%
)

REM Create TEMP dicrectory if it doesn't exists.
IF NOT EXIST %EXDIR%\%WS_UTILS%\NUL (
  ECHO %WS_UTILS% not found
  GOTO ENDEX
)

REM Copy WS_UTILS to WS_CENTER
ECHO run Xcopy /E /I %EXDIR%\%WS_UTILS% %WS_HOME%\%WS_CENTER%\%WS_UTILS
Xcopy /E /I %EXDIR%\%WS_UTILS% %WS_HOME%\%WS_CENTER%\%WS_UTILS

ECHO Please^! Add WS_HOME=%WS_HOME% to the environment,
ECHO and add ^%WS_HOME^%\%WS_CENTER%;^%WS_HOME^%\%WS_CENTER%\%WS_UTILS to path

:ENDEX
EXIT /B 0
