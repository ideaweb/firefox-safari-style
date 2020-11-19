SHELL := /bin/bash

SASS := $(shell which sass >/dev/null && which sass || echo "false";)

usage:

	@echo "Usage:"
	@echo ""
	@echo "# Creates all files"
	@echo "make all"
	@echo ""
	@echo "# Watches for changes"
	@echo "make watch"

all:

ifneq ($(SASS),false)
	@echo "Checking for SASS compiler... $(SASS)"; \
	echo -n "userChrome.css... "; \
	cat scss/userChrome.scss | $(SASS) --no-source-map - css/userChrome.css && echo "done" || echo "\033[31mfailed\033[0m"; \
	for i in \
		onedark \
	; do \
		echo -n "userChrome-$$i.css... "; \
		cat scss/userChrome.scss | sed "s/firefox-safari-style-theme: false/firefox-safari-style-theme: $$i/g" | $(SASS) --no-source-map - css/userChrome-$$i.css && echo "done" || echo "\033[31mfailed\033[0m"; \
	done;
else
	@echo -e "Checking for SASS compiler... \033[31mfailed\033[0m"
	@echo -e "\033[31mERROR - \"sass\" not found!\033[0m"
endif

watch:

ifneq ($(SASS),false)
	@echo "Checking for SASS compiler... $(SASS)"
	@sass --watch scss/userChrome.scss css/userChrome.css
else
	@echo -e "Checking for SASS compiler... \033[31mfailed\033[0m"
	@echo -e "\033[31mERROR - \"sass\" not found!\033[0m"
endif



