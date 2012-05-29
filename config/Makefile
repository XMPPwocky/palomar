-include	build/config/config.mk

.PHONY:	config
config:	build/config/config.h build/config/config.mk

build/config/config.h: config/config | build/config
	@$(SED) -e "s/^\([A-Z]*\)\t\(.*\)/\#define CONFIG_\1\t\2/g" \
		< $< | cpp -I config/cfgincludes - - > $@
build/config/config.mk: config/config | build/config
	@$(SED) -e 's/^\([A-Z]*\)\t\(.*\)/CONFIG_\1\t="\2"/g' \
		< $< | cpp -I config/cfgincludes - - > $@
