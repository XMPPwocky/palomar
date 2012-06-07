DEPDIR	:= $(CURDIR)

DEP_MAKEFILES	= $(patsubst $(SRCDIR)/%.c,$(DEPDIR)/%.d,$(filter \
	%.c,$(SOURCEFILES)))

ifneq	($(MAKECMDGOALS),clean)
include	$(DEP_MAKEFILES)
endif

DISTCLEANABLES	+= $(DEP_MAKEFILES)

$(DEPDIR)/%.d: $(SRCDIR)/%.c | $(BUILDCONFIGDIR)/config.h
	@$(call generate_msg,$@)
	@$(MKDIR) -p $(dir $@)
	@set -e; rm -f $@; \
		$(CC) -MM -MT "\$$(OBJDIR)/$*.c.o" $(CPPFLAGS) $< > $@.$$$$; \
		sed 's,\($*\)\.o[ :]*,\1.o $@ : ,g' < $@.$$$$ > $@; \
		rm -f $@.$$$$
