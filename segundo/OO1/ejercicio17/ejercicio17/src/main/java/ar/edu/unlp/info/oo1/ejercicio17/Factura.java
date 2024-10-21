package ar.edu.unlp.info.oo1.ejercicio17;

import java.time.LocalDate;

public class Factura {
	private LocalDate fechaFacturacion;
	private DateLapse periodo;
	private double montoTotal;
	
	public Factura(DateLapse periodo, double montoTotal) {
		this.fechaFacturacion = LocalDate.now();
		this.periodo = periodo; 
		this.montoTotal = montoTotal;
	}
}
