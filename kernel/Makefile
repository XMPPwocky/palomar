.PHONY:	ALWAYS_BUILD
ALWAYS_BUILD: ;

INCLUDED_FILES	:=

VERSION	= 0.001

define _recurse =
ifeq	(,$$(findstring $$1,$$(INCLUDED_FILES)))
INCLUDEDFILES	+= $$1
CURDIR		:= $$1
include         $$1/Makefile
$$(warn Double inclusion)
endif
endef

recurse = $(eval $(_recurse))

$(call recurse,localconf)
$(call recurse,config)
$(call recurse,misc)
$(call recurse,include)
$(call recurse,src)
$(call recurse,build)
$(call recurse,docs)

REDCOLOR	= \x1b[31;01m
BLUECOLOR	= \x1b[34;01m
YELLOWCOLOR	= \x1b[33;01m
GREENCOLOR	= \x1b[32;01m
PURPLECOLOR	= \x1b[35;01m
CYANCOLOR	= \x1b[36;01m
NOCOLOR		= \x1b[0m

rm_msg		= $(ECHO) -e "$(REDCOLOR)[RM]$(NOCOLOR)		$1"
generate_msg	= $(ECHO) -e "$(BLUECOLOR)[GENERATE]$(NOCOLOR)	$1"
ld_msg	= $(ECHO) -e "$(YELLOWCOLOR)[LD]$(NOCOLOR)		$1 -> $2"
cc_msg	= $(ECHO) -e "$(GREENCOLOR)[CC]$(NOCOLOR)		$1 -> $2"
as_msg	= $(ECHO) -e "$(CYANCOLOR)[AS]$(NOCOLOR)		$1 -> $2"
objcopy_msg = $(ECHO) -e "$(PURPLECOLOR)[OBJCOPY]$(NOCOLOR)	$1 -> $2"
mkimage_msg = $(ECHO) -e "$(YELLOWCOLOR)[MKIMAGE]$(NOCOLOR)	$1 -> $2"

.DEFAULT_GOAL	= $(BUILDDIR)/binaries/kernel.bin
