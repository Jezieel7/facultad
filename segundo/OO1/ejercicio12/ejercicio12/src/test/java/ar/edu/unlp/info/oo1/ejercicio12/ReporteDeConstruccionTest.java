package ar.edu.unlp.info.oo1.ejercicio12;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class ReporteDeConstruccionTest {
	private ReporteDeConstruccion reporteDeConstruccion;
	private Cilindro cilindro = new Cilindro("pasto", "naranja", 5, 4);
	private Esfera esfera = new Esfera("pasto", "rojo", 5);
	private PrismaRectangular prismaRectangular = new PrismaRectangular("madera", "azul", 3, 4, 5);
	
	@BeforeEach
	public void setup() {
		this.reporteDeConstruccion = new ReporteDeConstruccion();
		this.reporteDeConstruccion.agregarPieza(this.cilindro);
		this.reporteDeConstruccion.agregarPieza(this.cilindro);
		this.reporteDeConstruccion.agregarPieza(this.esfera);
		this.reporteDeConstruccion.agregarPieza(this.esfera);
		this.reporteDeConstruccion.agregarPieza(this.prismaRectangular);
		this.reporteDeConstruccion.agregarPieza(this.prismaRectangular);
		this.reporteDeConstruccion.agregarPieza(this.prismaRectangular);
	}

	@Test
	public void testVolumenDeMaterial() {
		assertEquals(1413.7166941154069, this.reporteDeConstruccion.volumenDeMaterial("pasto"));
	}
	
	@Test
	public void testSuperficieDeColor() {
		
		assertEquals(565.4866776461628, this.reporteDeConstruccion.superficieDeColor("naranja"));
	}
}
