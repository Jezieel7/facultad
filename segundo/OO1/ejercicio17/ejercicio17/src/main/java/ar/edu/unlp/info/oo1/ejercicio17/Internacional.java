package ar.edu.unlp.info.oo1.ejercicio17;

import java.time.LocalDate;

public class Internacional extends Llamada{
	private Pais paisOrigen;
	private Pais paisDestino;
	
	public Internacional(LocalDate fecha, int horaInicio, int duracion, Numero emisor, Numero receptor, Pais paisOrigen, Pais paisDestino) {
		super(fecha, horaInicio, duracion, emisor, receptor);
		this.paisOrigen = paisOrigen;
		this.paisDestino = paisDestino;
	}
	
	@Override
	public double costo() {
		return this.paisDestino.monto(this.horaInicio);
	}
}
