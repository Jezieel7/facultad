package ar.edu.unlp.info.oo1.ejercicio17;

import java.time.LocalDate;

public class Interurbana extends Llamada{

	private double distanciaEnKm;
	
	public Interurbana(LocalDate fecha, int horaInicio, int duracion, Numero emisor, Numero receptor, double distancia) {
		super(fecha, horaInicio, duracion, emisor, receptor);
		this.distanciaEnKm = distancia;
	}
	
	public double costoPorMinuto() {
		if(this.distanciaEnKm < 100) {
			return (this.duracion * 2);
		}else if(this.distanciaEnKm >= 100 && this.distanciaEnKm <= 500) {
			return (this.duracion * 2.5);
		}
		return (this.duracion * 3);
	}
	
	@Override
	public double costo() {
		return (5 * this.costoPorMinuto());
	}
	
}
