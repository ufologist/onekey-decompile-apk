@echo off

echo ***********************************
echo 一步到位打包apk(签名, 安装)工具(onekey build-sign-install apk)
echo ==================================
echo v1.0 20121022 by Sun https://onekey-decompile-apk.googlecode.com/svn/trunk

echo !
echo 功能
echo --------
echo 1. 打包apktool反编译出来的文件为apk
echo 2. 通过d2j-apk-sign签名apk
echo 3. adb install签名后的apk

echo ?
echo 使用方法
echo --------
echo _build_sign_install {apktool反编译输出的文件夹位置}
echo 例如: _build_sign_install myapp
echo ***********************************


rem apktool反编译输出的文件夹位置
set apktoolOutPutDir=%1
rem 输出apk文件位置
set unsignedApk=%apktoolOutPutDir%\dist\unsigned.apk
set signedApk=%apktoolOutPutDir%\dist\signed.apk

echo .........clean............
RD /S/Q "%apktoolOutPutDir%\dist"

echo .........device...........
adb devices
echo .........apktool..........
java -jar "_tools\apktool\apktool-1.4.1.jar" b -d -f "%apktoolOutPutDir%" "%unsignedApk%"
echo .........sign.............
call _tools\dex2jar\d2j-apk-sign -f "%unsignedApk%" -o "%signedApk%"
echo .........install..........
adb install -r "%signedApk%"