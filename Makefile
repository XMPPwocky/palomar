.PHONY:	ALWAYS_BUILD
ALWAYS_BUILD: ;

INCLUDED_FILES	:=

define _recurse =
ifeq	(,$$(findstring $$1,$$(INCLUDED_FILES)))
INCLUDEDFILES	+= $$1
CURDIR_PTR	:= _CURDIR_UNIQUE_$$(words $$(INCLUDED_FILES))
$$(CURDIR_PTR)	:= $$1
include         $$1/Makefile
$$(warn Double inclusion)
endif
endef

recurse = $(eval $(_recurse))

$(call recurse,localconf)
$(call recurse,src)
$(call recurse,config)
$(call recurse,include)
$(call recurse,docs)
$(call recurse,build)

REDCOLOR	= \x1b[31;01m
BLUECOLOR	= \x1b[34;01m
YELLOWCOLOR	= \x1b[33;01m
GREENCOLOR	= \x1b[32;01m
NOCOLOR		= \x1b[0m

rm_msg		= $(ECHO) -e "$(REDCOLOR)[RM]$(NOCOLOR)	$1"
generate_msg	= $(ECHO) -e "$(BLUECOLOR)[GENERATE]$(NOCOLOR)	$1"
link_msg	= $(ECHO) -e "$(YELLOWCOLOR)[LINK]$(NOCOLOR)	$1"
compile_msg	= $(ECHO) -e "$(GREENCOLOR)[COMPILE]$(NOCOLOR)	$1"

.DEFAULT_GOAL	= $(BUILDDIR)/binaries/kernel.bin
