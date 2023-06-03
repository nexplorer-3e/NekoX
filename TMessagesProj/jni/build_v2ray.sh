#!/usr/bin/env bash
set -e

function init() {
    # set env
    GOPATH=`go get GOPATH`
    # init v2ray module
    [ -f v2ray/go.mod ] || git submodule update --init v2ray
    cd v2ray
    git reset --hard && git clean -fdx
    go mod download -x && go get -v golang.org/x/mobile/cmd/... || exit 1
}

function build() {
    if `dirname .` != "v2ray"; then
        cd v2ray
    fi
    GOPATH/bin/gomobile init
    GOPATH/bin/gomobile bind -v -ldflags='-s -w' . || exit 1
    cd ..
    mkdir -p "TMessagesProj/libs"
    cp -f libv2ray.aar "TMessagesProj/libs"
}


