
# this dir
THIS_MAKEFILE_PATH:=$(word $(words $(MAKEFILE_LIST)),$(MAKEFILE_LIST))
THIS_DIR:=$(shell cd $(dir $(THIS_MAKEFILE_PATH));pwd)

# BIN directory
BIN := $(THIS_DIR)/node_modules/.bin

# applications
NODE ?= node
BABEL ?= $(NODE) $(BIN)/babel

ES6_FILES := $(wildcard *.es6)
COMPILED_FILES := $(ES6_FILES:.es6=.js)

build: $(COMPILED_FILES)

%.js: %.es6
	@printf '\e[1;93m %-10s\e[m %s > %s\n' "babel" "$<" "$@"
	@$(BABEL) "$<" --optional runtime --experimental > "$@"

clean:
	rm -f $(COMPILED_FILES)

distclean:
	rm -rf node_modules

.PHONY: build clean distclean
