/* 
* memory.c
* Rachel Ginsberg and Hayden Wolff
* Comp40 HW6
* memory module implementation: initalizes structures for memory and allows
* for data and instructions to retrieve and inserte words into memory.
*/

#include "memory.h"
#include <stdlib.h>
#include "buarray.h"
#include "stack.h"
#include "buseq.h"

typedef uint32_t Umsegment_ID; 

/* struct mem_info
 * typedef as a pointer to a struct as mem_info_p
 * in memory.h, contains a Hanson Sequence, a Hanson
 * Stack and a uint32_t to handle memeory
 */
static struct mem_info {
        BUSeq_T segments;
        Stack_T open_indices;
        uint32_t max_index;
} mem_manager;


/*
 * function: init_segments
 * parameters: int num_inst (number of instructions)
 * returns: mem_info_p, memory struct with data initialized
 * does: initializes the memory by creating a Uarray of size of
 *       number of instructions, puts it in the new Hanson sequence,
 *       creates Hanson stack to track open indices
 *       
 */
void init_segments(const int num_inst)
{
        BUArray_T seg0 = BUArray_new(num_inst);
        mem_manager.segments = BUSeq_new(10);
        BUSeq_addhi(mem_manager.segments, seg0);
        mem_manager.max_index = 1;
        mem_manager.open_indices = Stack_new();
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
uint32_t map_segment(const uint32_t len)
{
        uint32_t index;
        BUArray_T mem_seg = BUArray_new(len);

        if (Stack_empty(mem_manager.open_indices)) {
                BUSeq_addhi(mem_manager.segments, mem_seg);
                index = (mem_manager.max_index);
                mem_manager.max_index = (mem_manager.max_index) + 1; 
                
                return index;

        } else {
                index = ((Umsegment_ID)(uintptr_t)
                        Stack_pop(mem_manager.open_indices));
                BUSeq_put(mem_manager.segments, index, mem_seg);
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
void mem_put(const uint32_t segment_id, const uint32_t array_index, 
        const uint32_t val)
{
        BUArray_T mem_seg = BUSeq_get(mem_manager.segments, segment_id); 
        BUArray_put(mem_seg, array_index, val);
}


/*
 * function: mem_get
 * parameters: mem_info_p mem, uint32_t segment_id,
 *             uint32_t array_index
 * returns: uint32_t (word stored in memory)
 * does: gets a value from memory at given segment id and index 
 */
uint32_t mem_get(const uint32_t segment_id, const uint32_t array_index)
{
        BUArray_T mem_seg = BUSeq_get(mem_manager.segments, segment_id);
        return BUArray_get(mem_seg, array_index);
}

/*
 * function: load_program_mem
 * parameters: mem_info_p mem, uint32_t segment_id,
 * returns: void
 * does: loads new instructions in segment 0 of memory 
 */
void load_program_mem(const uint32_t segment_id)
{
        BUArray_T seg_0 = BUSeq_get(mem_manager.segments, 0);
        BUArray_T mem_seg = BUSeq_get(mem_manager.segments, segment_id);
        uint32_t len = BUArray_length(mem_seg);
        BUArray_reloc(&seg_0, len);

        for (uint32_t i = 0; i < len; i++) 
        {
                uint32_t cpy = BUArray_get(mem_seg, i);
                BUArray_put(seg_0, i, cpy);
        }
}


/*
 * function: unmap_segment
 * parameters: mem_info_p mem, uint32_t segment_id,
 * returns: void
 * does: unmaps a segment by freeing it and then pushing its
 *       index onto the stack of open indices for reuse   
 */
void unmap_segment(const uint32_t segment_id)
{
        BUArray_T mem_seg = BUSeq_put(mem_manager.segments, segment_id, NULL);
        BUArray_free(&mem_seg);
        Stack_push(mem_manager.open_indices, (void *)(uintptr_t)segment_id);
}

/*
 * function: free_segments
 * parameters: mem_info_p *mem
 * returns: void
 * does: puts a value in memory    
 */
void free_segments(void)
{
        int length = BUSeq_length(mem_manager.segments);
        for (int i = 0; i < length; i++) {
                BUArray_T seg = BUSeq_get(mem_manager.segments, i);
                if (seg != NULL)
                        BUArray_free(&seg);
        }
        BUSeq_free(&(mem_manager.segments));
        Stack_free(&(mem_manager.open_indices));
}