package ar.edu.unlp.info.oo1.ej8_distribuidora;

import java.time.LocalDate;

public class FacturaDos {
	
	private double montoEnergiaActiva;
	private double descuento;
	private LocalDate fecha;
	private UsuarioDos usuario;
	
	public FacturaDos(double montoEnergiaActiva, double descuento, UsuarioDos usuario) {
		this.montoEnergiaActiva = montoEnergiaActiva;
		this.descuento = descuento;
		this.fecha = LocalDate.now();
		this.usuario = usuario;
	}
	
	public double montoTotal() {
		return this.montoEnergiaActiva * (1 - this.descuento / 100);
	}
	
	public double getMontoEnergiaActiva() {
		return this.montoEnergiaActiva;
	}

	public double getDescuento() {
		return this.descuento;
	}

	public LocalDate getFecha() {
		return this.fecha;
	}

	public UsuarioDos getUsuario() {
		return this.usuario;
	}
}
