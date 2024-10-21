#include <stdio.h>
#define min(a, b) (a < b) ? a : b
#define max(a, b) (a > b) ? a : b

int main(){
	int i = 5;
	int j = 7;
	printf("%d\n", min(i++, j++));
	printf("%d\n", max(i++, j++));
	return 0;
}
