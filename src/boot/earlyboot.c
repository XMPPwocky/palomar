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

	parse_atags((struct atag *)atag_ptr);
};
