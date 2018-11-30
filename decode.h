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

extern void unpack(uint32_t word);

extern int get_opcode(void);

extern uint32_t get_rega(void);

extern uint32_t get_regb(void);

extern uint32_t get_regc(void);

extern uint32_t get_val(void);

#endif