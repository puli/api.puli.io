CLASS_FILES = $(shell find vendor/puli/*/src/ -type f -name '*.php')

BUILD_DIR = build

CP ?= cp -r
RM ?= rm -f
APIGEN ?= bin/apigen
APIGEN_GENERATE = $(APIGEN) generate
COMPOSER ?= composer

all: html

html: $(CLASS_FILES) $(APIGEN)
	$(APIGEN_GENERATE) && \
	$(CP) $(BUILD_DIR)/* ./

$(APIGEN):
	$(COMPOSER) install

clean:
	$(RM) -r *.html resources robots.txt sitemap.xml elementlist.js $(BUILD_DIR)

.PHONY: FORCE
