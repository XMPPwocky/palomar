#include <stdint.h>

#include "config.h"
#include "types.h"
#include "boot/earlyboot.h"
#include "boot/atag.h"

void earlyboot(register_t zero, register_t mach_type,
		register_t atag_ptr) {
	if (zero != 0) {
		return;
	};

	struct atag *current_tag = (struct atag *)atag_ptr;
	
	for (; current_tag->type != ATAG_NONE;
			current_tag = (struct atag *)(
				(char *)current_tag) + current_tag->size) {
		switch (current_tag->type) {
			case ATAG_CORE:
				break;
			default:
				break;
		}
	}
}
