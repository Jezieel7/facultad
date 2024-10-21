#ifndef LISTA_CHARS_H_
#define LISTA_CHARS_H_ 1
#include <stdlib.h>        /** malloc / free **/

#ifndef DATATYPE
#define DATATYPE char
#endif

typedef struct nodo_lista {
         DATATYPE           elem;
         struct nodo_lista   *siguiente;
} nodo_lista_t;

typedef nodo_lista_t *lista_t;

lista_t ls_crear();

int ls_tamanio(const lista_t lista);

void ls_agregar(lista_t *lista, const DATATYPE elem);

/* La lista no debe estar vacia */
DATATYPE ls_eliminar_elemento(lista_t *lista);

int ls_incluye(lista_t lista, const DATATYPE elem);

#endif
