@ECHO OFF 
ECHO [等待插入手机...]
  adb wait-for-device
ECHO [读取手机信息]
ECHO -------------------------------
  adb shell cat /system/build.prop>%~dp0\phone.info
FOR /F "tokens=1,2 delims==" %%a in (phone.info) do (
  IF %%a == ro.build.version.release SET androidOS=%%b
  IF %%a == ro.product.model SET model=%%b
  IF %%a == ro.product.brand SET brand=%%b
  IF %%a == ro.build.id SET id=%%b
  IF %%a == ro.product.cpu.abi SET cpu=%%b
  IF %%a == ro.board.platform SET platform=%%b
  IF %%a == ro.product.manufacturer SET manufacturer=%%b
  IF %%a == ro.build.version.sdk SET sdk=%%b
  )
del /a/f/q %~dp0\phone.info
ECHO.
ECHO.手 机 品 牌: %brand%
ECHO.手 机 型 号: %model%
ECHO.版  本   号: %id%
ECHO.Android版本: Android %androidOS%
ECHO.C P U 版 本: %cpu%
ECHO.S D K 版 本: %sdk%
ECHO.主 板 平 台: %platform%
ECHO.制  造   商: %manufacturer%
ECHO.-------------------------------

ECHO.手 机 品 牌: %brand%>"%~dp0\result\Phone_%model%.txt"
ECHO.手 机 型 号: %model%>>"%~dp0\result\Phone_%model%.txt"
ECHO.版  本   号: %id%>>"%~dp0\result\Phone_%model%.txt"
ECHO.Android版本: Android %androidOS%>>"%~dp0\result\Phone_%model%.txt"
ECHO.CPU  版  本: %cpu%>>"%~dp0\result\Phone_%model%.txt"
ECHO.SDK  版  本: %sdk%>>"%~dp0\result\Phone_%model%.txt"
ECHO.主 板 平 台: %platform%>>"%~dp0\result\Phone_%model%.txt"
ECHO.制  造   商: %manufacturer%>>"%~dp0\result\Phone_%model%.txt"

ECHO [暂停15秒自动关闭...]
  ping -n 50 127.0.0.1>nul
@ECHO ON