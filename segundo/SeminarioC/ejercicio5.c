#include <stdio.h>
int es_min_may(char n){
	if(n >= 'a' && n <= 'z'){
		printf("Es minuscula\n");
	}else if(n >= 'A' && n <= 'Z'){
		printf("Es mayuscula\n");
	}else{
		printf("No era una letra\n");
	}
	return 0;
}

int main(){
	es_min_may('7');
	return 0;
}
