#!/bin/bash
set -eou pipefail

if [ $# -eq 0 ]; then
    echo "Usage: $0 <git_ref>"
    exit 1
fi

RELEASE=$1
BASEDIR=build
ROOT=${BASEDIR}/${RELEASE}
IMAGE_TAG=certus/cosmos-builder:latest

if [[ -d "$ROOT" ]]; then
    echo "Error: build root $ROOT already exists"
    exit 1
fi

mkdir -p "$ROOT"

# Build the build container
docker build . -t "$IMAGE_TAG"

# Run the build
docker run --rm \
    -v "$(realpath $ROOT):/build/out" \
    -e GIT_REF=${RELEASE} \
    "$IMAGE_TAG" /build/scripts/build.sh
