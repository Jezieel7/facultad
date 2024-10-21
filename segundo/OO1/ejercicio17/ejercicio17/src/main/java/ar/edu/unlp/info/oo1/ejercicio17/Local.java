package ar.edu.unlp.info.oo1.ejercicio17;

import java.time.LocalDate;

public class Local extends Llamada{
	
	public Local(LocalDate fecha, int horaInicio, int duracion, Numero emisor, Numero receptor) {
		super(fecha, horaInicio, duracion, emisor, receptor);
	}
	
	@Override
	public double costo() {
		return this.duracion;
	}
}
