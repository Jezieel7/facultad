package ar.edu.unlp.info.oo1.ejercicio11;

import static org.junit.jupiter.api.Assertions.*;

import java.time.LocalDate;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class InversorTest {
	private Inversor inversor;
	
	@BeforeEach
	public void setup() {
		this.inversor = new Inversor("Jose", new FixedTerm(LocalDate.of(2021, 10, 1), 100, 0.05));
	}

	@Test
	public void testCurrentValue() {		
		this.inversor.addInvestment(new Stock("Real Madrid", 100, 100));
		this.inversor.addInvestment(new FixedTerm(LocalDate.of(2021, 10, 1), 50, 0.25));
		this.inversor.addInvestment(new Stock("Amazon", 200, 150));
		
		double value = 100;
		for(int i = 0; i < 5; i++) {
			value = value + (value * 0.05);
		}
		
		double value2 = 50;
		for(int i = 0; i < 5; i++) {
			value2 = value2 + (value2 * 0.25);
		}
		double total = value + value2 + 10000 + 30000;
		
		assertEquals(total, this.inversor.currentValue());
		this.inversor.getInvestments().get(0);
	}
}
