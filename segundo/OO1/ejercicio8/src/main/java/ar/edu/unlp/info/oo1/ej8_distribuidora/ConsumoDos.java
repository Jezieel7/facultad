package ar.edu.unlp.info.oo1.ej8_distribuidora;

import java.time.LocalDate;

public class ConsumoDos {
	
	private LocalDate fecha;
	private double consumoDeEnergiaActiva;
	private double consumoDeEnergiaReactiva;

	public ConsumoDos(LocalDate fecha, double consumoActiva, double consumoReactiva) {
		this.fecha = fecha;
		this.consumoDeEnergiaActiva = consumoActiva;
		this.consumoDeEnergiaReactiva = consumoReactiva;
	}
	
	public double costoEnBaseA(double precioKWh) {
		return this.consumoDeEnergiaActiva * precioKWh;
	}
	
	public double factorDePotencia() {
		return this.consumoDeEnergiaActiva / Math.sqrt(Math.pow(this.consumoDeEnergiaActiva, 2) + Math.pow(this.consumoDeEnergiaReactiva, 2));
	}
	
	public LocalDate getFecha() {
		return fecha;
	}

	public double getConsumoDeEnergiaActiva() {
		return consumoDeEnergiaActiva;
	}

	public double getConsumoDeEnergiaReactiva() {
		return consumoDeEnergiaReactiva;
	}
}
