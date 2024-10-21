package ar.edu.unlp.info.oo1.ejercicio15y16;

import java.time.LocalDate;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class Usuario {
	private String nombre;
	private String direccion;
	private int dni;
	private Set<Propiedad> propiedades;
	private Set<Reserva> reservas;

	public Usuario(String nombre, String direccion, int dni) {
		this.nombre = nombre;
		this.direccion = direccion;
		this.dni = dni;
		this.propiedades = new HashSet<Propiedad>();
		this.reservas = new HashSet<Reserva>();
	}
	
	public double ingresos(LocalDate desde, LocalDate hasta) {
		DateLapse periodo = new DateLapse(desde, hasta);
		return this.propiedades.stream()
			   .mapToDouble(propiedad -> propiedad.valorEntre(periodo))
			   .sum();
	}
	
	public boolean agregarPropiedad(Propiedad propiedad) {
		return this.propiedades.add(propiedad);
	}
	
	public Set<Reserva> getReservas(){
		return this.reservas;
	}
	
	public boolean agregarReserva(Reserva reserva) {
		return reservas.add(reserva);
	}
	
	public boolean eliminarReserva(Reserva reserva) {
		return reservas.remove(reserva);
	}
}
