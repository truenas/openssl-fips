# TrueNAS OpenSSL FIPS Provider Package

This repository contains a Debian package for the FIPS 140-3 validated OpenSSL cryptographic module.

## Package Information
- **Package Name**: truenas-openssl-provider-fips
- **Version**: 3.1.2
- **Conflicts**: openssl-provider-fips

## What's Included
- FIPS provider module (fips.so)
- FIPS configuration file (fipsmodule.cnf)

## Building the Package

### Prerequisites
- Debian/Ubuntu system with build tools
- Required packages: `build-essential debhelper wget libssl-dev perl devscripts dpkg-dev`

### Build Instructions

1. Install dependencies:
```bash
apt-get update
apt-get install -y build-essential debhelper wget libssl-dev perl devscripts dpkg-dev
```

2. Build the package:
```bash
dpkg-buildpackage -us -uc -b
```

Or use the included Makefile:
```bash
make build
```

3. The .deb package will be created in the parent directory.

### Installation
```bash
sudo dpkg -i ../truenas-openssl-provider-fips_3.1.2_*.deb
```

Or using make:
```bash
make install
```

## Files Installed
- `/usr/lib/<arch>/ossl-modules/fips.so` - FIPS provider module
- `/usr/lib/ssl/fipsmodule.cnf` - FIPS module configuration

## Notes
- The OpenSSL version (3.1.2) is the most recent FIPS validated version
- DO NOT change the version unless prompted by the security team
- This package is specifically built for TrueNAS systems
