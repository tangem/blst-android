# blst-android
Wrapper on blst library to provide .aar with JNI

How to build.
1. Clone project.
2. Install NDK using SDK Manager.
3. Run build.
4. After SWIG generate .java files open "blstJNI" and replace imClazz.getPackageName() with imClazz.getPackage().getName().
5. Rebuild project.
6. AAR file will placed in outputs of "blstlib" module
