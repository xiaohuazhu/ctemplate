#!/bin/sh

build_version=4
package_name=ctemplate-android

current_dir="`pwd`"

if test "x$ANDROID_NDK" = x ; then
  echo should set ANDROID_NDK before running this script.
  exit 1
fi

function build {
  rm -rf "$current_dir/obj"

  cd "$current_dir/jni"
  echo Building
  $ANDROID_NDK/ndk-build

  archs="x86_64 armeabi-v7a x86 arm64-v8a"
  for arch in $archs ; do
    TARGET_ARCH_ABI=$arch
    mkdir -p "$current_dir/$package_name-$build_version/libs/$TARGET_ARCH_ABI"
    cp "$current_dir/obj/local/$TARGET_ARCH_ABI/libctemplate.a" "$current_dir/$package_name-$build_version/libs/$TARGET_ARCH_ABI"
  done
  rm -rf "$current_dir/src"
  rm -rf "$current_dir/obj"
  rm -rf "$current_dir/libs"
}

# Includes
cd "$current_dir"
tar xzf include.tar.gz
mkdir -p "$current_dir/$package_name-$build_version/include"
cp -r include/ctemplate "$current_dir/$package_name-$build_version/include"

# Start building.
build

cd "$current_dir"
zip -qry "$package_name-$build_version.zip" "$package_name-$build_version"
rm -rf "$package_name-$build_version"
