#include <stdio.h>
char ascii(int num){
	return (num>=0 && num<=255) ? (char) num : '0';
}

int main(){
	int num = 67;
	printf("The ascii is: %c\n", ascii(num));
	return 0;
}
