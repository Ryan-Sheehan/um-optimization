/* 
* memory.c
* Rachel Ginsberg and Hayden Wolff
* Comp40 HW6
* memory module implementation: initalizes structures for memory and allows
* for data and instructions to retrieve and inserte words into memory.
*/

#include "memory.h"
#include <stdlib.h>
#include <stdio.h>
#include <assert.h>
#include "uarray.h"
#include "stack.h"
#include "seq.h"

typedef uint32_t Umsegment_ID; 

/* struct mem_info
 * typedef as a pointer to a struct as mem_info_p
 * in memory.h, contains a Hanson Sequence, a Hanson
 * Stack and a uint32_t to handle memeory
 */
struct mem_info {
        Seq_T segments;
        Stack_T open_indices;
        uint32_t max_index;
};


/*
 * function: init_segments
 * parameters: int num_inst (number of instructions)
 * returns: mem_info_p, memory struct with data initialized
 * does: initializes the memory by creating a Uarray of size of
 *       number of instructions, puts it in the new Hanson sequence,
 *       creates Hanson stack to track open indices
 *       
 */
mem_info_p init_segments(int num_inst)
{
        mem_info_p mem;

        mem = malloc(sizeof(struct mem_info));
        assert(mem != NULL);
        UArray_T seg0 = UArray_new(num_inst, sizeof(uint32_t));

        mem->segments = Seq_seq(seg0, NULL);
        mem->max_index = 1;
        mem->open_indices = Stack_new();

        return mem;
}


/*
 * function: map_segment
 * parameters: mem_info_p mem, uint32_t len (number of 
 *             words to be stored)
 * returns: uint32_t index of newly mapped segment
 * does: maps a segment by adding to the sequence and creating
 *       a Uarray at that segment-- adds high if all spots are filled
 *       otherwise pops open index off stack and puts the new data in
 *       that spot in the sequence
 */
uint32_t map_segment(mem_info_p mem, uint32_t len)
{
        uint32_t index;
        uint32_t *temp;

        UArray_T mem_seg = UArray_new(len, sizeof(uint32_t));

        for (int i = 0; i < (int)len; i++) {
                temp = UArray_at(mem_seg, i);
                *temp = 0;
        }

        if (Stack_empty(mem->open_indices)) {
                Seq_addhi(mem->segments, mem_seg);
                index = (mem->max_index);
                mem->max_index = (mem->max_index) + 1; 
                
                return index;

        } else {
                index = ((Umsegment_ID)(uintptr_t)
                        Stack_pop(mem->open_indices));
                Seq_put(mem->segments, (int)index, mem_seg);
                return index;
        }
}


/*
 * function: mem_put
 * parameters: mem_info_p mem, uint32_t segment_id,
 *             uint32_t array_index, uint32_t val
 * returns: void
 * does: puts a value in memory at a given segment_id and 
 *       index
 */
void mem_put(mem_info_p mem, uint32_t segment_id, uint32_t array_index, 
        uint32_t val)
{
        UArray_T mem_seg;
        uint32_t *temp;

        mem_seg = ((UArray_T)Seq_get(mem->segments, (int)segment_id)); 
        temp = (uint32_t *)UArray_at(mem_seg, (int)array_index);
        *temp = val;
}


/*
 * function: mem_get
 * parameters: mem_info_p mem, uint32_t segment_id,
 *             uint32_t array_index
 * returns: uint32_t (word stored in memory)
 * does: gets a value from memory at given segment id and index 
 */
uint32_t mem_get(mem_info_p mem, uint32_t segment_id, uint32_t array_index)
{
        UArray_T mem_seg;
        uint32_t val;

        mem_seg = ((UArray_T )Seq_get(mem->segments, (int)segment_id));
        val = *((uint32_t *)UArray_at(mem_seg, (int)array_index));

        return val;

}

/*
 * function: load_program_mem
 * parameters: mem_info_p mem, uint32_t segment_id,
 * returns: void
 * does: loads new instructions in segment 0 of memory 
 */
void load_program_mem(mem_info_p mem, uint32_t segment_id)
{
        UArray_T mem_seg;
        UArray_T new_seg;
        UArray_T seg_0;
        int len;
        uint32_t orig_val;
        uint32_t *new_val;

        seg_0 = ((UArray_T )Seq_get((mem)->segments, 0));

        mem_seg = ((UArray_T )Seq_get((mem)->segments, (int)segment_id));
        len = UArray_length(mem_seg);

        new_seg = UArray_new(len, sizeof(uint32_t));
        for (int i = 0; i < len; i++) 
        {
                orig_val = *((uint32_t *)UArray_at(mem_seg, i));
                new_val = ((uint32_t *)UArray_at(new_seg, i));
                *new_val = orig_val;
        }

        Seq_put(mem->segments, 0, new_seg);
        UArray_free(&seg_0);
}


/*
 * function: unmap_segment
 * parameters: mem_info_p mem, uint32_t segment_id,
 * returns: void
 * does: unmaps a segment by freeing it and then pushing its
 *       index onto the stack of open indices for reuse   
 */
void unmap_segment(mem_info_p mem, uint32_t segment_id)
{
        UArray_T mem_seg;

        mem_seg = (UArray_T )Seq_get(mem->segments, (int)segment_id);
        Seq_put(mem->segments, (int)segment_id, NULL);
        UArray_free(&mem_seg);

        Stack_push(mem->open_indices, (void *)(uintptr_t)segment_id);
}

/*
 * function: free_segments
 * parameters: mem_info_p *mem
 * returns: void
 * does: puts a value in memory    
 */
void free_segments(mem_info_p *mem) {
        UArray_T inst_seg;

        while (Seq_length((*mem)->segments) != 0) {
                inst_seg = ((UArray_T )Seq_remhi((*mem)->segments));
                if (inst_seg != NULL) {
                        UArray_free(&inst_seg);
                } 
        }

        Seq_free(&((*mem)->segments));
        Stack_free(&((*mem)->open_indices));
        free(*mem);
        mem = NULL;
}