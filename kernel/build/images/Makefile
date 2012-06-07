IMAGEDIR	:= $(CURDIR)

CLEANABLES	+= $(IMAGEDIR)/uImage

.PHONY:	uImage
uImage:	$(IMAGEDIR)/uImage

$(IMAGEDIR)/uImage: $(BINDIR)/kernel.bin
	@$(call mkimage_msg,$<,$@)
	@$(MKIMAGE) -A $(MKIMAGE_ARCH_NAME) -O linux -T kernel -C none \
		-a $(CONFIG_LOAD_ADDRESS) -e $(CONFIG_LOAD_ADDRESS) \
		-n "Palomar $(VERSION)" -d $< $@ > /dev/null 
