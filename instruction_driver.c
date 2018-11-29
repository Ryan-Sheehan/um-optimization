/* 
* instruction_driver.c
* Rachel Ginsberg and Hayden Wolff
* Comp40 HW6
* Instruction driver module implementation: reads instructions from a file 
* and stores them in memory. It then reads the instructions and performs 
* the given operation.
*/

#include "instruction_driver.h"
#include <stdlib.h>
#include <sys/stat.h>

typedef enum Um_opcode {
        CMOV = 0, SLOAD, SSTORE, ADD, MUL, DIV,
        NAND, HALT, ACTIVATE, INACTIVATE, OUT, IN, LOADP, LV
} Um_opcode;


/*
 * function: driver
 * parameters: FILE *fp, char *filename
 * returns: void
 * does: a driver to handle calling functions to
 *       initialize memory/registers and deal with
 *       the different instructions
 *       
 */
void driver(FILE *fp, char *filename)
{
        register_p reg; 
        mem_info_p mem; 
        init_um(fp, filename, &reg, &mem);

        run(reg, mem);
}


/*
 * function: init_um
 * parameters: FILE *fp, char *filename, register_p *reg (PP to 
               register struct), mem_info_p *mem (PP to memory struct)
 * returns: void
 * does: initializes register array and memory segments, puts the 
 *       instructions in segment 0 of memory
 */
void init_um(FILE *fp, char *filename, register_p *reg, mem_info_p *mem)
{
        struct stat st;
        int size;
        int c;
        uint32_t word;

        stat(filename, &st);
        size = st.st_size;

        *reg = init_arr();
        *mem = init_segments(size);
        word = 0;
        for (int i = 0; i < (size/4); i++) {
                for (int lsb = 24; lsb >= 0; lsb -=8) {
                        c = fgetc(fp);
                        if (c != EOF) {
                                 word = Bitpack_newu(word, 8, lsb, c);
                        }
                }
                mem_put(*mem, 0, (uint32_t)i, word);
        }
}


/*
 * function: run
 * parameters: register_p reg (pointer to register struct), 
 *             mem_info_p mem (pointer to memory struct)
 * returns: void
 * does: interface between decoding, memory, and register 
 *       modules, given an instruction and its opcode calls
 *       the respective instruction function
 */
void run(register_p reg, mem_info_p mem)
{
        int counter;
        uint32_t word;
        inst_p decoded_instruction;
        int opcode;

        counter = 0;
        opcode = 0;

        while (opcode != HALT) {
                word = mem_get(mem, 0, counter);

                decoded_instruction = unpack(word);
                opcode = get_opcode(decoded_instruction);

                if (opcode == CMOV) {
                        cmov(decoded_instruction, reg);
                } else if (opcode == SLOAD) {
                        sload(decoded_instruction, reg, mem);
                } else if (opcode == SSTORE) {
                        sstore(decoded_instruction, reg, mem);
                } else if (opcode == ADD) {
                        add(decoded_instruction, reg);
                } else if (opcode == MUL) {
                        mul(decoded_instruction, reg);
                } else if (opcode == DIV) {
                        divide(decoded_instruction, reg);
                } else if (opcode == NAND) {
                        nand(decoded_instruction, reg);
                } else if (opcode == HALT) {
                        halt();
                } else if (opcode == ACTIVATE) {                        
                        activate(decoded_instruction, reg, mem);
                } else if (opcode == INACTIVATE) {
                        inactivate(decoded_instruction, reg, mem);
                } else if (opcode == OUT) {
                        output(decoded_instruction, reg);
                } else if (opcode == IN) {
                        input(decoded_instruction, reg);
                } else if (opcode == LOADP) {
                        loadp(decoded_instruction, reg, mem, &counter);
                } else if (opcode == LV) {
                        loadv(decoded_instruction, reg);
                }
                if (opcode != LOADP) {
                        counter++;
                }
                free(decoded_instruction);
                decoded_instruction = NULL;
        }
        free_arr(&reg);
        free_segments(&mem);
}


/*
 * function: cmov
 * parameters: inst_p inst, register_p reg
 * returns: void
 * does: conditional move-- if register c doesn't have 0,  
 *        then value of register B goes in register A
 */
void cmov(inst_p inst, register_p reg)
{
        uint32_t b;
        uint32_t c;

        b = reg_get(reg, get_regb(inst));
        c = reg_get(reg, get_regc(inst));

            if (c != 0) {
                    reg_put(reg, get_rega(inst), b);
            }
}


/*
 * function: sload
 * parameters: inst_p inst, register_p reg,
               mem_info_p mem
 * returns: void
 * does: segmented load-- accesss segment ID in register B
 *       and array index in register c, put that respective
 *       value in register c     
 */
void sload(inst_p inst, register_p reg, mem_info_p mem)
{
        uint32_t b;
        uint32_t c;

        b = reg_get(reg, get_regb(inst));
        c = reg_get(reg, get_regc(inst));
        uint32_t mem_val = mem_get(mem, b, c);

        reg_put(reg, get_rega(inst), mem_val);
}


/*
 * function: sstore
 * parameters: inst_p inst, register_p reg,
               mem_info_p mem
 * returns: void
 * does: segmented load-- accesss segment ID in register B
 *       and array index in register c, put that respective
 *       value in register c     
 */
void sstore(inst_p inst, register_p reg, mem_info_p mem)
{
        uint32_t a;
        uint32_t b;
        uint32_t c;

        a = reg_get(reg, get_rega(inst));
        b = reg_get(reg, get_regb(inst));
        c = reg_get(reg, get_regc(inst));
        mem_put(mem, a, b, c);
}


/*
 * function: add
 * parameters: inst_p inst, register_p reg,
 * returns: void
 * does: add-- adds values in registers B and C,
 *       puts result in register A    
 */
void add(inst_p inst, register_p reg)
{
        uint32_t b;
        uint32_t c;

        b = reg_get(reg, get_regb(inst));
        c = reg_get(reg, get_regc(inst));

        reg_put(reg, get_rega(inst), (b + c));
}


/*
 * function: mul
 * parameters: inst_p inst, register_p reg,
 * returns: void
 * does: multiply-- multiplies values in registers B and C,
 *       puts result in register A    
 */
void mul(inst_p inst, register_p reg)
{
        uint32_t b;
        uint32_t c;

        b = reg_get(reg, get_regb(inst));
        c = reg_get(reg, get_regc(inst));

        reg_put(reg, get_rega(inst), (b * c));

}


/*
 * function: divide
 * parameters: inst_p inst, register_p reg,
 * returns: void
 * does: divide-- divides values in registers B and C,
 *       puts result in register A    
 */
void divide(inst_p inst, register_p reg)
{
        uint32_t b;
        uint32_t c;

        b = reg_get(reg, get_regb(inst));
        c = reg_get(reg, get_regc(inst));

        reg_put(reg, get_rega(inst), (b / c));
}


/*
 * function: nand
 * parameters: inst_p inst, register_p reg,
 * returns: void
 * does: bitwise NAND-- NANDS the values in 
 *       registers B and C, puts result in 
 *       register A   
 */
void nand(inst_p inst, register_p reg)
{
        uint32_t b;
        uint32_t c;
        uint32_t together;
        uint32_t not_together;

        b = reg_get(reg, get_regb(inst));
        c = reg_get(reg, get_regc(inst));
        together = b & c;
        not_together = ~(together);

        reg_put(reg, get_rega(inst), not_together);
}


/*
 * function: halt
 * parameters: none
 * returns: void
 * does: nothing 
 */
void halt()
{

}


/*
 * function: activate
 * parameters: inst_p inst, register_p reg,
 *             mem_info_p mem
 * returns: void
 * does: map segment-- a new segment is created with the
 *       number of words in register C, each word in the 
 *       segment is initialized to 0, a bit pattern that is 
 *               not all 0 and does not identify any curently mapped 
 *               segment is placed in register B   
 */
void activate(inst_p inst, register_p reg, mem_info_p mem)
{
        uint32_t c;
        uint32_t id;

        c = reg_get(reg, get_regc(inst));
        id = map_segment(mem, c);

        reg_put(reg, get_regb(inst), id);
}


/*
 * function: inactivate
 * parameters: inst_p inst, register_p reg,
 *             mem_info_p mem
 * returns: void
 * does: unmap segment--, the segment in register
 *       c is unmapped, future map segment instructions
 *       may reuse the identfier in register C
 */
void inactivate(inst_p inst, register_p reg, mem_info_p mem)
{
        uint32_t c;

        c = reg_get(reg, get_regc(inst));
        unmap_segment(mem, c);
}


/*
 * function: output
 * parameters: inst_p inst, register_p reg
 * returns: void
 * does: the value in register C is written to
 *       the I/O device immediately, only values
 *       0-255 are allowed
 */
void output(inst_p inst, register_p reg)
{
        uint32_t out;

        out = reg_get(reg, get_regc(inst));
        if (out <= 255) {
                putchar(out);
        }
}


/*
 * function: input
 * parameters: inst_p inst, register_p reg
 * returns: void
 * does: waits for input on the I/O device,
 *       when input arrives register C is loaded
 *       with the input, which must be a value from
 *       0-255, if EOF is signaled then register C is
 *       loaded with a full 32-bit word in which every
 *       bit is a 1 
 */
void input(inst_p inst, register_p reg)
{
        uint32_t in;

        in = getchar();
        if ((int)in == EOF) {
                in = -1;
        }
        reg_put(reg, get_regc(inst), in);
}


/*
 * function: loadp
 * parameters: inst_p inst, register_p reg,
 *             mem_info_p mem
 * returns: void
 * does: load program-- segment whose ID is held in 
 *        register B is duplicated and the duplicate 
 *        replaces the instruction segment, which is 
 *        abandoned. The program counter is set to point
 *        to the new instruction from register C in the
 *        instruction segment. If the value in register B is
 *        0, then just the counter is changed. 
 */
void loadp(inst_p inst, register_p reg, mem_info_p mem, int *counter)
{
        uint32_t b;
        uint32_t c;

        b = reg_get(reg, get_regb(inst));
        c = reg_get(reg, get_regc(inst));

        if (b == 0) {
                *counter = c;
        } else {
                load_program_mem(mem, b);
        }
        
}


/*
 * function: loadv
 * parameters: inst_p inst, register_p reg
 * returns: void
 * does: sets the value in register A to the 
 *       25 bit unsigned binary value
 */
void loadv(inst_p inst, register_p reg)
{
        reg_put(reg, get_rega(inst), get_val(inst));
}