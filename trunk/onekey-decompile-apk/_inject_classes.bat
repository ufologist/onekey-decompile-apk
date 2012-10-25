@echo off

echo ***********************************
echo 将自己写的class混编(注入)到需要反编译的apk(mix/inject classes2apk)
echo ==================================
echo v1.0 20121024 by Sun https://onekey-decompile-apk.googlecode.com/svn/trunk

echo !
echo 功能
echo --------
echo 1. 将自己写的class文件变成android的dex格式
echo 2. 将dex格式反编译为smali代码
echo 3. 合并这些smali代码到apk反编译的smali目录

echo ?
echo 使用方法
echo --------
echo _inject_classes {class目录} {apk反编译的smali目录}
echo 例如: _inject_classes "D:\TestSmaliInject\build\classes" "D:\TestSmali\smali"
echo ***********************************


rem classes目录
set injectClassesDir=%1
set injectApk=%injectClassesDir%\..\inject.apk
set injectOutput=%injectClassesDir%\..\injectSmali
set injectSmaliDir=%injectOutput%\smali
rem apk反编译的smali目录
set smaliDir=%2


echo .........class2dex(apk)..........
call dx --dex --output="%injectApk%" "%injectClassesDir%"
echo .........apk2smali...............
java -jar "_tools\apktool\apktool-1.4.1.jar" d -d -f "%injectApk%" "%injectOutput%"
echo .........copy smali..............
XCOPY "%injectSmaliDir%" "%smaliDir%" /E/Y
