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
#include <assert.h>

#define T BUSeq_T
struct T {
        BUArray_T *array;
        uint32_t length;
        uint32_t capacity;
};

static void resize(BUSeq_T seq);

/* Create a BUSeq with initial capacity */
BUSeq_T BUSeq_new(uint32_t capacity)
{
        BUSeq_T seq = malloc(sizeof(*seq));
        assert(seq != NULL);
        seq->array = calloc(capacity, sizeof(*(seq->array)));
        assert(seq->array != NULL);
        seq->length = 0;
        seq->capacity = capacity;
        return seq;
}

/* Free sequence */
void BUSeq_free(BUSeq_T *seq)
{
        assert(*seq != NULL);
        free((*seq)->array);
        free(*seq);
        *seq = NULL;
}

/* Get element at index */
BUArray_T BUSeq_get(BUSeq_T seq, uint32_t index)
{
        assert(seq != NULL);
        assert(index < seq->length);
        return seq->array[index];
}

uint32_t BUSeq_length(BUSeq_T seq)
{
        assert(seq != NULL);
        return seq->length;
} 

/* Set element at index to value. Returns the previous value */
BUArray_T BUSeq_put(BUSeq_T seq, uint32_t index, BUArray_T value)
{
        assert(seq != NULL);
        assert(index < seq->capacity);
        BUArray_T old = seq->array[index];
        seq->array[index] = value;
        return old;
}

/* Add an element to the end of the sequence. Automatically resizes. */
void BUSeq_addhi(BUSeq_T seq, BUArray_T value)
{
        assert(seq != NULL);
        if (seq->length == seq->capacity)
                resize(seq);
        seq->array[seq->length++] = value;
}

static void resize(BUSeq_T seq)
{
        uint32_t new_cap = seq->capacity * 2;
        seq->array = realloc(seq->array, sizeof(*(seq->array)) * new_cap);
        assert(seq->array != NULL);
        seq->capacity = new_cap;
}