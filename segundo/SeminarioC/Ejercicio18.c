#include <stdio.h>
void sumadorVectores(int arreglo1[], int arreglo2[], int arreglo3[]){
	for(int i=0; i < 10; i++){
		arreglo3[i] = arreglo1[i] + arreglo2[i];
	}
}
int main(){
	int arreglo1[10] = {1, 3, 6, 4, 8, 10, 2, 5, 7, 9};
	int arreglo2[10] = {1, 3, 6, 4, 8, 10, 2, 5, 7, 9};
	int arreglo3[10]; 
	
	sumadorVectores(arreglo1, arreglo2, arreglo3);
	
	for(int i = 0; i < 10; i ++)
		printf("%d\n", arreglo3[i]);
		
	return 0;
}
