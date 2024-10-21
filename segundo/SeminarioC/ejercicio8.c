#include <stdio.h>
int factorial(int n){
	for(int i = (n-1); i >= 1; i--){
		n *= i;
	}
	return n;
}

int main(){
	printf("%i\n", factorial(5));
}
