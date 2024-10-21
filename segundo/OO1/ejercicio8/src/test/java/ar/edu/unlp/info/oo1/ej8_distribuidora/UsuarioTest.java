package ar.edu.unlp.info.oo1.ej8_distribuidora;

import static org.junit.jupiter.api.Assertions.*;

import java.time.LocalDate;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class UsuarioTest {
	
	private UsuarioDos usuario;
	private ConsumoDos consumoEnero;
	private ConsumoDos consumoFebrero;
	private ConsumoDos consumoMarzo;
	
	@BeforeEach
	public void setup() {
		this.usuario= new UsuarioDos("Towers", "La Plata");
		this.consumoEnero = new ConsumoDos(LocalDate.of(2021, 1, 1) , 100, 300);
		this.consumoFebrero = new ConsumoDos(LocalDate.of(2021, 2, 1) , 800, 100);
		this.consumoMarzo = new ConsumoDos(LocalDate.of(2021, 3, 1) , 800, 100);
		
		this.usuario.agregarMedicion(consumoFebrero);
		this.usuario.agregarMedicion(consumoMarzo);
		this.usuario.agregarMedicion(consumoEnero);
	}

	@Test
	public void testUltimoConsumoActiva() {
		assertEquals(800, this.usuario.ultimoConsumoActiva());
	}
	
	@Test
	public void testFacturarEnBaseA() {
		FacturaDos result = this.usuario.facturarEnBaseA(10);
		assertEquals(8000, result.getMontoEnergiaActiva());
		assertEquals(10, result.getDescuento());
		assertEquals(LocalDate.now(),result.getFecha());
	}

	/**
	 * Testea el agregar meidicion verificando que sea el ultimo agregado.
	 *  No tiene mucho mas para testear porque las mediciones son privadas.
	 */
	@Test
	public void testAgregarMedicion() {
		ConsumoDos ultimoConsumo = new ConsumoDos(LocalDate.of(2021, 5, 8), 500, 5000);
		this.usuario.agregarMedicion(ultimoConsumo);
		assertEquals(ultimoConsumo, this.usuario.ultimoConsumo());
	}

}
