@ECHO OFF

IF "%1" == "" (
  cd %WS_HOME%\Projects
  GOTO ENDEX
)

cd %WS_HOME%\Projects\%1

:ENDEX
EXIT /B 0
