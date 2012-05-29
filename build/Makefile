.PHONY: clean
clean:
	@$(ECHO) "[CLEAN] Cleaning..."
	@$(RM) -rf $(filter-out build/Makefile,$(wildcard build/*))

build/%/:
	@$(MKDIR) -p $@
