#include <stdio.h>
#include <string.h>
typedef struct{
	int date_day;
	int date_month;
	int date_year;
} t_date;

typedef struct {
	char student_name[256];
	char student_last_name[256];
	t_date student_date_birth;
	int legajo;
	char student_type_id[20];
	int student_number_id;
} t_student;

int main(){
	t_date date;
	date.date_day = 1;
	date.date_month = 2;
	date.date_year = 1560;
	t_student student_1;
	strcpy(student_1.student_name,"Jose");
	strcpy(student_1.student_last_name, "Perez");
	//student_1.student_date_birth->date_day = date.date_day;
	//student_1.student_date_birth->date_month = date.date_month;
	//student_1.student_date_birth->date_year = date.date_year;
	student_1.student_date_birth = date;
	student_1.legajo = 123;
	strcpy(student_1.student_type_id, "dni");
	student_1.student_number_id = 456;
	
	t_student student_2 = student_1;
	
	printf("%s\n", student_1.student_name);
	printf("%s\n", student_1.student_last_name);
	printf("%d\n", student_1.student_date_birth.date_day);
	printf("%d\n", student_1.student_date_birth.date_month);
	printf("%d\n", student_1.student_date_birth.date_year);
	printf("%d\n", student_1.legajo);
	printf("%s\n", student_1.student_type_id);
	printf("%d\n", student_1.student_number_id);
	printf("Fin del alumno 1\n");
	
	printf("%s\n", student_2.student_name);
	printf("%s\n", student_2.student_last_name);
	printf("%d\n", student_2.student_date_birth.date_day);
	printf("%d\n", student_2.student_date_birth.date_month);
	printf("%d\n", student_2.student_date_birth.date_year);
	printf("%d\n", student_2.legajo);
	printf("%s\n", student_2.student_type_id);
	printf("%d\n", student_2.student_number_id);
	printf("Fin del alumno 2\n");
	
	strcpy(student_1.student_name, "Pepe");
	
	printf("%s\n", student_1.student_name);
	printf("%s\n", student_1.student_last_name);
	printf("%d\n", student_1.student_date_birth.date_day);
	printf("%d\n", student_1.student_date_birth.date_month);
	printf("%d\n", student_1.student_date_birth.date_year);
	printf("%d\n", student_1.legajo);
	printf("%s\n", student_1.student_type_id);
	printf("%d\n", student_1.student_number_id);
	printf("Fin del alumno 1\n");
	
	printf("%s\n", student_2.student_name);
	printf("%s\n", student_2.student_last_name);
	printf("%d\n", student_2.student_date_birth.date_day);
	printf("%d\n", student_2.student_date_birth.date_month);
	printf("%d\n", student_2.student_date_birth.date_year);
	printf("%d\n", student_2.legajo);
	printf("%s\n", student_2.student_type_id);
	printf("%d\n", student_2.student_number_id);
	printf("Fin del alumno 2\n");
	return 0;
}
