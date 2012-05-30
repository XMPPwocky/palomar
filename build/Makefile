.PHONY: clean

BUILDDIR	:= $(CURDIR)

clean:
	@for FILE in `$(FIND) $(BUILDDIR) -type f ! -name Makefile`; do \
		$(call rm_msg,$$FILE); \
		$(RM) $$FILE; \
		done;

$(call recurse,$(BUILDDIR)/config)
$(call recurse,$(BUILDDIR)/objects)
$(call recurse,$(BUILDDIR)/binaries)
