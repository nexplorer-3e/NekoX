#/usr/bin/env bash

. buildenv.sh

cd TMessagesProj/jni
./build_libvpx_clang.sh
./build_ffmpeg_clang.sh
./patch_ffmpeg.sh
./patch_boringssl.sh
./build_boringssl.sh

cd $PROJECT/v2ray
if [ $(command -v go) ]; then
  export PATH=$PATH:$(go env GOPATH)/bin
else
  echo "Error: go is not installed."
  echo "To build libv2ray install latest stable go version first."
  exit 1
fi
make all
make downloadGoMobile
make BuildMobile
mv libv2ray.aar ../TMessagesProj/libs

./gradlew assembleFullRelease