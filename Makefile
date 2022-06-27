
# Comment next line if you installed Builder thru system package manager
flatpak-builder := flatpak run org.flatpak.Builder

.PHONY: all build install run

all:
	$(MAKE) build
	$(MAKE) install

build:
	$(flatpak-builder) build-dir net.froemling.bombsquad.yml --force-clean

install:
	$(flatpak-builder) --user --install --force-clean build-dir net.froemling.bombsquad.yml

run:
	flatpak run net.froemling.bombsquad
