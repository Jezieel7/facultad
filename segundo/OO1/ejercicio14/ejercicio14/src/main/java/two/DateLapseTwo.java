package two;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

public class DateLapseTwo {
	LocalDate from;
	int sizeInDays;
	
	private void fromSizeInDays(LocalDate from, LocalDate to) {
		this.from = from;
		this.sizeInDays = (int) this.from.until(to, ChronoUnit.DAYS);
	}
	
	public int sizeInDays() {
		return this.sizeInDays; 
	}
	
	public boolean includesDate(LocalDate other) {
		return other.isEqual(this.from) || other.isEqual(this.getTo()) || (other.isAfter(this.from) && other.isBefore(this.getTo()));
	}
	
	public LocalDate getFrom() {
		return from;
	}

	public LocalDate getTo() {
		return this.from.plusDays(this.sizeInDays);
	}
}
