#pragma once

struct atag {
	uint32_t size; /* in WORDS, not bytes! */
	uint32_t type;
	union {
		;
	} tag;
};

extern struct atag *atags_phys_addr;
