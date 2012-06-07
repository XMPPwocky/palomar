SRCDIR	:= $(CURDIR)

SOURCEFILES	:=

$(foreach d,$(shell $(FIND) \
	$(wildcard $(SRCDIR)/*) -type d),$(call recurse,$(d)))
