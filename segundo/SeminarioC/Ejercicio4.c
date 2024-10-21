#include <stdio.h>
int es_digito(char n){
	return (n >= '0' && n <= '9');
}

int main(){
	printf("Es digito? : %i\n", es_digito('7'));
	return 0;
}
