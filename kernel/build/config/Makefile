BUILDCONFIGDIR	:= $(CURDIR)

CONFIGURATION = $(filter CONFIG_%,$(.VARIABLES))

CLEANABLES	+= $(BUILDCONFIGDIR)/config.h

$(BUILDCONFIGDIR)/config.h:
	@$(call generate_msg,$@)
	@$(ECHO) "/* This is generated code! Do not modify! */" > $@
	@$(foreach key,$(CONFIGURATION), \
			$(ECHO) "#define $(key) $($(key))" >> $@;)

CPPFLAGS  += -I $(BUILDCONFIGDIR)
