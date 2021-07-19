@ECHO OFF

IF "%1" == "" (
  ECHO demon ^<URL^>
  GOTO ENDEX
)

SET PROJECT_NAME=%~n1

cd %WS_HOME%\Projects

if EXIST %WS_HOME%\Projects\%PROJECT_NAME% (
  ECHO run RMDIR /Q /S %WS_HOME%\Projects\%PROJECT_NAME%
  RMDIR /Q /S %WS_HOME%\Projects\%PROJECT_NAME%
)

ECHO run git clone %1
git clone %1
ECHO Done!
ECHO Don't forget to create new brach.

:ENDEX
EXIT /b 0
