package ar.edu.unlp.info.oo1.ejercicio15y16;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import static java.time.temporal.ChronoUnit.DAYS;

public class DateLapse {
	LocalDate from;
	LocalDate to;
	
	public DateLapse(LocalDate from, LocalDate to) {
		this.from = from;
		this.to = to;
	}
	
	public int sizeInDays() {
		return (int) this.from.until(this.to, ChronoUnit.DAYS); 
	}
	
	public boolean includesDate(LocalDate other) {
		return other.isEqual(this.from) || other.isEqual(this.to) || (other.isAfter(this.from) && other.isBefore(this.to));
	}
	
    public boolean overlaps(DateLapse periodo){
        return (periodo.includesDate(to))||periodo.includesDate(from);
    }
	
    public int diasAInicio(LocalDate fecha){
    	return (int) DAYS.between(fecha,from);
    }

}
