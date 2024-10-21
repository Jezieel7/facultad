package ar.edu.unlp.info.oo1.ejercicio11;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class StockTest {
	private Stock stock;
	private Stock stock2;
	
	@BeforeEach
	public void setup() {
		this.stock = new Stock("Real Madrid", 100, 100);
		this.stock2 = new Stock("Amazon", 200, 150);
	}

	@Test
	public void testCurrentValue() {		
		assertEquals(10000, this.stock.currentValue());
		assertEquals(30000, this.stock2.currentValue());
	}
}
