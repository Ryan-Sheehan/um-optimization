/* 
* register.h
* Rachel Ginsberg and Hayden Wolff
* Comp40 HW6
* Interface for register module.
*/

#include <stdint.h>

#ifndef REG_H
#define REG_H
typedef struct reg_info *register_p; 


extern register_p init_arr();

extern void reg_put(register_p reg, uint32_t reg_id, uint32_t val);

extern uint32_t reg_get(register_p reg, uint32_t reg_id);

extern void free_arr(register_p *reg);

#endif