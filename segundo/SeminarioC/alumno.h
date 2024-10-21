typedef struct{
	int fecha_dia;
	int fecha_mes;
	int fecha_anio;
} t_fecha;

typedef struct {
	char alumno_nombre[50];
	char alumno_apellido[70];
	t_fecha alumno_fecha_nacimiento;
} T_alumno;

void alumno_crear(T_alumno * alumno, char *nombre, char *apellido, t_fecha fecha_nacimiento);

char * alumno_tostring(T_alumno alumno);

int alumno_comparar_nombre(T_alumno alumno, T_alumno otro_alumno);

int alumno_comparar_apellido(T_alumno alumno, T_alumno otro_alumno);

int alumno_comparar_fecha_nacimiento(T_alumno alumno, T_alumno otro_alumno);
