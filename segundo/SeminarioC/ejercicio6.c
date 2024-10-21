#include <stdio.h>
char a_mayuscula(char n){
	if(n >= 'a' && n <= 'z'){
		return (n-32);
	}else{
		return n;
	}
}

int main(){
	printf("%c\n", a_mayuscula('a'));
}
