#include <stdio.h>
int condicion(){
	int c;
	return (((c = getchar()) != EOF) ? 0 : 1);
}

int main(){
	printf("%i\n", condicion());
	return 0;
}
