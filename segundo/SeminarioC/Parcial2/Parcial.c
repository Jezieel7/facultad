#include "lista_chars.h"
#include <stdio.h> 
#include <string.h> 
int main(){
  lista_t  l = ls_crear();
  lista_t  l2 = ls_crear();
  char palabra[] = "Holaaaa";
  char palabra2[] = "Mundo";
  
  for (int i = 0; i < strlen(palabra); i++) {
    ls_agregar(&l, palabra[i]);
  }
  
    for (int i = 0; i < strlen(palabra2); i++) {
    ls_agregar(&l2, palabra[i]);
  }
  
  if(ls_tamanio(l) > ls_tamanio(l2)){
    printf("La lista mas larga es la lista 1\n");  
  }else{
	printf("La lista mas larga es la lista 2\n");  
  }
  
  for (int i = 0; i < strlen(palabra); i++) {
    ls_eliminar_elemento(&l);
  }
  
  for (int i = 0; i < strlen(palabra2); i++) {
    ls_eliminar_elemento(&l2);
  }
  
  return 0;
}
