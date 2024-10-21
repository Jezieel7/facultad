#include <stdio.h>
int sumar_n(int n){
	int suma = 0;
	for(int i=0; i<=n; i+= 2){
		suma += i;
	}
	return suma;
}

int main(){
	printf("La suma es: %i\n", sumar_n(500));
	return 0;
}

