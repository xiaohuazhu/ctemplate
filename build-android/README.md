## Build instruction for Android ##

$ cd build-android
$ tar xzvf include.tar.gz
$ cd jni
$ export ANDROID_NDK=/path/to/android-ndk
$ $ANDROID_NDK/ndk-build TARGET_PLATFORM=android-21
