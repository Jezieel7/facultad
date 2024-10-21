#include <stdio.h>
int elMenor(int num1, int num2){
	return ((num1 > num2) ? num2 : num1);
}

int main(){
	printf("%i\n", elMenor(10, 5));
}
