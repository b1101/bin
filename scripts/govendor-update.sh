#!/usr/bin/env bash
if [ $1 ]; then
    cd $GOPATH/src/$1 || exit 1
fi

rm -rf vendor

govendor init
govendor list +external | cut -d' ' -f 4 | xargs go get -u -d -v
govendor add +external
