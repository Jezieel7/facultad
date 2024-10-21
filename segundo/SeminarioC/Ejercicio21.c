#include <stdio.h>
#include <string.h>

int es_palindromo(const char *word){
	int tamanio = strlen(word);
	if(tamanio <= 1) return 1;
	int inicio = 0;
	int fin = tamanio - 1;
	while(word[inicio] == word[fin]){
		if(inicio >= fin) return 1;
		inicio++;
		fin--;
	}
	return 0;
}

int main(){
	char word[] = "mundo";
	printf("Es palindromo? %d\n", es_palindromo(word));
	return 0;
}
