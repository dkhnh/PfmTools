@ECHO OFF

REM evil [BRANCH] [URL]

IF "%1" == "" (
  ECHO evil ^<BRANCH^> ^<URL^>
  GOTO ENDEX
)

IF "%2" == "" (
  ECHO evil ^<BRANCH^> ^<URL^>
  GOTO ENDEX
)

SET PROJECT_NAME=%~n2

cd %WS_HOME%\Projects

if EXIST %WS_HOME%\Projects\%PROJECT_NAME% (
  ECHO run RMDIR /Q /S %WS_HOME%\Projects\%PROJECT_NAME%
  RMDIR /Q /S %WS_HOME%\Projects\%PROJECT_NAME%
)

ECHO run MKDIR %WS_HOME%\Projects\%PROJECT_NAME%
MKDIR %WS_HOME%\Projects\%PROJECT_NAME%
ECHO run CD %PROJECT_NAME%
CD %PROJECT_NAME%
ECHO run git init
git init
ECHO run git checkout -b %1
git checkout -b %1
ECHO run git remote add origin %2
git remote add origin %2
ECHO run git pull origin %1 -r
git pull origin %1 -r
ECHO Done!
ECHO Don't forget to create new brach.

:ENDEX
EXIT /B 0
