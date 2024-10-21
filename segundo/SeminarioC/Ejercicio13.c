#include <stdio.h>
int main(){
	int c;
	while((c = getchar()) != EOF){
		if(c == '\\'){
			putchar('\\');
			putchar('\\');
		} else if (c == '\t'){
			putchar('\\');
			putchar('t');
		}else if (c == '\n'){
			putchar('\\');
			putchar('n');
			putchar('\n');
		}else{
			putchar(c);
		}
	}
	return 0;
}

