#include <stdio.h>
void recibir(int * numero){
	(*numero) = 0;
}

int main(){
	int y = 3;
	recibir(&y);
	printf("%d\n", y);
}

