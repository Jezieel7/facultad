package ar.edu.unlp.info.oo1.parcial2;

import java.time.LocalDate;

public class Aporte {
	private double monto;
	private LocalDate fecha;
	
	public Aporte(double monto, LocalDate fecha) {
		this.monto = monto;
		this.fecha = fecha;
	}
	
	public double getMonto() {
		return this.monto;
	}
	
	public boolean isEntreFechas(LocalDate fechaInicio, LocalDate fechaFin) {
		return this.fecha.isEqual(fechaInicio) || this.fecha.isEqual(fechaFin) || (this.fecha.isAfter(fechaInicio) && this.fecha.isBefore(fechaFin));
	}
}
