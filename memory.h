/* 
* register.h
* Rachel Ginsberg and Hayden Wolff
* Comp40 HW6
* Interface for memory module.
*/

#include <stdint.h>

#ifndef MEM_H
#define MEM_H

extern void init_segments(int num_inst);

extern uint32_t map_segment(uint32_t len);

extern void mem_put(uint32_t segment_id, uint32_t array_index, uint32_t val);

extern uint32_t mem_get(uint32_t segment_id, uint32_t array_index);

extern void unmap_segment(uint32_t segment_id);

extern void free_segments(void);

extern void load_program_mem(uint32_t segment_id);

#endif