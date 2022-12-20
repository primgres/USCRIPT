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
if %input%==1 (setx OW_ORACLE_USER %HALID%)

if %input%==2 if "%LM_LICENSE_FILE%"=="2013@10.134.19.88" (setx LM_LICENSE_FILE "2017@10.134.17.3;2013@10.134.19.88")
if %input%==2 if "%ORACLE_HOME%"=="O:\app\product\11.2.0\client_1" (setx ORACLE_HOME "D:\app\client\H261885\product\12.2.0\client_1")
if %input%==2 if "%OW_CONF_DIR%"=="P:\QA\CONF\OWE2E\conf_win" (setx OW_CONF_DIR "P:\QA\CONF\LSSE2E71\conf_win")
if %input%==2 if "%OW_SYSDATA_DIR%"=="O:\OpenWorks10.6" (setx OW_SYSDATA_DIR "D:\Landmark\OpenWorks")
if %input%==2 if "%OWHOME%"=="O:\OpenWorks10.6" (setx OWHOME "D:\Landmark\OpenWorks")
if %input%==2 if "%TNS_ADMIN%"=="P:\QA\CONF\OWE2E\conf_win" (setx TNS_ADMIN "P:\QA\CONF\LSSE2E71\conf_win")
if %input%==2 if "%LM_LICENSE_FILE%"=="2017@10.134.17.3;2013@10.134.19.88" (setx LM_LICENSE_FILE "2013@10.134.19.88")
if %input%==2 if "%ORACLE_HOME%"=="D:\app\client\H261885\product\12.2.0\client_1" (setx ORACLE_HOME "O:\app\product\11.2.0\client_1")
if %input%==2 if "%OW_CONF_DIR%"=="P:\QA\CONF\LSSE2E71\conf_win" (setx OW_CONF_DIR "P:\QA\CONF\OWE2E\conf_win")
if %input%==2 if "%OW_SYSDATA_DIR%"=="D:\Landmark\OpenWorks" (setx OW_SYSDATA_DIR "O:\OpenWorks10.6")
if %input%==2 if "%OWHOME%"=="D:\Landmark\OpenWorks" (setx OWHOME "O:\OpenWorks10.6")
if %input%==2 if "%TNS_ADMIN%"=="P:\QA\CONF\LSSE2E71\conf_win" (setx TNS_ADMIN "P:\QA\CONF\OWE2E\conf_win")
if %input%==2 if not defined LM_LICENSE_FILE (setx LM_LICENSE_FILE "2017@10.134.17.3;2013@10.134.19.88")
if %input%==2 if not defined ORACLE_HOME (setx ORACLE_HOME "D:\app\client\H261885\product\12.2.0\client_1")
if %input%==2 if not defined OW_CONF_DIR (setx OW_CONF_DIR "P:\QA\CONF\LSSE2E71\conf_win")
if %input%==2 if not defined OW_SYSDATA_DIR (setx OW_SYSDATA_DIR "D:\Landmark\OpenWorks")
if %input%==2 if not defined OWHOME (setx OWHOME "D:\Landmark\OpenWorks")
if %input%==2 if not defined TNS_ADMIN (setx TNS_ADMIN "P:\QA\CONF\LSSE2E71\conf_win")

if %input%==3 if "%OW_CONF_DIR%"=="P:\QA\CONF\LSSE2E71\conf_win" (setx OW_CONF_DIR "Y:\11.OWConfig\Win\OW_main")
if %input%==3 if "%TNS_ADMIN%"=="P:\QA\CONF\LSSE2E71\conf_win" (setx TNS_ADMIN "Y:\11.OWConfig\Win\OW_main")
if %input%==3 if "%OW_CONF_DIR%"=="Y:\11.OWConfig\Win\OW_main" (setx OW_CONF_DIR "P:\QA\CONF\LSSE2E71\conf_win")
if %input%==3 if "%TNS_ADMIN%"=="Y:\11.OWConfig\Win\OW_main" (setx TNS_ADMIN "P:\QA\CONF\LSSE2E71\conf_win")

if %input%==4 if exist D:\Landmark\DSG_master\LaunchDS.bat (rmdir D:\Landmark\DSG_master /s /q)
if %input%==4 if exist C:\Landmark\DSG_master\LaunchDS.bat (rmdir C:\Landmark\DSG_master /s /q)
if %input%==4 for /F "delims=" %%i in ('dir "N:\DSG\DSG10ep._master\" /b /ad-h /t:c /od') do set a=%%i
if %input%==4 xcopy N:\DSG\DSG10ep._master\%a%\DSG10ep.5.3Beta D:\Landmark\DSG_master /e
if %input%==4 xcopy N:\DSG\DSG10ep._master\%a%\DSG10ep.5.3Beta C:\Landmark\DSG_master /e

if %input%==5 if exist D:\Landmark\Baseline\LaunchDS.bat (rmdir D:\Landmark\Baseline /s /q)
if %input%==5 if exist C:\Landmark\Baseline\LaunchDS.bat (rmdir C:\Landmark\Baseline /s /q)
if %input%==5 xcopy D:\Users\serhii.prymakov\Downloads\Baseline D:\Landmark\Baseline /e
if %input%==5 xcopy C:\Users\serhii.prymakov\Downloads\Baseline C:\Landmark\Baseline /e

if %input%==6 if exist D:\Users\serhii.prymakov\wallet\cwallet.sso (rmdir D:\Users\serhii.prymakov\wallet /s /q)
if %input%==6 if exist C:\Users\serhii.prymakov\wallet\cwallet.sso (rmdir C:\Users\serhii.prymakov\wallet /s /q)

if %input%==7 (echo The following sessions will be copied into C/D:\Landmark\UserSessions:)
if %input%==7 (dir D:\Users\serhii.prymakov\Landmark\DecisionSpace\UserSessions /b /ad)
if %input%==7 (dir C:\Users\serhii.prymakov\Landmark\DecisionSpace\UserSessions /b /ad)
if %input%==7 if exist D:\Users\serhii.prymakov\Landmark\DecisionSpace\logs\ds_console.log (xcopy D:\Users\serhii.prymakov\Landmark\DecisionSpace\UserSessions D:\Landmark\UserSessions /s /q /y)
if %input%==7 if exist D:\Users\serhii.prymakov\Landmark\DecisionSpace\logs\ds_console.log (rmdir D:\Users\serhii.prymakov\Landmark\DecisionSpace /s /q)
if %input%==7 if exist C:\Users\serhii.prymakov\Landmark\DecisionSpace\logs\ds_console.log (xcopy C:\Users\serhii.prymakov\Landmark\DecisionSpace\UserSessions C:\Landmark\UserSessions /s /q /y)
if %input%==7 if exist C:\Users\serhii.prymakov\Landmark\DecisionSpace\logs\ds_console.log (rmdir C:\Users\serhii.prymakov\Landmark\DecisionSpace /s /q)

if %input%==8 (xcopy D:\UserSessions D:\Users\serhii.prymakov\Landmark\DecisionSpace\UserSessions\ /e /q /y)
if %input%==8 (xcopy C:\UserSessions C:\Users\serhii.prymakov\Landmark\DecisionSpace\UserSessions\ /e /q /y)

if %input%==9 (@net use N:  /delete)
if %input%==9 (@net use N: \\dsharedsg.nas.openearth.io\Landmark\apps\WIN  /persistent:yes)
if %input%==9 (@net use O:  /delete)
if %input%==9 (@net use O: \\dshareow.nas.openearth.io\Landmark\apps\WIN  /persistent:yes)
if %input%==9 (@net use P:  /delete)
if %input%==9 (@net use P: \\dshareow.nas.openearth.io\Landmark  /persistent:yes)
if %input%==9 (@net use Y:  /delete)
if %input%==9 (@net use Y: \\10.134.25.179\Landmark  /persistent:yes)

@pause