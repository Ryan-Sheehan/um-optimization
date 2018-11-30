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

#define WORD_SIZE sizeof(uint32_t)

typedef enum Um_opcode {
        CMOV, SLOAD, SSTORE, ADD, MUL, DIV, NAND, 
        HALT, ACTIVATE, INACTIVATE, OUT, IN, LOADP, LV
} Um_opcode;

static void init_um(FILE *fp, char *filename);
static void run(void);
static void cmov(uint32_t, uint32_t, uint32_t);
static void sload(uint32_t, uint32_t, uint32_t);
static void sstore(uint32_t, uint32_t, uint32_t);
static void add(uint32_t, uint32_t, uint32_t);
static void mul(uint32_t, uint32_t, uint32_t);
static void divide(uint32_t, uint32_t, uint32_t);
static void nand(uint32_t, uint32_t, uint32_t);
static void halt(uint32_t, uint32_t, uint32_t);
static void activate(uint32_t, uint32_t, uint32_t);
static void inactivate(uint32_t, uint32_t, uint32_t);
static void output(uint32_t, uint32_t, uint32_t);
static void input(uint32_t, uint32_t, uint32_t);
static void loadp(uint32_t, uint32_t, uint32_t);
static void loadv(uint32_t, uint32_t, uint32_t);

/* Jump table */
typedef void (*op)(uint32_t, uint32_t, uint32_t);
static op operations[] = { cmov, sload, sstore, add, mul, divide, 
        nand, halt, activate, inactivate, output, input, loadp, loadv };

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
        if (words == NULL)
            exit(EXIT_FAILURE);
        matches = fread(words, WORD_SIZE, length, fp);        
        if (matches != length)
                exit(EXIT_FAILURE);

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
        int counter = 0, opcode = 0;

        while (opcode != HALT) {
                uint32_t word = mem_get(0, counter);
                unpack(word);
                opcode = get_opcode();
                uint32_t ra = get_rega(), rb = 0, rc = 0;
                
                if (opcode < 13) {
                    rb = get_regb();
                    rc = get_regc();
                } else
                    rb = get_val();

                operations[opcode](ra, rb, rc);
                if (opcode != LOADP)
                        counter++;
                else
                        counter = registers[rc];
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
static void cmov(uint32_t ra, uint32_t rb, uint32_t rc)
{
        if (registers[rc] != 0)
                registers[ra] = registers[rb];
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
static void sload(uint32_t ra, uint32_t rb, uint32_t rc)
{
        rb = registers[rb];
        rc = registers[rc];
        registers[ra] = mem_get(rb, rc);
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
static void sstore(uint32_t ra, uint32_t rb, uint32_t rc)
{
        ra = registers[ra];
        rb = registers[rb];
        rc = registers[rc];
        mem_put(ra, rb, rc);
}


/*
 * function: add
 * parameters: void,
 * returns: void
 * does: add-- adds values in registers B and C,
 *       puts result in register A    
 */
static void add(uint32_t ra, uint32_t rb, uint32_t rc)
{
        rb = registers[rb];
        rc = registers[rc];
        registers[ra] = (rb + rc);
}


/*
 * function: mul
 * parameters: void,
 * returns: void
 * does: multiply-- multiplies values in registers B and C,
 *       puts result in register A    
 */
static void mul(uint32_t ra, uint32_t rb, uint32_t rc)
{
        rb = registers[rb];
        rc = registers[rc];
        registers[ra] = (rb * rc);
}


/*
 * function: divide
 * parameters: void,
 * returns: void
 * does: divide-- divides values in registers B and C,
 *       puts result in register A    
 */
static void divide(uint32_t ra, uint32_t rb, uint32_t rc)
{
        rb = registers[rb];
        rc = registers[rc];
        registers[ra] = (rb / rc);
}


/*
 * function: nand
 * parameters: void,
 * returns: void
 * does: bitwise NAND-- NANDS the values in 
 *       registers B and C, puts result in 
 *       register A   
 */
static void nand(uint32_t ra, uint32_t rb, uint32_t rc)
{
        rb = registers[rb];
        rc = registers[rc];
        registers[ra] = ~(rb & rc);
}


/*
 * function: halt
 * parameters: none
 * returns: void
 * does: nothing 
 */
static void halt(uint32_t ra, uint32_t rb, uint32_t rc)
{
    (void)ra;
    (void)rb;
    (void)rc;
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
static void activate(uint32_t ra, uint32_t rb, uint32_t rc)
{
        rc = registers[rc];
        ra = map_segment(rc);
        registers[rb] = ra;
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
static void inactivate(uint32_t ra, uint32_t rb, uint32_t rc)
{
        (void)ra;
        (void)rb;
        rc = registers[rc];
        unmap_segment(rc);
}


/*
 * function: output
 * parameters: void
 * returns: void
 * does: the value in register C is written to
 *       the I/O device immediately, only values
 *       0-255 are allowed
 */
static void output(uint32_t ra, uint32_t rb, uint32_t rc)
{
        (void)ra;
        (void)rb;
        rc = registers[rc];
        if (rc <= 255)
                putchar(rc);
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
static void input(uint32_t ra, uint32_t rb, uint32_t rc)
{
        (void)rb;
        ra = getchar();
        registers[rc] = ra;
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
static void loadp(uint32_t ra, uint32_t rb, uint32_t rc)
{
        (void)ra;
        rb = registers[rb];
        rc = registers[rc];
        if (rb != 0)
                load_program_mem(rb);
}


/*
 * function: loadv
 * parameters: void
 * returns: void
 * does: sets the value in register A to the 
 *       25 bit unsigned binary value
 */
static void loadv(uint32_t ra, uint32_t rb, uint32_t rc)
{
        (void)rc;
        registers[ra] = rb;
}