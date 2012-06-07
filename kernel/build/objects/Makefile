OBJDIR	:= $(CURDIR)

OBJECTS	= $(patsubst $(SRCDIR)/%,$(OBJDIR)/%, \
		$(patsubst %.s,%.asm.o,$(SOURCEFILES:.c=.c.o)))

CLEANABLES	+= $(OBJECTS)

ifdef	DEBUG
CFLAGS	+= -g
ASFLAGS	+= -g
endif

$(OBJDIR)/%.c.o:	$(SRCDIR)/%.c
	@$(call cc_msg,$<,$@)
	@$(MKDIR) -p $(dir $@)
	@$(CC) $(CPPFLAGS) $(CFLAGS) -c $< -o $@

$(OBJDIR)/%.asm.o:	$(SRCDIR)/%.s
	@$(call as_msg,$<,$@)
	@$(MKDIR) -p $(dir $@)
	@$(AS) $(ASFLAGS) $< -o $@

$(OBJDIR)/earlyboot/%.c.o:	private CFLAGS	+= -fPIE
