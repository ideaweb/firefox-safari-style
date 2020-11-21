SHELL := /bin/bash

SASS := $(shell which sass >/dev/null && which sass || echo "false";)
MD5SUM := $(shell which md5sum >/dev/null && which md5sum || echo "false";)

usage:

	@echo "Usage:"
	@echo ""
	@echo "# Creates all files"
	@echo "make all"
	@echo ""
	@echo "# Watches for changes"
	@echo "make watch"

files:

	@echo -n "userChrome.css... "; \
	cat scss/userChrome.scss | $(SASS) --no-source-map - css/userChrome.css && echo "done" || echo "\033[31mfailed\033[0m"; \
	echo -n "userChrome-theme.css... "; \
	cat scss/userChrome.scss | sed "s/firefox-safari-style-support-themes: false/firefox-safari-style-support-themes: true/g" | $(SASS) --no-source-map - css/userChrome-theme.css && echo "done" || echo "\033[31mfailed\033[0m"; \

all:

ifneq ($(SASS),false)
	@echo "Checking for SASS compiler... $(SASS)"; \
	$(MAKE) -s files;
else
	@echo -e "Checking for SASS compiler... \033[31mfailed\033[0m"
	@echo -e "\033[31mERROR - \"sass\" not found!\033[0m"
endif

watch:

ifneq ($(SASS),false)
	@echo "Checking for SASS compiler... $(SASS)"
ifneq ($(MD5SUM),false)
	@echo "Checking for Md5 checksums tool... $(MD5SUM)"; \
	$(MAKE) -s files; \
	echo "Sass is watching for changes. Press Ctrl-C to stop."; \
	m1=$$(md5sum ./scss/userChrome.scss);  \
	while true; do \
		sleep 0.5; \
		m2=$$(md5sum ./scss/userChrome.scss); \
		if [ "$$m1" != "$$m2" ] ; then \
			m1=$$(md5sum ./scss/userChrome.scss); \
			$(MAKE) -s files; \
		fi; \
	done;
else
	@echo -e "Checking for Md5 checksums tool... \033[31mfailed\033[0m"
	@echo -e "\033[31mERROR - \"md5sum\" not found!\033[0m"
endif
else
	@echo -e "Checking for SASS compiler... \033[31mfailed\033[0m"
	@echo -e "\033[31mERROR - \"sass\" not found!\033[0m"
endif



