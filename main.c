/*
Main function for dictionary program.

*/

#include <stdio.h>
#include <stdlib.h>


int main(int argc, char** argv){

	printf("Word Dictionary Program\n");


	if(argc < 2){
		printf("Too few arguments.\n\nUsage: %s <dictionary_data.txt>\n", argv[0]);
	}
	return EXIT_SUCCESS;
}
