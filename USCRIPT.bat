@echo off
echo Type the command:
echo 1 - change HALID [admin]
echo 2 - cwitch to OW6 or OW7 [admin]
echo 3 - cwitch to LSSE2E or LGAUTO1 district [admin]
echo 4 - copy the latest master build
echo 5 - copy the Baseline build
echo 6 - delete wallet folder
echo 7 - delete DecisionSpace folder
echo 8 - copy session(s) into DecisionSpace folder
echo 9 - map drives

if %input%==1 (set /p HALID=HALID: )
if %input%==1 (setx OW_ORACLE_USER %HALID% /m)

@pause