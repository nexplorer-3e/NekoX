#!/usr/bin/env bash

source "bin/init/env.sh"
export GO111MOUDLE=on
export PATH="$PATH:$(go env GOPATH)/bin"

cd $PROJECT
[ -f v2ray/go.mod ] || git submodule update --init v2ray
cd v2ray
git reset --hard && git clean -fdx
go 
go mod download -x && go install golang.org/x/mobile/cmd/gomobile@latest || exit 1
