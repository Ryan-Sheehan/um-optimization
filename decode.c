/* 
* decode.c
* Rachel Ginsberg and Hayden Wolff
* Comp40 HW6
* decode module implementation: can be used to pack and unpack words,
* has a function to unpack in the style of the um
*/

#include "decode.h"
#include <assert.h>
#include <stdlib.h>


/* struct inst
 * typedef as a pointer to a struct as inst_p
 * in deocde.h, contains 1 integer and 4 uint32_t
 * from unpacked instruction
 */
struct inst {
        int opcode;
        uint32_t rega;
        uint32_t regb;
        uint32_t regc;
        uint32_t val;
};


/*
 * function: unpack
 * parameters: uint32_t word (an instruction)
 * returns: inst_p, pointer to an instruction struct
 * does: unpacks a word using Bitpack into its opcode,
 *       and 3 different register identifiers (a, b, c)
 */
inst_p unpack(uint32_t word) 
{
        inst_p instruction;
        uint32_t opcode;

        instruction = malloc(sizeof(struct inst));
        assert(instruction != NULL);
          
        opcode = Bitpack_getu(word, 4, 28);
        instruction->opcode = opcode;

        if (opcode == 13) {
                instruction->rega = Bitpack_getu(word, 3, 25);
                instruction->val = Bitpack_getu(word, 25, 0);
        } else {
                instruction->rega = Bitpack_getu(word, 3, 6);
                instruction->regb = Bitpack_getu(word, 3, 3);
                instruction->regc = Bitpack_getu(word, 3, 0);
        }

        return instruction;
}


/*
 * function: get_opcode
 * parameters: inst_p pointer to instruction struct
 * returns: int opcode
 * does: opcode accessor
 */
int get_opcode(inst_p inst_info)
{
        return inst_info->opcode;
}


/*
 * function: get_rega
 * parameters: inst_p pointer to instruction struct
 * returns: uint32_t register A identifier
 * does: accessor for register identifier
 */
uint32_t get_rega(inst_p inst_info)
{
        return inst_info->rega;
}



/*
 * function: get_regb
 * parameters: inst_p pointer to instruction struct
 * returns: uint32_t register B identifier
 * does: accessor for register identifier
 */
uint32_t get_regb(inst_p inst_info)
{
        return inst_info->regb;
}


/*
 * function: get_regc
 * parameters: inst_p pointer to instruction struct
 * returns: uint32_t register C identifier
 * does: accessor for register identifier
 */
uint32_t get_regc(inst_p inst_info)
{
        return inst_info->regc;
}


/*
 * function: get_val
 * parameters: inst_p pointer to instruction struct
 * returns: uint32_t value 
 * does: accessor for unsigned binary value for
 *       opcode 13
 */
uint32_t get_val(inst_p inst_info)
{
        return inst_info->val;
}

/* not sure if we will keep these in here so i haven't commented them out*/
/***************************************/
Except_T Bitpack_Overflow = { "Overflow packing bits" };

static inline uint64_t shl(uint64_t word, unsigned bits)
{
        assert(bits <= 64);
        if (bits == 64)
                return 0;
        else
                return word << bits;
}

/*
 * shift R logical
 */
static inline uint64_t shr(uint64_t word, unsigned bits)
{
        assert(bits <= 64);
        if (bits == 64)
                return 0;
        else
                return word >> bits;
}

uint64_t Bitpack_getu(uint64_t word, unsigned width, unsigned lsb)
{
        unsigned hi = lsb + width; /* one beyond the most significant bit */
        assert(hi <= 64);
        /* different type of right shift */
        return shr(shl(word, 64 - hi),
                      64 - width); 
}

uint64_t Bitpack_newu(uint64_t word, unsigned width, unsigned lsb,
                      uint64_t value)
{
        unsigned hi = lsb + width; /* one beyond the most significant bit */
        assert(hi <= 64);
        if (!Bitpack_fitsu(value, width))
                RAISE(Bitpack_Overflow);
        return shl(shr(word, hi), hi)                 /* high part */
                | shr(shl(word, 64 - lsb), 64 - lsb)  /* low part  */
                | (value << lsb);                     /* new part  */
}

bool Bitpack_fitsu(uint64_t n, unsigned width)
{
        if (width >= 64)
                return true;
        /* thanks to Jai Karve and John Bryan  */
        /* clever shortcut instead of 2 shifts */
        return shr(n, width) == 0; 
}

