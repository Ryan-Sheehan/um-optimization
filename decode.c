/* 
* decode.c
* Originally Rachel Ginsberg and Hayden Wolff
* Edited by Alex Pantuck and Ryan Sheehan
* Comp40 HW7
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
static struct inst {
        int opcode;
        uint32_t rega;
        uint32_t regb;
        uint32_t regc;
        uint32_t val;
} instruction;

const uint32_t LSB_RA = 6, LSB_RB = 3, LSB_RC = 0, LSB_OP = 28,
        LSB_13V = 0, LSB_13R = 25;
/* Predefined bit masks because they dont change */
const uint32_t MASK_RA = 448, MASK_RB = 56, MASK_RC = 7,
        MASK_OP = 4026531840, MASK_13_R = 234881024,
        MASK_13_V = 33554431;

static inline uint32_t mask_code(const uint32_t, 
    const uint32_t, const uint32_t);

/*
 * function: unpack
 * parameters: uint32_t word (an instruction)
 * returns: inst_p, pointer to an instruction struct
 * does: unpacks a word using Bitpack into its opcode,
 *       and 3 different register identifiers (a, b, c)
 */
void unpack(uint32_t word) 
{
        uint32_t opcode = mask_code(word, MASK_OP, LSB_OP);
        instruction.opcode = opcode;

        if (opcode < 13) {
                instruction.rega = mask_code(word, MASK_RA, LSB_RA);
                instruction.regb = mask_code(word, MASK_RB, LSB_RB);
                instruction.regc = mask_code(word, MASK_RC, LSB_RC);
        } else {
                instruction.rega = mask_code(word, MASK_13_R, LSB_13R);
                instruction.val = mask_code(word, MASK_13_V, LSB_13V);
        } 
}


/*
 * function: get_opcode
 * parameters: inst_p pointer to instruction struct
 * returns: int opcode
 * does: opcode accessor
 */
int get_opcode(void)
{
        return instruction.opcode;
}


/*
 * function: get_rega
 * parameters: inst_p pointer to instruction struct
 * returns: uint32_t register A identifier
 * does: accessor for register identifier
 */
uint32_t get_rega(void)
{
        return instruction.rega;
}



/*
 * function: get_regb
 * parameters: inst_p pointer to instruction struct
 * returns: uint32_t register B identifier
 * does: accessor for register identifier
 */
uint32_t get_regb(void)
{
        return instruction.regb;
}


/*
 * function: get_regc
 * parameters: inst_p pointer to instruction struct
 * returns: uint32_t register C identifier
 * does: accessor for register identifier
 */
uint32_t get_regc(void)
{
        return instruction.regc;
}


/*
 * function: get_val
 * parameters: inst_p pointer to instruction struct
 * returns: uint32_t value 
 * does: accessor for unsigned binary value for
 *       opcode 13
 */
uint32_t get_val(void)
{
        return instruction.val;
}

/** Private Functions: **/

/* Basically just Bitpack_getu except it uses a predefined bit mask */
static inline uint32_t mask_code(uint32_t code, uint32_t mask, uint32_t lsb)
{
        return (code & mask) >> lsb;
}