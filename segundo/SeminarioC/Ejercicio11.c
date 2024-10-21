#include <stdio.h>
int main(){
	int c; int car = 0; int i = 0;
	while((c = getchar()) != EOF){
		if(c == '\n'){
			i++;
		}else{
			car++;	
		}
	}
	printf("La cantidad de caracteres %d y la cantidad de lineas %d\n", car, i);
	return 0;
}
