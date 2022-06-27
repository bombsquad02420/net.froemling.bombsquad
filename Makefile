
# Comment next line if you installed Builder thru system package manager
flatpak-builder := flatpak run org.flatpak.Builder
flatpak-external-data-checker := flatpak run org.flathub.flatpak-external-data-checker

.PHONY: all check build install run debug clean

all:
	$(MAKE) build
	$(MAKE) install

check:
	$(flatpak-external-data-checker) net.froemling.bombsquad.yml

build:
	$(flatpak-builder) build-dir net.froemling.bombsquad.yml --force-clean

install:
	$(flatpak-builder) --user --install --force-clean build-dir net.froemling.bombsquad.yml

run:
	flatpak run net.froemling.bombsquad

debug:
	flatpak run --command=sh --devel net.froemling.bombsquad

clean:
	rm -rf build-dir .flatpak-builder
