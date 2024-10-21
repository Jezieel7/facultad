package ar.edu.unlp.info.oo1.ejercicio14;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class BattleshipTest {
	private Battleship game;
	
	@BeforeEach
	public void setup() {
		this.game = new Battleship();		
	}

	@Test
	public void testSolution() {
		String[] B = new String[4];
		B[0] = ".##.#";
		B[1] = "#.#..";
		B[2] = "#...#";
		B[3] = "#.##.";
		assertEquals(2, game.solution(B)[0]);
		assertEquals(1, game.solution(B)[1]);
		assertEquals(2, game.solution(B)[2]);
	}
}
