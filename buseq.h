/* Alex Pantuck and Ryan Sheehan
 * Comp40, Universal Machine pt 2
 * buseq.h
 * Interface for a boxed non-polymorphic sequence.
 * Array elements are of type BUArray_T.
 * When adding elements, the sequence automatically
 * Resizes as neccessary.
 */

#include <stdint.h>
#include "buarray.h"

#ifndef BU_SEQ_H_
#define BU_SEQ_H_

#define T BUSeq_T
typedef struct T *T;

/* Create a BUSeq with initial capacity */
BUSeq_T BUSeq_new(uint32_t capacity);
/* Free sequence */
void BUSeq_free(BUSeq_T *seq);
/* Get element at index */
BUArray_T BUSeq_get(BUSeq_T seq, uint32_t index);
/* Get the length of the sequence */
uint32_t BUSeq_length(BUSeq_T seq);
/* Set element at index to value. Returns the previous value */
BUArray_T BUSeq_put(BUSeq_T seq, uint32_t index, BUArray_T value);
/* Add an element to the end of the sequence. Automatically resizes. */
void BUSeq_addhi(BUSeq_T seq, BUArray_T value);

#undef T
#endif