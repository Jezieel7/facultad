package ar.edu.unlp.info.oo1.ej8_distribuidora;

import static org.junit.jupiter.api.Assertions.*;

import java.time.LocalDate;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class DistribuidoraTest {

	private DistribuidoraDos distribuidora, redCompleta;
	private UsuarioDos mercedes, pablo, frida;
	private ConsumoDos alto, medio, bajo;

	@BeforeEach
	public void setUp() {
		this.distribuidora = new DistribuidoraDos(50d);
		this.redCompleta = new DistribuidoraDos(10d);

		mercedes = new UsuarioDos("Mercedes", "Calle Sosa 99, San Miguel de Tucuman");
		pablo = new UsuarioDos("Pablo", "Calle Picasso 23, Paris");
		frida = new UsuarioDos("Frida", "Calle Kahlo 54, Mexico DF");

		alto = new ConsumoDos(LocalDate.of(2021, 6, 8), 5000, 2500);
		bajo = new ConsumoDos(LocalDate.of(2021, 6, 10), 300, 300);
		medio = new ConsumoDos(LocalDate.of(2021, 6, 15), 100, 800);

		redCompleta.agregarUsuario(mercedes);
		redCompleta.agregarUsuario(pablo);
		redCompleta.agregarUsuario(frida);
	}

	/**
	 * Pedido en las tareas del ejercicio, puede verse como iniciar el sistema.
	 */
	@Test
	public void testConstructor() {
		assertEquals(50d, this.distribuidora.getPrecioKW());
		assertEquals(0d, this.distribuidora.consumoTotalActiva());
		assertTrue(this.distribuidora.facturar().isEmpty());
		assertTrue(this.distribuidora.getUsuarios().isEmpty());
	}

	/**
	 * Pedido en las tareas del ejercicio.
	 */
	@Test
	public void testAgregarUsuario() {
		UsuarioDos usuario = new UsuarioDos("Nombre", "Calle 88, La Plata");
		this.distribuidora.agregarUsuario(usuario);
		assertEquals(1, this.distribuidora.getUsuarios().size());
		assertTrue(this.distribuidora.getUsuarios().contains(usuario));
	}

	/**
	 * Pedido en las tareas del ejercicio.
	 */
	@Test
	public void testConsumoTotalDeLaRed() {
		this.mercedes.agregarMedicion(medio);
		this.pablo.agregarMedicion(bajo);
		this.frida.agregarMedicion(alto);
		assertEquals(5400, this.redCompleta.consumoTotalActiva(), 0.001d);
		ConsumoDos otro = new ConsumoDos(LocalDate.of(2021, 7, 15), 100, 800);
		this.frida.agregarMedicion(otro);
		assertEquals(500, this.redCompleta.consumoTotalActiva(), 0.001d);
	}

}
