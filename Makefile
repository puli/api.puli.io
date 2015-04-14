CLASS_FILES = $(shell find vendor/puli/*/src/ -type f -name '*.php')

BUILD_DIR = latest

CP ?= cp -f
RM ?= rm -f
APIGEN ?= bin/apigen
APIGEN_GENERATE = $(APIGEN) generate
COMPOSER ?= composer
COMPOSER_UPDATE = $(COMPOSER) update

all: html

html: $(CLASS_FILES) $(APIGEN)
	$(APIGEN_GENERATE) -d $(BUILD_DIR)

$(APIGEN): update

update: FORCE
	$(COMPOSER_UPDATE)

clean:
	$(RM) -r $(BUILD_DIR)

.PHONY: FORCE
