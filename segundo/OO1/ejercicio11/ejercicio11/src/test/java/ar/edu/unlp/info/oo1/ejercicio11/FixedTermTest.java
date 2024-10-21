package ar.edu.unlp.info.oo1.ejercicio11;

import static org.junit.jupiter.api.Assertions.*;

import java.time.LocalDate;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class FixedTermTest {
	private FixedTerm fixedTerm;
	private FixedTerm fixedTerm2;
	
	@BeforeEach
	public void setup() {
		this.fixedTerm = new FixedTerm(LocalDate.of(2021, 10, 1), 100, 0.05);
		this.fixedTerm2 = new FixedTerm(LocalDate.of(2021, 10, 1), 50, 0.25);
	}

	@Test
	public void testCurrentValue() {
		double value = 100;
		for(int i = 0; i < 5; i++) {
			value = value + (value * 0.05);
		}
		
		double value2 = 50;
		for(int i = 0; i < 5; i++) {
			value2 = value2 + (value2 * 0.25);
		}
		
		assertEquals(value, this.fixedTerm.currentValue());
		assertEquals(value2, this.fixedTerm2.currentValue());
	}
}
