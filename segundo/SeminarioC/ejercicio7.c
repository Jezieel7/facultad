#include <stdio.h>
float prom(unsigned int num1, unsigned int num2){
	return (float) (num1+num2)/2;
}

int main(){
	unsigned int num1 = 68;
	unsigned int num2 = 5;
	printf("%f\n", prom(num1, num2));
}

