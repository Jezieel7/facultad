package ar.edu.unlp.info.oo1.ejercicio15y16;

import java.time.LocalDate;

public class Reserva {
	private Usuario inquilino;
	private Propiedad propiedad;
	private DateLapse periodo;
	
	public Reserva(Propiedad propiedad, DateLapse periodo, Usuario usuario) {
		this.propiedad = propiedad;
		this.periodo = periodo;
		this.inquilino = usuario;
		
	}
	
	public boolean overlaps(DateLapse periodo) {
		return this.periodo.overlaps(periodo);
	}
	
	public double precio() {
		return (this.propiedad.getPrecioPorNoche() * this.periodo.sizeInDays());
	}
	
	public int diasAInicio(LocalDate fecha) {
		return this.periodo.diasAInicio(fecha);
	}
	
	public boolean borrarse() {
		return (this.periodo.diasAInicio(LocalDate.now()) > 0 && (this.propiedad.eliminarReserva(this) || this.inquilino.eliminarReserva(this)));
	}
	
	public double reembolso(LocalDate fecha) {
		return this.propiedad.reembolso(this, fecha);
	}
}
