#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int main(int argc, char *argv[]){
	if(argv[2] != NULL && argv[2] != NULL){
		if(argv[1] != NULL){
			int num1 = atoi(argv[2]);
			int num2 = atoi(argv[3]);
			char str[3];
			strcpy(str, argv[1]);
			if(strcmp(str, "-s") == 0){
				printf("El resultado de la suma es %d\n", (num1+num2));
			}else if(strcmp(str, "-r") == 0){
				printf("El resultado de la resta es %d\n", (num1+num2));
			}else if(strcmp(str, "-d") == 0){
				printf("El resultado de la division es %.2d\n", (num1/num2));
			}else if(strcmp(str, "-m") == 0){
				printf("El resultado de la multiplicacion es %d\n", (num1*num2));
			}else if(strcmp(str, "-i") == 0){
				printf("El primer parametro: %d, el segundo parametro: %d\n", num1, num2);
			}else{
				printf("El programa imprime el resultado de enviar una operacion y sus correspondientes parametros. EL resultado sera impreso en pantalla.\n");
				printf("\n");
				printf("Argumentos:\n");
				printf("\t\t\t\t\t\t\t -s: suma los siguentes dos parametros\n");
				printf("\t\t\t\t\t\t\t -blabla: blabla\n");
			}
		}else{
			printf("El programa imprime el resultado de enviar una operacion y sus correspondientes parametros. EL resultado sera impreso en pantalla.\n");
			printf("\n");
			printf("Argumentos:\n");
			printf("\t\t\t\t\t\t\t -s: suma los siguentes dos parametros\n");
			printf("\t\t\t\t\t\t\t -blabla: blabla\n");
		}
	}else{
			printf("El programa imprime el resultado de enviar una operacion y sus correspondientes parametros. EL resultado sera impreso en pantalla.\n");
			printf("\n");
			printf("Argumentos:\n");
			printf("\t\t\t\t\t\t\t -s: suma los siguentes dos parametros\n");
			printf("\t\t\t\t\t\t\t -blabla: blabla\n");
		}
	return 0;
}
