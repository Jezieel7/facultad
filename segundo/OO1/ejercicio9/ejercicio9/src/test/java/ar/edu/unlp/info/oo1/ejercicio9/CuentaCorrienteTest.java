package ar.edu.unlp.info.oo1.ejercicio9;

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class CuentaCorrienteTest {
	
	private CuentaCorriente cuentaCorriente;
	private CuentaCorriente cuentaCorriente2;
	private CajaDeAhorro cajaDeAhorro;
	private CajaDeAhorro cajaDeAhorro2;
	
	@BeforeEach
	public void setup() {
		this.cuentaCorriente = new CuentaCorriente();
		this.cuentaCorriente2 = new CuentaCorriente();
		this.cajaDeAhorro = new CajaDeAhorro();
		this.cajaDeAhorro2 = new CajaDeAhorro();
		
		this.cuentaCorriente.depositar(800);
		this.cajaDeAhorro.depositar(800);
		
		this.cuentaCorriente2.setDescubierto(-600);
	}

	@Test
	public void testSetGetDescubierto() {
		this.cuentaCorriente2.setDescubierto(-600);
		assertEquals(-600, this.cuentaCorriente2.getDescubierto());
	}
	
	@Test
	public void testExtraer() {
		assertEquals(true, this.cuentaCorriente.extraer(400));
		assertEquals(true, this.cuentaCorriente2.extraer(400));
		assertEquals(true, this.cajaDeAhorro.extraer(400));
		assertEquals(false, this.cajaDeAhorro2.extraer(400));
	}
	
	@Test
	public void testGetSaldo() {
		this.cuentaCorriente.extraer(400);
		this.cuentaCorriente2.extraer(400);
		this.cajaDeAhorro.extraer(400);
		
		assertEquals(400, this.cuentaCorriente.getSaldo());
		assertEquals(-400, this.cuentaCorriente2.getSaldo());
		assertEquals(376, this.cajaDeAhorro.getSaldo());
		assertEquals(0, this.cajaDeAhorro2.getSaldo());
	}
	
	@Test
	public void testTranferirACuenta() {
		assertEquals(true, this.cuentaCorriente.tranferirACuenta(100, this.cuentaCorriente2));
		assertEquals(true, this.cuentaCorriente2.tranferirACuenta(100, this.cuentaCorriente));
		assertEquals(true, this.cajaDeAhorro.tranferirACuenta(100, this.cajaDeAhorro2));
		assertEquals(false, this.cajaDeAhorro2.tranferirACuenta(100, this.cajaDeAhorro));
		
		assertEquals(true, this.cuentaCorriente.tranferirACuenta(100, this.cajaDeAhorro));
		assertEquals(true, this.cuentaCorriente2.tranferirACuenta(100, this.cajaDeAhorro2));
		assertEquals(true, this.cajaDeAhorro.tranferirACuenta(100, this.cuentaCorriente));
		assertEquals(false, this.cajaDeAhorro2.tranferirACuenta(300, this.cuentaCorriente2));
	}
}
