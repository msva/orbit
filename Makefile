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
	@cp src/model.lua $(LDIR)/orbit
	@cp src/cache.lua $(LDIR)/orbit
	@cp src/pages.lua $(LDIR)/orbit
	@cp src/ophandler.lua $(LDIR)/orbit
	@mkdir -p $(BDIR)
	@cp src/orbit $(BDIR)
	@if [ -f ./wsapi/Makefile ]; then \
          @echo "WSAPI compilation..."
	  @cd wsapi && make install; \
          @echo "WSAPI compilation is done!"
	@fi
	@echo "Orbit installing is done!"

install-samples:
	@mkdir -p $(PREF)/samples
	@cp -r samples/* $(PREFIX)/samples
	@echo "Samples installing is done!"

install-doc:
	@mkdir -p $(PREF)/doc
	@cp -r doc/* $(PREFIX)/doc
	@echo "Documentation installing is done!"

install-test:
	@mkdir -p $(PREF)/test
	@cp -r test/* $(PREF)/test
	@echo "test-files installing is done!"

install-rocks: install install-doc install-samples install-test

clean:
