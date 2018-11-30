/* Alex Pantuck and Ryan Sheehan
 * Comp40, Universal Machine pt 2
 * buarray.c
 * Implementation for a Boxed Unsigned Stack (BUS).
 * We found that removing polymorphism and avoiding
 * pointer chasing made our program run faster.
 */

#include "buarray.h"
#include <stdlib.h>

#define T BUArray_T
struct T {
        uint32_t *array;
        uint32_t length;
};

/* Create a BUArray with 'length' elements */
BUArray_T BUArray_new(const uint32_t length)
{
        BUArray_T arr = malloc(sizeof(*arr));
        arr->array = calloc(length, sizeof(*(arr->array)));
        if (arr == NULL || arr->array == NULL)
                exit(EXIT_FAILURE);
        arr->length = length;
        return arr;
}

/* Free array */
void BUArray_free(BUArray_T *arr)
{
        if(*arr == NULL)
                exit(EXIT_FAILURE);
        free((*arr)->array);
        free(*arr);
        *arr = NULL;
}

/* Get element at index */
uint32_t BUArray_get(BUArray_T arr, const uint32_t index)
{
        if (arr == NULL || index >= arr->length)
                exit(EXIT_FAILURE);
        return arr->array[index];
}

/* Assign value to index. Returns the previous value */
uint32_t BUArray_put(BUArray_T arr, const uint32_t index, const uint32_t value)
{
        if (arr == NULL || index >= arr->length)
                exit(EXIT_FAILURE);
        uint32_t old = arr->array[index];
        arr->array[index] = value;
        return old;
}

/* Returns the length of the array */
uint32_t BUArray_length(const BUArray_T arr)
{
        if (arr == NULL)
                exit(EXIT_FAILURE);
        return arr->length;
}

void BUArray_reloc(BUArray_T *arr, const uint32_t new_length)
{
        (*arr)->array = 
                realloc((*arr)->array, new_length * sizeof(*((*arr)->array)));
        if((*arr)->array == NULL)
                exit(EXIT_FAILURE);
        (*arr)->length = new_length;
}