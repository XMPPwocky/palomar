#pragma once

#include <stdint.h>

#define SECTION_SIZE (1<<20)

typedef uint32_t translationtables_t[4096] __attribute__((aligned(16384)));

extern translationtables_t global_translation_tables;
