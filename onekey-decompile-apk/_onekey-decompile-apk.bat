@echo off

echo ***********************************
echo 一步到位反编译apk工具(onekey decompile apk)
echo ==================================
echo v1.0.1 20121022 将apktool降到1.4.1(原来是1.4.3), 只有这个版本能进行SmaliDebugging
echo http://d-kovalenko.blogspot.com/2012/08/debugging-smali-code-with-apk-tool-and.html

echo v1.0 20121017 by Sun https://onekey-decompile-apk.googlecode.com/svn/trunk

echo !
echo 功能
echo --------
echo 1. 集成apktool/dex2jar/jd-gui
echo 2. 只需执行一步即可反编译出apk所有文件(资源文件和jar等等)
echo 3. 打开jd-gui反编译jar文件

echo ?
echo 使用方法
echo --------
echo 1. 将apk文件放到onekey-decompile-apk目录下
echo 2. 将apk文件拖拽到_onekey-decompile-apk.bat上
echo 3. 执行完成后
echo    会在onekey-decompile-apk目录下生成和apk同名的目录(放置了apktools反编译出来的东西)
echo    会在onekey-decompile-apk目录下生成和apk同名的jar文件(dex2jar反编译出来的class)
echo ***********************************


rem 拖拽的文件名是命令行的第一个参数
set apkFile=%1
rem 获取输出的jar文件名(基于apkFile的名称加上jar后缀名)
set jarFile=%apkFile%.jar

rem cd到命名所在的根目录
cd /d %apkFile%\..


echo .........apktool..........
java -jar "_tools\apktool\apktool-1.4.1.jar" d -d -f "%apkFile%"
echo .........dex2jar..........
call _tools\dex2jar\d2j-dex2jar -f "%apkFile%" -o "%jarFile%"
echo .........jd-gui...........
call _tools\jd-gui\jd-gui "%jarFile%"
