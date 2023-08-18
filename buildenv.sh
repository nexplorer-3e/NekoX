#!/bin/bash

if [ -z "$NDK_VER" ]; then export NDK_VER="21.4.7075529"; fi

if [ -z "$ANDROID_HOME" ]; then
  if [ -d "$HOME/Android/Sdk" ]; then
    export ANDROID_HOME="$HOME/Android/Sdk"
  elif [ -d "$HOME/.local/lib/android/sdk" ]; then
    export ANDROID_HOME="$HOME/.local/lib/android/sdk"
  fi
fi


_NDK="$ANDROID_HOME/ndk/$NDK_VER"
[ -f "$_NDK/source.properties" ] || _NDK="$ANDROID_NDK_HOME"
[ -f "$_NDK/source.properties" ] || _NDK="$NDK"
[ -f "$_NDK/source.properties" ] || _NDK="$ANDROID_HOME/ndk-bundle"

if [ ! -f "$_NDK/source.properties" ]; then
  echo "Error: NDK not found."
  exit 1
fi

export ANDROID_NDK_HOME=$_NDK
export NDK=$_NDK
export PROJECT=$(realpath .)

if [ $(command -v go) ]; then
  export PATH=$PATH:$(go env GOPATH)/bin
else
  echo "Warning: go is not installed."
  echo "To build libv2ray install latest stable go version first."
fi
