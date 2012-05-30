.PHONY: clean

BUILDDIR	:= $($(CURDIR_PTR))

clean:
	@for FILE in `$(FIND) $(BUILDDIR) -type f ! -name Makefile`; do \
		$(call rm_msg,$$FILE); \
		$(RM) $$FILE; \
		done;

$(call recurse,$(BUILDDIR)/config)
$(call recurse,$(BUILDDIR)/binaries)
