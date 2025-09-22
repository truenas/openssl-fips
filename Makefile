.PHONY: all build clean install binary source

PACKAGE_NAME = truenas-openssl-provider-fips
VERSION = 3.1.2

all: build

build:
	dpkg-buildpackage -us -uc -b

source:
	dpkg-buildpackage -us -uc -S

binary:
	dpkg-buildpackage -us -uc -b

clean:
	rm -rf ossl
	rm -f ../$(PACKAGE_NAME)_$(VERSION)_*.deb
	rm -f ../$(PACKAGE_NAME)_$(VERSION)_*.buildinfo
	rm -f ../$(PACKAGE_NAME)_$(VERSION)_*.changes
	rm -f ../$(PACKAGE_NAME)_$(VERSION).dsc
	rm -f ../$(PACKAGE_NAME)_$(VERSION).tar.*

install: build
	sudo dpkg -i ../$(PACKAGE_NAME)_$(VERSION)_*.deb

uninstall:
	sudo apt-get remove -y $(PACKAGE_NAME)

test-build:
	debuild -us -uc -b

help:
	@echo "Available targets:"
	@echo "  all      - Build the Debian package"
	@echo "  build    - Build the binary package"
	@echo "  source   - Build the source package"
	@echo "  clean    - Clean build artifacts"
	@echo "  install  - Build and install the package"
	@echo "  uninstall- Remove the installed package"
	@echo "  help     - Show this help message"
