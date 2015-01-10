CLASS_FILES = $(shell find vendor/puli/*/src/ -type f -name '*.php')

CP ?= cp -r
RM ?= rm -f
COMPOSER ?= composer

html : $(CLASS_FILES)
    bin/apigen && $(CP) build/* .

bin/apigen:
    $(COMPOSER) update

clean:
    $(RM) -r *.html

.PHONY: FORCE
