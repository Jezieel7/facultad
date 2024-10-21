#include <stdio.h>
#include <stdlib.h>
int * crear_vector_int(int n){
	int *vector;
	vector = malloc(sizeof(int) * n);
	vector[0] = 1;
	vector[1] = 1;
	vector[2] = 1;
	vector[3] = 1;
	return vector;
}

void liberar_vector(void * vector){
	free(vector);
}

int main(){
	int * vector = crear_vector_int(5);
	printf("%d\n", vector[0]);
	printf("%d\n", vector[1]);
	printf("%d\n", vector[2]);
	printf("%d\n", vector[3]);
	liberar_vector(vector);
	printf("%d\n", vector[0]);
	printf("%d\n", vector[1]);
	printf("%d\n", vector[2]);
	printf("%d\n", vector[3]);
	return 0;
}
