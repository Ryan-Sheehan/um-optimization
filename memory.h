/* 
* register.h
* Rachel Ginsberg and Hayden Wolff
* Comp40 HW6
* Interface for memory module.
*/

#include <stdint.h>

#ifndef MEM_H
#define MEM_H
typedef struct mem_info *mem_info_p; 

extern mem_info_p init_segments(int num_inst);

extern uint32_t map_segment(mem_info_p mem, uint32_t len);

extern void mem_put(mem_info_p mem, uint32_t segment_id, uint32_t array_index, 
                    uint32_t val);

extern uint32_t mem_get(mem_info_p mem, uint32_t segment_id, 
                    uint32_t array_index);

extern void unmap_segment(mem_info_p mem, uint32_t segment_id);

extern void free_segments(mem_info_p *mem);

extern void load_program_mem(mem_info_p mem, uint32_t segment_id);

#endif