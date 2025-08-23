# YaCoin Build Environment

This repository contains Docker configurations for building YaCoin on multiple platforms.

## Available Build Environments

### Ubuntu Builds
- `Dockerfile.ubuntu.16.04` - Ubuntu 16.04 build environment
- `Dockerfile.ubuntu.18.04` - Ubuntu 18.04 build environment  
- `Dockerfile.ubuntu.20.04` - Ubuntu 20.04 build environment
- `Dockerfile.ubuntu.22.04` - Ubuntu 22.04 build environment

### Cross-Platform Builds
- `Dockerfile.windows` - Windows cross-compilation environment
- `Dockerfile.macos` - macOS cross-compilation environment using osxcross

## Usage

To build YaCoin for a specific platform:

```bash
# For Ubuntu 20.04
docker build -f Dockerfile.ubuntu.20.04 -t yacoin-build:ubuntu20.04 .
docker run -v /path/to/yacoin/source:/src yacoin-build:ubuntu20.04

# For macOS cross-compilation
docker build -f Dockerfile.macos -t yacoin-build:macos .
docker run -v /path/to/yacoin/source:/src yacoin-build:macos

# For Windows cross-compilation
docker build -f Dockerfile.windows -t yacoin-build:windows .
docker run -v /path/to/yacoin/source:/src yacoin-build:windows
```

## macOS Build Notes

The macOS build uses the osxcross toolchain to cross-compile from Ubuntu 18.04. It downloads the macOS 10.11 SDK and builds binaries compatible with macOS 10.8+. For detailed instructions, see `instructions-macos.md`.

## GitHub Actions

The repository includes a GitHub Actions workflow (`dockerpush.yml`) that automatically builds and pushes Docker images for all supported platforms when changes are pushed to the repository.