package ar.edu.unlp.info.oo1.ejercicio14;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class ResolverTest {
	private Resolver res;
	
	@BeforeEach
	public void setup() {
		this.res = new Resolver();		
	}

	@Test
	public void testSolution() {
		//assertEquals(3, res.solution(6, 20));
		assertEquals(0, res.solution(2, 29));
	}
	
}