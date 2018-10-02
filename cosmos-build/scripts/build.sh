#!/bin/bash
set -eou pipefail

# Clone source code into GOPATH
SRC=/go/src/github.com/cosmos/cosmos-sdk
git clone https://github.com/cosmos/cosmos-sdk \
    --depth=1 --branch "$GIT_REF" "$SRC"

(
    cd "$SRC"

    # Fetch dependencies
    # Specify -vendor-only for reproducibility, the Makefile doesn't!
    rm -rf vendor
    dep ensure -v -vendor-only

    # Build package
    make build

    # Collect artifacts
    shopt -s dotglob
    cp -r ./build/* /build/out

    echo "Done. Checksums:"
    echo "-----------------------------------------"
    sha256sum /build/out/*
)
