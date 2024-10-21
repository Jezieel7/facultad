package ar.edu.unlp.info.oo1.ej8_distribuidora;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.time.LocalDate;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class FacturaTest {

	private UsuarioDos usuario;
	private FacturaDos factura;
	
	
	@BeforeEach
	public void setUp() {
		usuario = new UsuarioDos("Mercedes", "Calle Sosa 99, San Miguel de Tucuman");
		factura = new FacturaDos(2000, 10, usuario);
		
	}
	
	@Test
	public void testInicializar() {
		assertEquals(10, factura.getDescuento());
		assertEquals(2000, factura.getMontoEnergiaActiva());
		assertEquals(factura.getFecha(), LocalDate.now());
		assertEquals(usuario, factura.getUsuario());
	}
	
	@Test
	public void testMontoTotal() {
		assertEquals(1800, factura.montoTotal());
	}
	

}
