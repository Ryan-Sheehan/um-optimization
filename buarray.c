/* Alex Pantuck and Ryan Sheehan
 * Comp40, Universal Machine pt 2
 * buarray.c
 * Implementation for a Boxed Unsigned Stack (BUS).
 * We found that removing polymorphism and avoiding
 * pointer chasing made our program run faster.
 */

#include "buarray.h"
#include <stdlib.h>
#include <assert.h>

#define T BUArray_T
struct T {
        uint32_t *array;
        uint32_t length;
};

/* Create a BUArray with 'length' elements */
BUArray_T BUArray_new(uint32_t length)
{
        BUArray_T arr = malloc(sizeof(*arr));
        assert(arr != NULL);
        arr->array = calloc(length, sizeof(*(arr->array)));
        assert(arr->array != NULL);
        arr->length = length;
        return arr;
}

/* Free array */
void BUArray_free(BUArray_T *arr)
{
        assert(*arr != NULL);
        free((*arr)->array);
        free(*arr);
        *arr = NULL;
}

/* Get element at index */
uint32_t BUArray_get(BUArray_T arr, uint32_t index)
{
        assert(arr != NULL);
        assert(index < arr->length);
        return arr->array[index];
}

/* Assign value to index. Returns the previous value */
uint32_t BUArray_put(BUArray_T arr, uint32_t index, uint32_t value)
{
        assert(arr != NULL);
        assert(index < arr->length);
        uint32_t old = arr->array[index];
        arr->array[index] = value;
        return old;
}

/* Returns the length of the array */
uint32_t BUArray_length(BUArray_T arr)
{
        assert(arr != NULL);
        return arr->length;
}

void BUArray_reloc(BUArray_T *arr, uint32_t new_length)
{
        (*arr)->array = 
                realloc((*arr)->array, new_length * sizeof(*((*arr)->array)));
        assert((*arr)->array != NULL);
        (*arr)->length = new_length;
}