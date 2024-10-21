#include <stdio.h>

struct t_date{
	int date_day;
	char * date_month;
	int date_year;
};

typedef struct t_date t_date;

void date_init(t_date * date){
	date->date_day = 1;
	date->date_month = "enero";
	date->date_year = 1970;
}

int main(){
	t_date date;
	date_init(&date);
	printf("%d de %s del %d\n", date.date_day, date.date_month, date.date_year);
	return 0;
}
