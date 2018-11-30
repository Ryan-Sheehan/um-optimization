/* Alex Pantuck and Ryan Sheehan
 * Comp40, Universal Machine pt 2
 * buarray.h
 * Interface for a Boxed Non-polymorphic Array.
 */

#include <stdint.h>

#ifndef BU_ARRAY_H_
#define BU_ARRAY_H_

#define T BUArray_T
typedef struct T *T;

/* Create a BUArray with 'length' elements */
BUArray_T BUArray_new(const uint32_t length);
/* Free array */
void BUArray_free(BUArray_T *arr);
/* Get element at index */
uint32_t BUArray_get(BUArray_T arr, const uint32_t index);
/* Assign value to index. Returns the previous value */
uint32_t BUArray_put(BUArray_T arr, const uint32_t index, const uint32_t value);
/* Returns the length of the array */
uint32_t BUArray_length(const BUArray_T arr);
/* Array is reallocated to be of 'new-length' size */
void BUArray_reloc(BUArray_T *arr, const uint32_t new_length);

#undef T
#endif