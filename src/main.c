/*
Main function for dictionary program.

*/

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>

#define MAX_LINE 50

/* Read file and count instances of words for each size
 * Returns: counter array
 */
uint32_t *count_lines(char *filename, uint32_t max_line) {

    FILE *fp = fopen(filename, "r");
    /* Check for valid inputs */
    if (fp == NULL || max_line <= 0) {
        fprintf(stderr, "Invalid count_line inputs: fp=%p\tMaxLine=%d\n", (void *)fp, max_line);
        return NULL;
    }
    /* Allocate counter array */
    uint32_t *word_counter = (uint32_t *)calloc(max_line, sizeof(uint32_t));
    if (word_counter == NULL) {
        fprintf(stderr, "Failed to allocate counter array\n");
        return word_counter;
    }
    char line[MAX_LINE] = {0};
    uint32_t nchars = 0;
    /* Read file to count words */
    while (fgets(line, MAX_LINE, fp) != NULL) {
        nchars = strlen(line) - 1;
        word_counter[nchars - 1]++;
    }
    /* close file */
    fclose(fp);

    return word_counter;
}

/* Print dictionary status */
void print_dict_status(uint32_t *word_counter, uint32_t max_len) {
    if (word_counter == NULL || max_len <= 0) {
        fprintf(stderr, "Invalid counter pointer or length\n");
        return;
    }
    uint32_t i = 0, total_words = 0;
    printf("Dictionary Status:\n");
    for (i = 0; i < MAX_LINE; i++) {
        if (word_counter[i]) {
            printf("%d word(s) of size %d\n", word_counter[i], i + 1);
            total_words += word_counter[i];
        }
    }
    printf("Total of %d word(s)\n", total_words);
    return;
}

int main(int argc, char **argv) {

    printf("Word Dictionary Program\n");

    /* Parse arguments*/
    if (argc < 2) {
        printf("Too few arguments.\n\nUsage: %s <dictionary_data.txt>\n", argv[0]);
    }

    /* Read file to get word count of each size */
    uint32_t *word_counter = count_lines(argv[1], MAX_LINE);
    if (word_counter == NULL) {
        fprintf(stderr, "Invalid word_counter... exiting\n");
        return -1;
    }

    print_dict_status(word_counter, MAX_LINE);

    /* Free memory */
    free(word_counter);

    return EXIT_SUCCESS;
}
