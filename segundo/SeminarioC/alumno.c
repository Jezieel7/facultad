#include <string.h>
#include "alumno.h"
#include <stdio.h>
#include <stdlib.h>

void alumno_crear(T_alumno * alumno, char *nombre, char *apellido, t_fecha fecha_nacimiento){
	strcpy(alumno->alumno_nombre, nombre);
	strcpy(alumno->alumno_apellido, apellido);
	alumno->alumno_fecha_nacimiento = fecha_nacimiento;
};

char * alumno_tostring(T_alumno alumno){
	char * string = (char *) malloc(sizeof(char)*165);
	char fecha[11];
	sprintf(fecha, "%d/%d/%d", alumno.alumno_fecha_nacimiento.fecha_dia, alumno.alumno_fecha_nacimiento.fecha_mes, alumno.alumno_fecha_nacimiento.fecha_anio);
	strcat(string, "Nombre: ");
	strcat(string, alumno.alumno_nombre);
	strcat(string, " Apellido: ");
	strcat(string, alumno.alumno_apellido);
	strcat(string, " Fecha de nacimiento: ");
	strcat(string, fecha);
	return string;
};

int alumno_comparar_nombre(T_alumno alumno, T_alumno otro_alumno) {
	return strcmp(alumno.alumno_nombre, otro_alumno.alumno_nombre) ? 1 : 0;
};

int alumno_comparar_apellido(T_alumno alumno, T_alumno otro_alumno){
	return strcmp(alumno.alumno_apellido, otro_alumno.alumno_apellido);
};

int alumno_comparar_fecha_nacimiento(T_alumno alumno, T_alumno otro_alumno){
	if(alumno.alumno_fecha_nacimiento.fecha_dia == otro_alumno.alumno_fecha_nacimiento.fecha_dia){
		if(alumno.alumno_fecha_nacimiento.fecha_mes == otro_alumno.alumno_fecha_nacimiento.fecha_mes){
			if(alumno.alumno_fecha_nacimiento.fecha_anio == otro_alumno.alumno_fecha_nacimiento.fecha_anio){
				return 0;
			}
		}
	}
	return 1;
};

void alumno_destruir(T_alumno * alumno){
	strcpy(alumno->alumno_nombre, "0");
	strcpy(alumno->alumno_apellido, "0");
	alumno->alumno_fecha_nacimiento.fecha_dia = 0;
	alumno->alumno_fecha_nacimiento.fecha_mes = 0;
	alumno->alumno_fecha_nacimiento.fecha_anio = 0;
}
