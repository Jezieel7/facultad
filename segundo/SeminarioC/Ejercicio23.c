#include <stdio.h>
#include <string.h>
int main(int argc, char *argv[]){
	char clave[] = "abracadabra";
	if(strcmp(argv[1], clave) == 0){
		printf("C is quirky, flawed, and an enormous success. - Dennis Ritchie\n");
	}else{
		printf("%d argumento/s\n", argc - 1);
	}
	return 0;
}
