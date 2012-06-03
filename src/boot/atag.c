#include "config.h"
#include "boot/atag.h"

static void parse_atag_core(struct atag_core *tag) {
	return; /* there's not much useful in ATAG_CORE, really */
}

static void parse_atag_mem(struct atag_mem *tag) {
	return; /* FIXME: not implemented */	
}

void parse_atags(struct atag *start_tag) {
	struct atag *current_tag = start_tag;

        for (; current_tag->type != ATAG_NONE;
                        current_tag = (struct atag *)(
                        (char *)current_tag) +
                        (current_tag->size / CONFIG_WORDSIZE)) {

                switch (current_tag->type) {
                        case ATAG_CORE:
				if (current_tag->size == 2) {
					/* no structure attached */
				} else {
					parse_atag_core(&current_tag->tag.core);				}
				break;
			 
                        default:
                                break;
                }
        }
}
