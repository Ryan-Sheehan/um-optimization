/* 
* register.c
* Rachel Ginsberg and Hayden Wolff
* Comp40 HW6
* Implementation for register module stores and accesses values 
* in registers.
*/

#include "register.h"
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include "uarray.h"
#include "stack.h"
#include "seq.h"

/* struct to hold an Uarray_T of 8 registers */ 
struct reg_info {
        UArray_T ray;
 };


/*
 * function: init_arr
 * parameters: none
 * returns: register_p (pointer to register struct)
 * does: initializes the UArray_T to hold 8 registers
 *       (one register in each index)
 */
register_p init_arr() 
{
        register_p reg;
        int len;
        uint32_t *temp;

        reg = NULL;
        len = 8;
        reg = malloc(sizeof(struct reg_info));
        assert(reg != NULL);

        reg->ray = UArray_new(len, sizeof(uint32_t));

        for (int i = 0; i < len; i++) {
                temp = UArray_at(reg->ray, i);
                *temp = 0;
        }

        return reg;
}


/*
 * function: reg_put
 * parameters:register_p, uint32_t reg_id,
 *            uint32_t val
 * returns: void
 * does: puts a value in a specified register  
 */
void reg_put(register_p reg, uint32_t reg_id, uint32_t val)
{
        uint32_t *temp;
        temp = UArray_at(reg->ray, (int)reg_id);
        *temp = val;
}


/* returns value/word stored in register */
/*
 * function: reg_get
 * parameters:register_p, uint32_t reg_id
 * returns: uint32_t word in register
 * does: gets a value at a given register id  
 */
uint32_t reg_get(register_p reg, uint32_t reg_id)
{
        uint32_t *val;
        val = UArray_at(reg->ray, (int)reg_id);
        return *val;
}


/*
 * function: free_arr
 * parameters: register_p *reg
 * returns: void
 * does: frees the UArray of registers 
 */
void free_arr(register_p *reg)
{
        UArray_free(&((*reg)->ray));
        free(*reg);
        reg = NULL;
}