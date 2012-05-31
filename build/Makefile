.PHONY: clean distclean

BUILDDIR	:= $(CURDIR)

distclean:	clean
	@for FILE in $(DISTCLEANABLES); do \
		$(call rm_msg,$$FILE); \
		$(RM) -f $$FILE; \
		done;
	
clean:
	@for FILE in $(CLEANABLES); do \
		$(call rm_msg,$$FILE); \
		$(RM) -f $$FILE; \
		done;

$(call recurse,$(BUILDDIR)/config)
$(call recurse,$(BUILDDIR)/deps)
$(call recurse,$(BUILDDIR)/objects)
$(call recurse,$(BUILDDIR)/binaries)
