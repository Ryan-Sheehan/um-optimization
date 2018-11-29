/* um.c
* Rachel Ginsberg and Hayden Wolff
* HW6
*/

#include "instruction_driver.h"
#include <stdio.h>
#include <assert.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
        if (argc != 2) {
            fprintf(stderr, "usage: ./um [program.um]\n");
            return EXIT_FAILURE;
        }

        FILE *fp = fopen(argv[1], "r");
        assert(fp != NULL);
        driver(fp, argv[1]);
        fclose(fp);
        return EXIT_SUCCESS;
}