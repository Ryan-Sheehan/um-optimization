/* Alex Pantuck and Ryan Sheehan
 * Comp40, Universal Machine pt 2
 * buseq.c
 * Implementation for a boxed non-polymorphic sequence.
 * When resizing is done, the size of the sequence doubles.
 * We did it this way to avoid extraneous pointer chasing,
 * and thought our resize method might be more efficient
 * (though we don't know how Hanson may have done it).
 * Basically, it's a resizing 2D array whose columns may
 * be of unequal length.
 */

#include "buseq.h"
#include <stdlib.h>

#define ARR_SIZE sizeof(BUArray_T)
#define SEQ_SIZE sizeof(BUSeq_T)

#define T BUSeq_T
struct T {
        BUArray_T *array;
        uint32_t length;
        uint32_t capacity;
};

static void resize(BUSeq_T seq);

/* Create a BUSeq with initial capacity */
BUSeq_T BUSeq_new(const uint32_t capacity)
{
        BUSeq_T seq = malloc(SEQ_SIZE);
        seq->array = calloc(capacity, ARR_SIZE);
        if (seq == NULL || seq->array == NULL)
                exit(EXIT_FAILURE);
        seq->capacity = capacity;
        return seq;
}

/* Free sequence */
void BUSeq_free(BUSeq_T *seq)
{
        if (*seq == NULL)
                exit(EXIT_FAILURE);
        free((*seq)->array);
        free(*seq);
        *seq = NULL;
}

/* Get element at index */
BUArray_T BUSeq_get(const BUSeq_T seq, const uint32_t index)
{
        if (seq == NULL || index >= seq->length)
                exit(EXIT_FAILURE);
        return seq->array[index];
}

uint32_t BUSeq_length(const BUSeq_T seq)
{
        if (seq == NULL)
                exit(EXIT_FAILURE);
        return seq->length;
} 

/* Set element at index to value. Returns the previous value */
BUArray_T BUSeq_put(BUSeq_T seq, const uint32_t index, const BUArray_T value)
{
        if (seq == NULL || index >= seq->capacity)
                exit(EXIT_FAILURE);
        BUArray_T old = seq->array[index];
        seq->array[index] = value;
        return old;
}

/* Add an element to the end of the sequence. Automatically resizes. */
void BUSeq_addhi(BUSeq_T seq, const BUArray_T value)
{
        if (seq == NULL)
                exit(EXIT_FAILURE);
        else if (seq->length == seq->capacity)
                resize(seq);
        seq->array[seq->length++] = value;
}

static void resize(BUSeq_T seq)
{
        uint32_t new_cap = seq->capacity * 2;
        seq->array = realloc(seq->array, sizeof(*(seq->array)) * new_cap);
        if (seq->array == NULL)
                exit(EXIT_FAILURE);
        seq->capacity = new_cap;
}