@echo off
echo Type the command:
echo 1 - change HALID
echo 2 - cwitch to OW6 or OW7 ^| set required vars
echo 3 - cwitch to LSSE2E or LGAUTO1 district
echo 4 - copy the latest master build
echo 5 - copy the Baseline build
echo 6 - delete wallet folder
echo 7 - delete DecisionSpace folder
echo 8 - copy session(s) into DecisionSpace folder
echo 9 - map drives

if not defined OEC_USERNAME (set /p login=OEC login: )
if not defined OEC_USERNAME (setx OEC_USERNAME %login%)
set /p input=cmd: 

if %input%==1 (set /p HALID=HALID: )
if %input%==1 (setx OW_ORACLE_USER %HALID%)

if %input%==2 if "%LM_LICENSE_FILE%"=="2013@10.134.19.88" (setx LM_LICENSE_FILE "2017@10.134.17.3;2013@10.134.19.88")
if %input%==2 if "%ORACLE_HOME%"=="O:\app\product\11.2.0\client_1" (setx ORACLE_HOME "D:\app\client\H261885\product\12.2.0\client_1")
if %input%==2 if "%OW_CONF_DIR%"=="P:\QA\CONF\OWE2E\conf_win" (setx OW_CONF_DIR "P:\QA\CONF\LSSE2E71\conf_win")
if %input%==2 if "%OW_SYSDATA_DIR%"=="O:\OpenWorks10.6" (setx OW_SYSDATA_DIR "D:\Landmark\OpenWorks")
if %input%==2 if "%OWHOME%"=="O:\OpenWorks10.6" (setx OWHOME "D:\Landmark\OpenWorks")
if %input%==2 if "%TNS_ADMIN%"=="P:\QA\CONF\OWE2E\conf_win" (setx TNS_ADMIN "P:\QA\CONF\LSSE2E71\conf_win")
if %input%==2 if "%TNS_ADMIN%"=="P:\QA\CONF\LSSE2E71\conf_win" (echo "Switched to OW7")
if %input%==2 if "%LM_LICENSE_FILE%"=="2017@10.134.17.3;2013@10.134.19.88" (setx LM_LICENSE_FILE "2013@10.134.19.88")
if %input%==2 if "%ORACLE_HOME%"=="D:\app\client\H261885\product\12.2.0\client_1" (setx ORACLE_HOME "O:\app\product\11.2.0\client_1")
if %input%==2 if "%OW_CONF_DIR%"=="P:\QA\CONF\LSSE2E71\conf_win" (setx OW_CONF_DIR "P:\QA\CONF\OWE2E\conf_win")
if %input%==2 if "%OW_SYSDATA_DIR%"=="D:\Landmark\OpenWorks" (setx OW_SYSDATA_DIR "O:\OpenWorks10.6")
if %input%==2 if "%OWHOME%"=="D:\Landmark\OpenWorks" (setx OWHOME "O:\OpenWorks10.6")
if %input%==2 if "%TNS_ADMIN%"=="P:\QA\CONF\LSSE2E71\conf_win" (setx TNS_ADMIN "P:\QA\CONF\OWE2E\conf_win")
if %input%==2 if "%TNS_ADMIN%"=="P:\QA\CONF\OWE2E\conf_win" (echo "Switched to OW6")
if %input%==2 if not defined LM_LICENSE_FILE (setx LM_LICENSE_FILE "2017@10.134.17.3;2013@10.134.19.88")
if %input%==2 if not defined ORACLE_HOME (setx ORACLE_HOME "D:\app\client\H261885\product\12.2.0\client_1")
if %input%==2 if not defined OW_CONF_DIR (setx OW_CONF_DIR "P:\QA\CONF\LSSE2E71\conf_win")
if %input%==2 if not defined OW_SYSDATA_DIR (setx OW_SYSDATA_DIR "D:\Landmark\OpenWorks")
if %input%==2 if not defined OWHOME (setx OWHOME "D:\Landmark\OpenWorks")
if %input%==2 if not defined TNS_ADMIN (setx TNS_ADMIN "P:\QA\CONF\LSSE2E71\conf_win")

if %input%==3 if "%OW_CONF_DIR%"=="P:\QA\CONF\LSSE2E71\conf_win" (setx OW_CONF_DIR "Y:\11.OWConfig\Win\OW_main")
if %input%==3 if "%TNS_ADMIN%"=="P:\QA\CONF\LSSE2E71\conf_win" (setx TNS_ADMIN "Y:\11.OWConfig\Win\OW_main")
if %input%==3 if "%OW_CONF_DIR%"=="P:\QA\CONF\LSSE2E71\conf_win" if "%TNS_ADMIN%"=="P:\QA\CONF\LSSE2E71\conf_win" (echo "Switched to LSSE2E district")
if %input%==3 if "%OW_CONF_DIR%"=="Y:\11.OWConfig\Win\OW_main" (setx OW_CONF_DIR "P:\QA\CONF\LSSE2E71\conf_win")
if %input%==3 if "%TNS_ADMIN%"=="Y:\11.OWConfig\Win\OW_main" (setx TNS_ADMIN "P:\QA\CONF\LSSE2E71\conf_win")
if %input%==3 if "%OW_CONF_DIR%"=="Y:\11.OWConfig\Win\OW_main" if "%TNS_ADMIN%"=="Y:\11.OWConfig\Win\OW_main" (echo "Switched to LGAUTO1 district")
if %input%==3 if not defined OW_CONF_DIR (echo "There is no OW_CONF_DIR variable, use 2-nd action to set")
if %input%==3 if not defined TNS_ADMIN (echo "There is no TNS_ADMIN variable, use 2-nd action to set")

if %input%==4 if exist D:\Landmark\DSG_master\LaunchDS.bat (rmdir D:\Landmark\DSG_master /s /q)
if %input%==4 if exist C:\Landmark\DSG_master\LaunchDS.bat (rmdir C:\Landmark\DSG_master /s /q)
if %input%==4 for /F "delims=" %%i in ('dir "N:\DSG\DSG10ep._master\" /b /ad-h /t:c /od') do set a=%%i
if %input%==4 xcopy N:\DSG\DSG10ep._master\%a%\DSG10ep.5.3Beta D:\Landmark\DSG_master /e
if %input%==4 xcopy N:\DSG\DSG10ep._master\%a%\DSG10ep.5.3Beta C:\Landmark\DSG_master /e
if %input%==4 if exist D:\Landmark\DSG_master\LaunchDS.bat (echo "Copied to D:\Landmark\DSG_master (buildID: %a%)")
if %input%==4 if exist C:\Landmark\DSG_master\LaunchDS.bat (echo "Copied to C:\Landmark\DSG_master (buildID: %a%)")

if %input%==5 if exist D:\Landmark\Baseline\LaunchDS.bat (rmdir D:\Landmark\Baseline /s /q)
if %input%==5 if exist C:\Landmark\Baseline\LaunchDS.bat (rmdir C:\Landmark\Baseline /s /q)
if %input%==5 xcopy D:\Users\%OEC_USERNAME%\Downloads\Baseline D:\Landmark\Baseline /e
if %input%==5 xcopy C:\Users\%OEC_USERNAME%\Downloads\Baseline C:\Landmark\Baseline /e
if %input%==5 if exist D:\Landmark\Baseline\LaunchDS.bat (echo "Baseline copied to D:\Landmark\Baseline")
if %input%==5 if exist C:\Landmark\Baseline\LaunchDS.bat (echo "Baseline copied to C:\Landmark\Baseline")

if %input%==6 if exist D:\Users\%OEC_USERNAME%\wallet\cwallet.sso (rmdir D:\Users\%OEC_USERNAME%\wallet /s /q)
if %input%==6 if exist C:\Users\%OEC_USERNAME%\wallet\cwallet.sso (rmdir C:\Users\%OEC_USERNAME%\wallet /s /q)
if %input%==6 if not exist D:\Users\%OEC_USERNAME%\wallet\ (echo "wallet folder was removed from D:\Users\%OEC_USERNAME%\")
if %input%==6 if not exist C:\Users\%OEC_USERNAME%\wallet\ (echo "wallet folder was removed from C:\Users\%OEC_USERNAME%\")

if %input%==7 if exist D:\ (echo The following sessions will be copied into D:\Landmark\UserSessions:)
if %input%==7 if exist C:\ (echo The following sessions will be copied into C:\Landmark\UserSessions:)
if %input%==7 (dir D:\Users\%OEC_USERNAME%\Landmark\DecisionSpace\UserSessions /b /ad)
if %input%==7 (dir C:\Users\%OEC_USERNAME%\Landmark\DecisionSpace\UserSessions /b /ad)
if %input%==7 if exist D:\Users\%OEC_USERNAME%\Landmark\DecisionSpace\logs\ds_console.log (xcopy D:\Users\%OEC_USERNAME%\Landmark\DecisionSpace\UserSessions D:\Landmark\UserSessions /s /q /y)
if %input%==7 if exist D:\Users\%OEC_USERNAME%\Landmark\DecisionSpace\logs\ds_console.log (rmdir D:\Users\%OEC_USERNAME%\Landmark\DecisionSpace /s /q)
if %input%==7 if exist C:\Users\%OEC_USERNAME%\Landmark\DecisionSpace\logs\ds_console.log (xcopy C:\Users\%OEC_USERNAME%\Landmark\DecisionSpace\UserSessions C:\Landmark\UserSessions /s /q /y)
if %input%==7 if exist C:\Users\%OEC_USERNAME%\Landmark\DecisionSpace\logs\ds_console.log (rmdir C:\Users\%OEC_USERNAME%\Landmark\DecisionSpace /s /q)

if %input%==8 if exist D:\ (xcopy D:\Landmark\UserSessions D:\Users\%OEC_USERNAME%\Landmark\DecisionSpace\UserSessions\ /e /q /y)
if %input%==8 (xcopy C:\Landmark\UserSessions C:\Users\%OEC_USERNAME%\Landmark\DecisionSpace\UserSessions\ /e /q /y)
if %input%==8 (echo "The following sessions were copied:")
if %input%==8 if exist D:\ (dir D:\Landmark\UserSessions) else (dir C:\Landmark\UserSessions)

if %input%==9 (@net use N:  /delete)
if %input%==9 (@net use N: \\dsharedsg.nas.openearth.io\Landmark\apps\WIN  /persistent:yes)
if %input%==9 if exist N:\ (echo "Drive N was successfully mapped")
if %input%==9 (@net use O:  /delete)
if %input%==9 (@net use O: \\dshareow.nas.openearth.io\Landmark\apps\WIN  /persistent:yes)
if %input%==9 if exist O:\ (echo "Drive O was successfully mapped")
if %input%==9 (@net use P:  /delete)
if %input%==9 (@net use P: \\dshareow.nas.openearth.io\Landmark  /persistent:yes)
if %input%==9 if exist P:\ (echo "Drive P was successfully mapped")
if %input%==9 (@net use Y:  /delete)
if %input%==9 (@net use Y: \\10.134.25.179\Landmark  /persistent:yes)
if %input%==9 if exist Y:\ (echo "Drive Y was successfully mapped")

@pause