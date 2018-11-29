/* 
* instruction_driver.h
* Rachel Ginsberg and Hayden Wolff
* Comp40 HW6
* Instruction driver module interface
*/

#include "memory.h"
#include "register.h"
#include "decode.h"
#include <stdio.h>

extern void driver(FILE *fp, char *filename);

void init_um(FILE *fp, char *filename, register_p *reg, mem_info_p *mem);

void run(register_p reg, mem_info_p mem);

void cmov(inst_p inst, register_p reg);

void sload(inst_p inst, register_p reg, mem_info_p mem);

void sstore(inst_p inst, register_p reg, mem_info_p mem);

void add(inst_p inst, register_p reg);

void mul(inst_p inst, register_p reg);

void divide(inst_p inst, register_p reg);

void nand(inst_p inst, register_p reg);

void halt();

void activate(inst_p inst, register_p reg, mem_info_p mem);

void inactivate(inst_p inst, register_p reg, mem_info_p mem);

void output(inst_p inst, register_p reg);

void input(inst_p inst, register_p reg);

void loadp(inst_p inst, register_p reg, mem_info_p mem, int *counter);

void loadv(inst_p inst, register_p reg);