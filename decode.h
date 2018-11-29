/* 
* decode.h
* Rachel Ginsberg and Hayden Wolff
* Comp40 HW6
* Interface for decode module
*/

#include <stdint.h>
#include <stdbool.h>

#ifndef DECODE_H
#define DECODE_H
typedef struct inst *inst_p; 

extern inst_p unpack(uint32_t word);

extern int get_opcode(inst_p inst_info);

extern uint32_t get_rega(inst_p inst_info);

extern uint32_t get_regb(inst_p inst_info);

extern uint32_t get_regc(inst_p inst_info);

extern uint32_t get_val(inst_p inst_info);

extern uint64_t Bitpack_getu(uint64_t word, unsigned width, unsigned lsb);

extern uint64_t Bitpack_newu(uint64_t word, unsigned width, unsigned lsb,
                            uint64_t value);

bool Bitpack_fitsu(uint64_t n, unsigned width);

#endif