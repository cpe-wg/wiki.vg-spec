
# Binaries
PANDOC := pandoc

# Source directories
SOURCE_DIR := src
CONFIG_DIR := targets
SOURCES := $(shell find $(SOURCE_DIR) -type f -name '*.html' -or -name '*.wiki')

# Output directories
BUILD_ROOT := build

# HTML Options
HTML_BUILD_DIR := $(BUILD_ROOT)/html
HTML_CONFIG_DIR := $(CONFIG_DIR)/html
HTML_CONFIGS := $(wildcard $(HTML_CONFIG_DIR)/*.yml)
HTML_PAGES := $(HTML_CONFIGS:.yml=.yml.build)
HTML_EXTRA_FILES := $(SOURCE_DIR)/html/style.css src/img
HTML_EXTRA_TARGET := $(BUILD_ROOT)/.html-extras

# Pandoc targets
build/%:
	@mkdir -p $@

$(CONFIG_DIR)/%.yml.build: $(CONFIG_DIR)/%.yml $(SOURCES) | $(dir $(BUILD_ROOT)/%)
	@mkdir -p $(@D)
	$(PANDOC) -d $<
	@touch $@

# HTML targets
$(HTML_EXTRA_TARGET): $(HTML_EXTRA_FILES) | $(HTML_BUILD_DIR)
	cp -rt $(HTML_BUILD_DIR) $?
	@touch $@

html: $(HTML_EXTRA_TARGET) $(HTML_PAGES)

# Standard targets
clean:
	rm -rf $(BUILD_ROOT)
	find $(CONFIG_DIR) -type f -name '*.yml.build' -delete

.PHONY: html html-extras clean
