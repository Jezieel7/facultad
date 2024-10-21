#include <stdio.h>
float sin_signo(unsigned int num1, unsigned int num2){
	return ((num1 > num2) ? (float) num2/num1 : (float) num1/num2);
}

int main(){
	unsigned int num1 = 3;
	unsigned int num2 = 5; 
	printf("La division es: %f\n", sin_signo(num1, num2));
	return 0;
}
