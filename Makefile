CLASS_FILES = $(shell find vendor/puli/*/src/ -type f -name '*.php')

BUILD_DIR = build

CP ?= cp -f
RM ?= rm -f
APIGEN ?= bin/apigen
APIGEN_GENERATE = $(APIGEN) generate
COMPOSER ?= composer
COMPOSER_UPDATE = $(COMPOSER) update
COMPOSER_INSTALL = $(COMPOSER) install

all: html

html: $(CLASS_FILES) $(APIGEN) update
	$(APIGEN_GENERATE) && \
	$(CP) -r $(BUILD_DIR)/* ./

update: FORCE
	$(COMPOSER_UPDATE)

$(APIGEN):
	$(COMPOSER_INSTALL)

clean:
	$(RM) -r *.html resources robots.txt sitemap.xml elementlist.js $(BUILD_DIR)

.PHONY: FORCE
