BINDIR	:= $(CURDIR)

CLEANABLES	+= $(BINDIR)/kernel.elf $(BINDIR)/kernel.bin

ifdef	DEBUG
LDFLAGS	+= -g
endif

$(BINDIR)/kernel.elf:	$(LINKERSCRIPT) $(EXTRALINKERSCRIPTS) $(OBJECTS)
	@$(call ld_msg,$(wordlist 2,$(words $^),$^),$@)
	@$(LD) $(LDFLAGS) -T $< $(wordlist 2,$(words $^),$^)\
		-o $@ -e _start

$(BINDIR)/kernel_nodebug.elf: $(BINDIR)/kernel.elf $(BINDIR)/kernel.dbg
	@$(call objcopy_msg,$<,$@)
	@$(OBJCOPY) $(OBJCOPYFLAGS) --strip-debug $< $@
	@$(OBJCOPY) $(OBJCOPYFLAGS) --add-gnu-debuglink=$(lastword $^) $@

$(BINDIR)/kernel.dbg:	$(BINDIR)/kernel.elf
	@$(call objcopy_msg,$<,$@)
	@$(OBJCOPY) $(OBJCOPYFLAGS) --only-keep-debug $< $@

$(BINDIR)/kernel.bin: $(BINDIR)/kernel_nodebug.elf
	@$(call objcopy_msg,$<,$@)
	@$(OBJCOPY) $(OBJCOPYFLAGS) -O binary $< $@
