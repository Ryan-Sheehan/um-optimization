/* 
* ruction_driver.c
* Rachel Ginsberg and Hayden Wolff
* Comp40 HW6
* instruction driver module implementation: reads ructions from a file 
* and stores them in memory. It then reads the ructions and performs 
* the given operation.
*/

#include "instruction_driver.h"
#include <stdlib.h>
#include <sys/stat.h>
#include <endian.h>
#include <assert.h>

#define WORD_SIZE sizeof(uint32_t)

typedef enum Um_opcode {
        CMOV = 0, SLOAD, SSTORE, ADD, MUL, DIV,
        NAND, HALT, ACTIVATE, INACTIVATE, OUT, IN, LOADP, LV
} Um_opcode;

static void init_um(FILE *fp, char *filename);
static void run(void);
static void cmov(void);
static void sload(void);
static void sstore(void);
static void add(void);
static void mul(void);
static void divide(void);
static void nand(void);
static void halt();
static void activate(void);
static void inactivate(void);
static void output(void);
static void input(void);
static void loadp(int *counter);
static void loadv(void);

/*
 * function: driver
 * parameters: FILE *fp, char *filename
 * returns: void
 * does: a driver to handle calling functions to
 *       initialize memory/registers and deal with
 *       the different ructions
 *       
 */
void driver(FILE *fp, char *filename)
{ 
        init_um(fp, filename);
        run();
}


/*
 * function: init_um
 * parameters: FILE *fp, char *filename, register_p *reg (PP to 
               register struct), mem_info_p *mem (PP to memory struct)
 * returns: void
 * does: initializes register array and memory segments, puts the 
 *       ructions in segment 0 of memory
 */
static void init_um(FILE *fp, char *filename)
{
        struct stat st;
        stat(filename, &st);
        int size = st.st_size;
        uint32_t length = size / WORD_SIZE;

        init_segments(size);

        /* Every 4 bytes becomes a word */
        uint32_t matches, *words = malloc(WORD_SIZE * length);
        assert(words != NULL);
        matches = fread(words, WORD_SIZE, length, fp);
        assert(matches == length);
        if (matches != length) {
                fprintf(stderr, "Error reading from file '%s'\n", filename);
                exit(EXIT_FAILURE);
        }
        
        for (uint32_t i = 0; i < length; i++)
            mem_put(0, i, be32toh(words[i]));

        free(words);
}


/*
 * function: run
 * parameters: void (pointer to register struct), 
 *             mem_info_p mem (pointer to memory struct)
 * returns: void
 * does: interface between decoding, memory, and register 
 *       modules, given an instruction and its opcode calls
 *       the respective instruction function
 */
static void run(void)
{
        int counter;
        uint32_t word;
        int opcode;

        counter = 0;
        opcode = 0;

        while (opcode != HALT) {
                word = mem_get(0, counter);

                unpack(word);
                opcode = get_opcode();

                if (opcode == CMOV) {
                        cmov();
                } else if (opcode == SLOAD) {
                        sload();
                } else if (opcode == SSTORE) {
                        sstore();
                } else if (opcode == ADD) {
                        add();
                } else if (opcode == MUL) {
                        mul();
                } else if (opcode == DIV) {
                        divide();
                } else if (opcode == NAND) {
                        nand();
                } else if (opcode == HALT) {
                        halt();
                } else if (opcode == ACTIVATE) {                        
                        activate();
                } else if (opcode == INACTIVATE) {
                        inactivate();
                } else if (opcode == OUT) {
                        output();
                } else if (opcode == IN) {
                        input();
                } else if (opcode == LOADP) {
                        loadp(&counter);
                } else if (opcode == LV) {
                        loadv();
                }
                if (opcode != LOADP) {
                        counter++;
                }
        }
        free_segments();
}


/*
 * function: cmov
 * parameters: void
 * returns: void
 * does: conditional move-- if register c doesn't have 0,  
 *        then value of register B goes in register A
 */
static void cmov(void)
{
        uint32_t c = registers[get_regc()];
        if (c != 0) {
                uint32_t b = registers[get_regb()];
                registers[get_rega()] = b;
        }
}


/*
 * function: sload
 * parameters: void,
               mem_info_p mem
 * returns: void
 * does: segmented load-- accesss segment ID in register B
 *       and array index in register c, put that respective
 *       value in register c     
 */
static void sload(void)
{
        uint32_t b = registers[get_regb()];
        uint32_t c = registers[get_regc()];
        uint32_t mem_val = mem_get(b, c);
        registers[get_rega()] = mem_val;
}


/*
 * function: sstore
 * parameters: void,
               mem_info_p mem
 * returns: void
 * does: segmented load-- accesss segment ID in register B
 *       and array index in register c, put that respective
 *       value in register c     
 */
static void sstore(void)
{
        uint32_t a = registers[get_rega()];
        uint32_t b = registers[get_regb()];
        uint32_t c = registers[get_regc()];
        mem_put(a, b, c);
}


/*
 * function: add
 * parameters: void,
 * returns: void
 * does: add-- adds values in registers B and C,
 *       puts result in register A    
 */
static void add(void)
{
        uint32_t b = registers[get_regb()];
        uint32_t c = registers[get_regc()];
        registers[get_rega()] = (b + c);
}


/*
 * function: mul
 * parameters: void,
 * returns: void
 * does: multiply-- multiplies values in registers B and C,
 *       puts result in register A    
 */
static void mul(void)
{
        uint32_t b = registers[get_regb()];
        uint32_t c = registers[get_regc()];
        registers[get_rega()] = (b * c);
}


/*
 * function: divide
 * parameters: void,
 * returns: void
 * does: divide-- divides values in registers B and C,
 *       puts result in register A    
 */
static void divide(void)
{
        uint32_t b = registers[get_regb()];
        uint32_t c = registers[get_regc()];
        registers[get_rega()] = (b / c);
}


/*
 * function: nand
 * parameters: void,
 * returns: void
 * does: bitwise NAND-- NANDS the values in 
 *       registers B and C, puts result in 
 *       register A   
 */
static void nand(void)
{
        uint32_t b = registers[get_regb()];
        uint32_t c = registers[get_regc()];
        registers[get_rega()] = ~(b & c);
}


/*
 * function: halt
 * parameters: none
 * returns: void
 * does: nothing 
 */
static void halt()
{

}


/*
 * function: activate
 * parameters: void,
 *             mem_info_p mem
 * returns: void
 * does: map segment-- a new segment is created with the
 *       number of words in register C, each word in the 
 *       segment is initialized to 0, a bit pattern that is 
 *               not all 0 and does not identify any curently mapped 
 *               segment is placed in register B   
 */
static void activate(void)
{
        uint32_t c = registers[get_regc()];
        uint32_t id = map_segment(c);
        registers[get_regb()] = id;
}


/*
 * function: inactivate
 * parameters: void,
 *             mem_info_p mem
 * returns: void
 * does: unmap segment--, the segment in register
 *       c is unmapped, future map segment ructions
 *       may reuse the identfier in register C
 */
static void inactivate(void)
{
        uint32_t c = registers[get_regc()];
        unmap_segment(c);
}


/*
 * function: output
 * parameters: void
 * returns: void
 * does: the value in register C is written to
 *       the I/O device immediately, only values
 *       0-255 are allowed
 */
static void output(void)
{
        uint32_t out = registers[get_regc()];
        if (out <= 255) {
                putchar(out);
        }
}


/*
 * function: input
 * parameters: void
 * returns: void
 * does: waits for input on the I/O device,
 *       when input arrives register C is loaded
 *       with the input, which must be a value from
 *       0-255, if EOF is signaled then register C is
 *       loaded with a full 32-bit word in which every
 *       bit is a 1 
 */
static void input(void)
{
        uint32_t in = getchar();
        registers[get_regc()] = in;
}


/*
 * function: loadp
 * parameters: void,
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
static void loadp(int *counter)
{
        uint32_t b = registers[get_regb()];
        uint32_t c = registers[get_regc()];

        if (b == 0) {
                *counter = c;
        } else {
                load_program_mem(b);
        }
}


/*
 * function: loadv
 * parameters: void
 * returns: void
 * does: sets the value in register A to the 
 *       25 bit unsigned binary value
 */
static void loadv(void)
{
        registers[get_rega()] = get_val();
}