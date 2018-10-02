# Certus One Buildscripts

This repo contains build scripts for reproducible builds.

Requirements:
* Docker

The scripts have been tested on Fedora 28.

## Cosmos-sdk

The cosmos-sdk buildscripts can be found in `cosmos-build`.

Usage example:

```
./run.sh v0.24.2
```

That will build cosmos-sdk version 0.24.2 and store the build artifacts in  `build/v0.24.2`. 
SHA256 sums of the build artifacts are printed to the console.