# $Id: Makefile,v 1.4 2008/04/04 19:52:07 mascarenhas Exp $

include config

DESTDIR := /
LDIR := $(DESTDIR)/$(LUA_DIR)
CDIR := $(DESTDIR)/$(LUA_LIBDIR)
BDIR := $(DESTDIR)/$(BIN_DIR)
PREF := $(DESTDIR)/$(PREFIX)

all:

config:
	touch config

install:
	@mkdir -p $(LDIR)
	@cp src/orbit.lua $(LDIR)
	@mkdir -p $(LDIR)/orbit
	@cp -r src/orbit $(LDIR)
	@mkdir -p $(BDIR)
	@chmod +x src/launchers/op.cgi src/launchers/op.fcgi src/launchers/orbit
	@cp -r src/launchers/op.cgi $(BDIR)
	@cp -r src/launchers/op.fcgi $(BDIR)
	@cp -r src/launchers/orbit $(BDIR)
	@echo "Orbit installing is done!"

install-samples:
	@mkdir -p $(PREF)/samples
	@cp -r samples/* $(PREF)/samples
	@echo "Samples installing is done!"

install-doc:
	@mkdir -p $(PREF)/doc
	@cp -r doc/* $(PREF)/doc
	@echo "Documentation installing is done!"

install-test:
	@mkdir -p $(PREF)/test
	@cp -r test/* $(PREF)/test
	@echo "test-files installing is done!"

install-rocks: install install-doc install-samples install-test

clean:
