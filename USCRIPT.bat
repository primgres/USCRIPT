@echo off
echo Type the command:
echo 1 - change HALID
echo 2 - set required vars (OW7)
echo 3 - cwitch to OW6 or OW7
echo 4 - cwitch to LSSE2E or LGAUTO1 district
echo 5 - copy the latest master build
echo 6 - copy the Baseline build
echo 7 - delete wallet folder
echo 8 - delete DecisionSpace folder
echo 9 - copy session(s) into DecisionSpace folder
echo 10 - map drives

if not defined OEC_USERNAME (set /p login=OEC login: )
if not defined OEC_USERNAME (setx OEC_USERNAME %login%)
set /p input=cmd: 

if %input%==1 (set /p HALID=HALID: )
if %input%==1 (setx OW_ORACLE_USER %HALID%)

if %input%==2 setx LM_LICENSE_FILE "2017@10.134.17.3;2013@10.134.19.88"
if %input%==2 setx ORACLE_HOME "C:\app\client\product\12.2.0\client_1"
if %input%==2 setx OW_CONF_DIR "P:\QA\CONF\LSSE2E71\conf_win"
if %input%==2 setx OW_SYSDATA_DIR "C:\Landmark\OpenWorks"
if %input%==2 setx OWHOME "C:\Landmark\OpenWorks"
if %input%==2 setx OW_HOME_DIR "%userprofile%"
if %input%==2 setx TNS_ADMIN "P:\QA\CONF\LSSE2E71\conf_win"

if %input%==3 if "%LM_LICENSE_FILE%"=="2013@10.134.19.88" (setx LM_LICENSE_FILE "2017@10.134.17.3;2013@10.134.19.88")
if %input%==3 if "%ORACLE_HOME%"=="O:\app\product\11.2.0\client_1" (setx ORACLE_HOME "C:\app\client\product\12.2.0\client_1")
if %input%==3 if "%OW_CONF_DIR%"=="P:\QA\CONF\OWE2E\conf_win" (setx OW_CONF_DIR "P:\QA\CONF\LSSE2E71\conf_win")
if %input%==3 if "%OW_SYSDATA_DIR%"=="O:\OpenWorks10.6" (setx OW_SYSDATA_DIR "C:\Landmark\OpenWorks")
if %input%==3 if "%OWHOME%"=="O:\OpenWorks10.6" (setx OWHOME "C:\Landmark\OpenWorks")
if %input%==3 if "%TNS_ADMIN%"=="P:\QA\CONF\OWE2E\conf_win" (setx TNS_ADMIN "P:\QA\CONF\LSSE2E71\conf_win")
if %input%==3 if "%TNS_ADMIN%"=="P:\QA\CONF\OWE2E\conf_win" (echo "Switched to OW7")
if %input%==3 if "%LM_LICENSE_FILE%"=="2017@10.134.17.3;2013@10.134.19.88" (setx LM_LICENSE_FILE "2013@10.134.19.88")
if %input%==3 if "%ORACLE_HOME%"=="C:\app\client\product\12.2.0\client_1" (setx ORACLE_HOME "O:\app\product\11.2.0\client_1")
if %input%==3 if "%OW_CONF_DIR%"=="P:\QA\CONF\LSSE2E71\conf_win" (setx OW_CONF_DIR "P:\QA\CONF\OWE2E\conf_win")
if %input%==3 if "%OW_SYSDATA_DIR%"=="C:\Landmark\OpenWorks" (setx OW_SYSDATA_DIR "O:\OpenWorks10.6")
if %input%==3 if "%OWHOME%"=="C:\Landmark\OpenWorks" (setx OWHOME "O:\OpenWorks10.6")
if %input%==3 if "%TNS_ADMIN%"=="P:\QA\CONF\LSSE2E71\conf_win" (setx TNS_ADMIN "P:\QA\CONF\OWE2E\conf_win")
if %input%==3 if "%TNS_ADMIN%"=="P:\QA\CONF\LSSE2E71\conf_win" (echo "Switched to OW6")

if %input%==4 if "%OW_CONF_DIR%"=="P:\QA\CONF\LSSE2E71\conf_win" (setx OW_CONF_DIR "Y:\11.OWConfig\Win\OW_main")
if %input%==4 if "%TNS_ADMIN%"=="P:\QA\CONF\LSSE2E71\conf_win" (setx TNS_ADMIN "Y:\11.OWConfig\Win\OW_main")
if %input%==4 if "%OW_CONF_DIR%"=="Y:\11.OWConfig\Win\OW_main" (setx OW_CONF_DIR "P:\QA\CONF\LSSE2E71\conf_win")
if %input%==4 if "%TNS_ADMIN%"=="Y:\11.OWConfig\Win\OW_main" (setx TNS_ADMIN "P:\QA\CONF\LSSE2E71\conf_win")
if %input%==4 if not defined OW_CONF_DIR (echo "There is no OW_CONF_DIR variable, use 2-nd action to set")
if %input%==4 if not defined TNS_ADMIN (echo "There is no TNS_ADMIN variable, use 2-nd action to set")
if %input%==4 if "%OW_CONF_DIR%"=="P:\QA\CONF\LSSE2E71\conf_win" if "%TNS_ADMIN%"=="P:\QA\CONF\LSSE2E71\conf_win" (echo "Switched to LGAUTO1 district")
if %input%==4 if "%OW_CONF_DIR%"=="Y:\11.OWConfig\Win\OW_main" if "%TNS_ADMIN%"=="Y:\11.OWConfig\Win\OW_main" (echo "Switched to LSSE2E district")

if %input%==5 if exist C:\Landmark\DSG_master (rmdir C:\Landmark\DSG_master /s /q)
if %input%==5 for /F "delims=" %%i in ('dir "N:\DSG\DSG10ep._master\" /b /ad-h /t:c /od') do set a=%%i
if %input%==5 xcopy N:\DSG\DSG10ep._master\%a%\DSG10ep.5.3Beta C:\Landmark\DSG_master /e
if %input%==5 if exist C:\Landmark\DSG_master (echo "Copied to C:\Landmark\DSG_master (buildID: %a%)")

if %input%==6 if exist C:\Landmark\Baseline (rmdir C:\Landmark\Baseline /s /q)
if %input%==6 xcopy C:\Users\%OEC_USERNAME%\Downloads\Baseline C:\Landmark\Baseline /e
if %input%==6 if exist C:\Landmark\Baseline (echo "Baseline copied to C:\Landmark\Baseline")

if %input%==7 if exist C:\Users\%OEC_USERNAME%\wallet (rmdir C:\Users\%OEC_USERNAME%\wallet /s /q)
if %input%==7 if not exist C:\Users\%OEC_USERNAME%\wallet\ (echo "wallet folder was removed from C:\Users\%OEC_USERNAME%\")

if %input%==8 if exist C:\ (echo The following sessions will be copied into C:\Landmark\UserSessions:)
if %input%==8 if exist C:\ (dir C:\Users\%OEC_USERNAME%\Landmark\DecisionSpace\UserSessions /b /ad)
if %input%==8 if exist C:\Users\%OEC_USERNAME%\Landmark\DecisionSpace (xcopy C:\Users\%OEC_USERNAME%\Landmark\DecisionSpace\UserSessions C:\Landmark\UserSessions /s /q /y)
if %input%==8 if exist C:\Users\%OEC_USERNAME%\Landmark\DecisionSpace (rmdir C:\Users\%OEC_USERNAME%\Landmark\DecisionSpace /s /q)

if %input%==9 xcopy C:\Landmark\UserSessions C:\Users\%OEC_USERNAME%\Landmark\DecisionSpace\UserSessions /e /q /y
if %input%==9 echo The following sessions were copied:
if %input%==9 dir C:\Landmark\UserSessions

if %input%==10 (@net use N:  /delete)
if %input%==10 (@net use N: \\dsharedsg.nas.openearth.io\Landmark\apps\WIN  /persistent:yes)
if %input%==10 if exist N:\ (echo "Drive N was successfully mapped")
if %input%==10 (@net use O:  /delete)
if %input%==10 (@net use O: \\dshareow.nas.openearth.io\Landmark\apps\WIN  /persistent:yes)
if %input%==10 if exist O:\ (echo "Drive O was successfully mapped")
if %input%==10 (@net use P:  /delete)
if %input%==10 (@net use P: \\dshareow.nas.openearth.io\Landmark  /persistent:yes)
if %input%==10 if exist P:\ (echo "Drive P was successfully mapped")
if %input%==10 (@net use Y:  /delete)
if %input%==10 (@net use Y: \\10.134.25.179\Landmark  /persistent:yes)
if %input%==10 if exist Y:\ (echo "Drive Y was successfully mapped")

@pause