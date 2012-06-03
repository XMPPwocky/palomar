#pragma once

#include <stdint.h>

#define	ATAG_NONE	0x00000000
#define	ATAG_CORE	0x54410001
#define ATAG_MEM	0x54410002
#define	ATAG_VIDEOTEXT	0x54410003
#define	ATAG_RAMDISK	0x54410004
#define	ATAG_INITRD2	0x54420005
#define	ATAG_SERIAL	0x54410006
#define	ATAG_REVISION	0x54410007
#define	ATAG_VIDEOLFB	0x54410008
#define	ATAG_CMDLINE	0x54410009

struct atag_core {
	uint32_t flags;
	uint32_t pagesize;
	uint32_t rootdev;
};
struct atag_mem {
	uint32_t size;
	uint32_t start;
};
struct atag_initrd2 {
	uint32_t start;
	uint32_t size;
};
struct atag_cmdline {
	char *cmdline;
};

struct atag {
	uint32_t size; /* WORDS, not bytes! */
	uint32_t type;

	union {
		struct atag_core	core;
		struct atag_mem		mem;
		struct atag_initrd2	initrd2;
		struct atag_cmdline	cmdline;
	} tag;
};

extern void parse_atags(struct atag *tag);
