#include <stdio.h>
int main(){
	int arreglo[10] = {1, 3, 6, 4, 8, 10, 2, 5, 7, 9}; 
	int actual; int j;
	for(int i = 1; i < 10; i++){
		actual = arreglo[i];
		j = i - 1;            
		while((j > 0) && (arreglo[j] > actual)){ 
			arreglo[j+1] = arreglo[j]; 
			j = j - 1;                
		}
		arreglo[j+1] = actual;
	}
	
	for(int i = 0; i < 10; i ++)
		printf("%d\n", arreglo[i]);
		
	return 0;
}

