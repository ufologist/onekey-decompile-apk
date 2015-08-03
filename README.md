# onekey-decompile-apk
一步到位反编译apk工具(onekey decompile apk)

Automatically exported from code.google.com/p/onekey-decompile-apk

** Starred by 83 users | DownloadCount 23758 **

v1.0.1 2012-10-24

## 功能 ##
1. 集成apktool/dex2jar/jd-gui
2. 只需执行一步即可反编译出apk所有文件(资源文件和jar等等)
3. 打开jd-gui反编译jar文件

## 使用方法 ##
1. 在Downloads中下载onekey-decompile-apk.zip, 解压缩到类似 `D:\downloads\onekey-decompile-apk`
2. 将apk文件放到`onekey-decompile-apk`目录下
3. 将apk文件拖拽到`_onekey-decompile-apk.bat`上
4. 执行完成后
    * 会在`onekey-decompile-apk`目录下生成和apk同名的目录(放置了apktools反编译出来的东西)
    * 会在`onekey-decompile-apk`目录下生成和apk同名的jar文件(dex2jar反编译出来的class)

## 运用工具(非常感谢他们) ##
1. [apktool](http://code.google.com/p/android-apktool/)反编译出apk中的资源文件, 例如AndroidManifest.xml和res

   ```
   java -jar apktool.jar d -d xxx.apk
   ```
2. [dex2jar](http://code.google.com/p/dex2jar/)反编译出apk中的class

   ```
   // dex2jar is deprecated, use the d2j-dex2jar
   d2j-dex2jar xxx.apk
   ```
3. [jd-ui](http://java.decompiler.free.fr/?q=jdgui)/[jad](http://www.varaneckas.com/jad/)反编译class为java源文件

   > 反编译工具还是jad最强, JD-GUI只是方便反编译/查看整个jar而已, 反编译出来的代码不全,
   > 
   > 因此需要jd + jad(或者[jadclipse](http://jadclipse.sourceforge.net) eclipse插件使用更方便)配合才完美

## 参考 ##
* [一个APK反编译利器Apktool](http://blog.sina.com.cn/s/blog_5752764e0100kv34.html)
* [Android程序反编译的方法](http://www.cnblogs.com/feisky/archive/2010/08/05/1793493.html)
* [如何反编译android程序](http://doandroid.info/%E5%A6%82%E4%BD%95%E5%8F%8D%E7%BC%96%E8%AF%91android%E7%A8%8B%E5%BA%8F/)

## 更新 ##
* 2012-10-24: inject\_classes v1.0 将自己写的class混编(注入)到需要反编译的apk(mix/inject classes2apk) [Changes](https://github.com/ufologist/onekey-decompile-apk/blob/master/CHANGELOG.md#inject_classes-v10)
* 2012-10-22: onekey-decompile-apk v1.0.1 将apktool降到1.4.1(原来是1.4.3), 只有这个版本能进行SmaliDebugging [Changes](https://github.com/ufologist/onekey-decompile-apk/blob/master/CHANGELOG.md#onekey-decompile-apk-v101)
* 2012-10-22: 新的一步到位打包apk(签名, 安装)工具(onekey build-sign-install apk). [Changes](https://github.com/ufologist/onekey-decompile-apk/blob/master/CHANGELOG.md#build_sign_install-v10)
