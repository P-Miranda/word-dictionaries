/*
Main function for dictionary program.

*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_LINE 50

int main(int argc, char** argv){

	printf("Word Dictionary Program\n");

    /* Parse arguments*/
	if(argc < 2){
		printf("Too few arguments.\n\nUsage: %s <dictionary_data.txt>\n", argv[0]);
	}

	FILE* fp_dict = NULL;

	/*Open dict file*/
	fp_dict = fopen(argv[1], "r");
	if(fp_dict == NULL){
		printf("Failed to load dictionary file %s\n", argv[1]);
		return -1;
	}

	/* Read lines */
	char line[MAX_LINE] = {0}; 
	int lnum=0, nchars = 0;
	int len_counter[MAX_LINE] = {0}; /* count #Words for each length */

	while(fgets(line, MAX_LINE, fp_dict) != NULL){
		nchars = strlen(line)-1;
		line[nchars] = 0;
		printf("Line %d: %s\t%d chars\n", lnum, line, nchars);
		lnum++;
		len_counter[nchars-1]++;
	}

	int i=0;
	printf("Dict Stats:\n");
	for(i=0; i<MAX_LINE;i++){
		if(len_counter[i]){
			printf("%d words of size %d\n", len_counter[i], i+1);
		}
	}



	/* close file */
	fclose(fp_dict);
	return EXIT_SUCCESS;
}
