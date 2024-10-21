package ar.edu.unlp.info.oo1.ejercicio14;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

public class DateLapse {
	LocalDate from;
	LocalDate to;
	
	private void fromTo(LocalDate from, LocalDate to) {
		this.from = from;
		this.to = to;
	}
	
	public int sizeInDays() {
		return (int) this.from.until(this.to, ChronoUnit.DAYS); 
	}
	
	public boolean includesDate(LocalDate other) {
		return other.isEqual(this.from) || other.isEqual(this.to) || (other.isAfter(this.from) && other.isBefore(this.to));
	}
	
	public LocalDate getFrom() {
		return from;
	}

	public LocalDate getTo() {
		return to;
	}
	
}
