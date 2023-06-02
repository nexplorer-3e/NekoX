
### NekoN

Yet another Nekogram (X) fork.

#### Features

0. May rebase on Nekogram to keep update
1. build scripts
    - Keep TFoss build script, wrap it with a single file script with env defined at top (see below)
2. external libs
    - keep only one proxy infra for proxy feat
      - v2ray for now
3. NekoX style UI
>    - **UI**
>        - Telegram X style menu for unpinning messages
>        - Built-in Material Design themes / Telegram X style icons
4. Some features, see issues #3

#### Build script

```bash
git submodule update --init --recursive 
export NDK=[PATH_TO_NDK]
export NINJA_PATH=[PATH_TO_NINJA]
./build_libvpx_clang.sh
./build_ffmpeg_clang.sh
./patch_ffmpeg.sh
./patch_boringssl.sh
./build_boringssl.sh

```


#### Old Build instructions

```bash
git submodule update --init --recursive
apt install -y golang-1.16 yasm ninja build-essentials
# Install Android SDK and NDK (default location is $HOME/Android/SDK, otherwise you need to specify $ANDROID_HOME for it)
./run init libs libvpx
./run init libs ffmpeg
./run init libs boringssl
#./TMessagesProj/jni/patch_boringssl.sh
./run libs native
./run libs v2ray
```
1. Fill out `TELEGRAM_APP_ID` and `TELEGRAM_APP_HASH` in `local.properties`
2. Change the package name, API ID
3. Generate your signing keystore
```properties
keyAlias=
keyPassword=
storeFile=luvletter2333.jks
storePassword=
```
4. Replace TMessagesProj/google-services.json if you want fcm to work.

`./gradlew assemble<Full/Mini><Debug/Release/ReleaseNoGcm>`

## Credits

<ul>
    <li>Telegram-FOSS: <a href="https://github.com/Telegram-FOSS-Team/Telegram-FOSS/blob/master/LICENSE">GPLv2</a></li>
    <li>Nekogram: <a href="https://gitlab.com/Nekogram/Nekogram/-/blob/master/LICENSE">GPLv2</a></li>
    <li>v2rayNG: <a href="https://github.com/2dust/v2rayNG/blob/master/LICENSE">GPLv3</a></li>
    <li>AndroidLibV2rayLite: <a href="https://github.com/2dust/AndroidLibV2rayLite/blob/master/LICENSE">LGPLv3</a></li>
    <li>shadowsocks-android: <a href="https://github.com/shadowsocks/shadowsocks-android/blob/master/LICENSE">GPLv3</a></li>
    <li>shadowsocksRb-android: <a href="https://github.com/shadowsocksRb/shadowsocksRb-android/blob/master/LICENSE">GPLv3</a></li>
    <li>HanLP: <a href="https://github.com/hankcs/HanLP/blob/1.x/LICENSE">Apache License 2.0</a></li>
    <li>OpenCC: <a href="https://github.com/BYVoid/OpenCC/blob/master/LICENSE">Apache License 2.0</a></li>
    <li>opencc-data: <a href="https://github.com/nk2028/opencc-data">Apache License 2.0</a></li>
    <li>android-device-list: <a href="https://github.com/pbakondy/android-device-list/blob/master/LICENSE">MIT</a> </li>
    <li>JetBrains: for allocating free open-source licences for IDEs</li>
</ul>

[<img src=".github/jetbrains-variant-3.png" width="200"/>](https://jb.gg/OpenSource)
