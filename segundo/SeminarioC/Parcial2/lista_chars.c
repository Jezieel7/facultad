#include "lista_chars.h"

lista_t ls_crear(){
  return (lista_t) NULL;
}

int ls_tamanio(const lista_t lista){
  if (lista == (lista_t) NULL) {
      return 0;
    } else {
    return 1 + ls_tamanio(lista->siguiente);
  }
} 

void ls_agregar(lista_t *lista, const DATATYPE elem){
  nodo_lista_t *nodo;
  nodo = malloc(sizeof(nodo_lista_t));
  nodo->elem = elem;
  nodo->siguiente = (nodo_lista_t*) (*lista);
  (*lista) = (lista_t) nodo;
}

/* La lista no debe estar vacia */
DATATYPE ls_eliminar_elemento(lista_t *lista){
  lista_t aux;
  DATATYPE elem;
  elem = (*lista)->elem;
  aux = (*lista);
  (*lista) = (lista_t) (*lista)->siguiente;
  free(aux);
  return elem;
}

int ls_incluye(lista_t lista, const DATATYPE elem){
 if (lista == (lista_t) NULL) {
      return 0;
    } else {
   return (lista->elem == elem) || ls_incluye(lista->siguiente, elem);
 }
}
