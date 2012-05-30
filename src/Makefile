SRCDIR	= $($(CURDIR_PTR))

SOURCEFILES	:=

$(foreach d,$(shell $(FIND) \
	$(wildcard $(SRCDIR)/*) -type d),$(call recurse,$(d)))
