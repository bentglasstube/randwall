BIN=$(PREFIX)/usr/bin/
ETC=$(PREFIX)/etc/
SYSTEMD=$(PREFIX)/usr/lib/systemd/system/
SLIM=$(PREFIX)/usr/share/slim/themes/
MAN=$(PREFIX)/usr/share/man/man1/

all: theme/panel.png randwall.1

randwall.1: README.md
	md2man-roff $< > $@

theme/panel.png: theme/panel.svg
	inkscape $< -e $@ -D -d 96

install: all
	cp randwall $(BIN)
	cp getwalls $(BIN)
	cp randwall.service $(SYSTEMD)
	cp randwall.conf $(ETC)
	cp randwall.1 $(MAN)
	cp -r theme $(SLIM)/randwall

.PHONY: all install readme
