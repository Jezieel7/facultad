package ar.edu.unlp.info.oo1.ejercicio15y16;

import java.time.LocalDate;
import java.util.HashSet;
import java.util.Set;
import java.util.stream.Collectors;

public class Propiedad {
	private String nombre;
	private String descripcion;
	private double precioPorNoche;
	private String direccion;
	private Politica politica;
	private Set<Reserva> reservas;
	
	public Propiedad(String nombre, String descripcion, double precioPorNoche, String direccion, Politica politica) {
		this.nombre = nombre;
		this.descripcion = descripcion; 
		this.precioPorNoche = precioPorNoche;
		this.direccion = direccion;
		this.politica = politica;
		this.reservas = new HashSet<Reserva>();
	}
	
	public double getPrecioPorNoche() {
		return this.precioPorNoche;
	}
	
	public double reembolso(Reserva reserva, LocalDate fecha) {
		return this.politica.reembolso(reserva, fecha);
	}
	
	public boolean isAvailable(DateLapse periodo) {
		return this.reservas.stream()
			   .filter(reserva -> reserva.overlaps(periodo))
			   .collect(Collectors.toList())
			   .isEmpty();
	}
	
	public double valorEntre(DateLapse periodo) {
		return this.reservas.stream()
			   .filter(reserva -> reserva.overlaps(periodo))
			   .mapToDouble(reserva -> reserva.precio())
			   .sum();
	}
	
	public Reserva reservar(DateLapse periodo, Usuario usuario) {
		if(this.isAvailable(periodo)) {
			Reserva reserva = new Reserva(this, periodo, usuario);
			reservas.add(reserva);
			usuario.agregarReserva(reserva);
			return reserva;
		}
		return null;
	}
	
	public boolean eliminarReserva(Reserva reserva) {
		return reservas.remove(reserva);
	}
}
