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

if %input%==2 if "%LM_LICENSE_FILE%"=="2013@10.134.19.88" (setx LM_LICENSE_FILE "2017@10.134.17.3;2013@10.134.19.88" /m)
if %input%==2 if "%ORACLE_HOME%"=="O:\app\product\11.2.0\client_1" (setx ORACLE_HOME "D:\app\client\H261885\product\12.2.0\client_1" /m)
if %input%==2 if "%OW_CONF_DIR%"=="P:\QA\CONF\OWE2E\conf_win" (setx OW_CONF_DIR "P:\QA\CONF\LSSE2E71\conf_win" /m)
if %input%==2 if "%OW_SYSDATA_DIR%"=="O:\OpenWorks10.6" (setx OW_SYSDATA_DIR "D:\Landmark\OpenWorks" /m)
if %input%==2 if "%OWHOME%"=="O:\OpenWorks10.6" (setx OWHOME "D:\Landmark\OpenWorks" /m)
if %input%==2 if "%TNS_ADMIN%"=="P:\QA\CONF\OWE2E\conf_win" (setx TNS_ADMIN "P:\QA\CONF\LSSE2E71\conf_win" /m)
if %input%==2 if "%LM_LICENSE_FILE%"=="2017@10.134.17.3;2013@10.134.19.88" (setx LM_LICENSE_FILE "2013@10.134.19.88" /m)
if %input%==2 if "%ORACLE_HOME%"=="D:\app\client\H261885\product\12.2.0\client_1" (setx ORACLE_HOME "O:\app\product\11.2.0\client_1" /m)
if %input%==2 if "%OW_CONF_DIR%"=="P:\QA\CONF\LSSE2E71\conf_win" (setx OW_CONF_DIR "P:\QA\CONF\OWE2E\conf_win" /m)
if %input%==2 if "%OW_SYSDATA_DIR%"=="D:\Landmark\OpenWorks" (setx OW_SYSDATA_DIR "O:\OpenWorks10.6" /m)
if %input%==2 if "%OWHOME%"=="D:\Landmark\OpenWorks" (setx OWHOME "O:\OpenWorks10.6" /m)
if %input%==2 if "%TNS_ADMIN%"=="P:\QA\CONF\LSSE2E71\conf_win" (setx TNS_ADMIN "P:\QA\CONF\OWE2E\conf_win" /m)

if %input%==3 if "%OW_CONF_DIR%"=="P:\QA\CONF\LSSE2E71\conf_win" (setx OW_CONF_DIR "Y:\11.OWConfig\Win\OW_main" /m)
if %input%==3 if "%TNS_ADMIN%"=="P:\QA\CONF\LSSE2E71\conf_win" (setx TNS_ADMIN "Y:\11.OWConfig\Win\OW_main" /m)
if %input%==3 if "%OW_CONF_DIR%"=="Y:\11.OWConfig\Win\OW_main" (setx OW_CONF_DIR "P:\QA\CONF\LSSE2E71\conf_win" /m)
if %input%==3 if "%TNS_ADMIN%"=="Y:\11.OWConfig\Win\OW_main" (setx TNS_ADMIN "P:\QA\CONF\LSSE2E71\conf_win" /m)

@pause