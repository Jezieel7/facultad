package ar.edu.unlp.info.oo1.ejercicio15y16;

import java.time.LocalDate;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

public class Oobnb {
	private Set<Usuario> usuarios;
	private Set<Propiedad> propiedades;
	
	public Oobnb() {
		this.usuarios = new HashSet<Usuario>();
		this.propiedades = new HashSet<Propiedad>();
	}
	
	public Usuario registrarUsuario(String nombre, String direccion, int dni) {
		Usuario usuario = new Usuario(nombre, direccion, dni);
		this.usuarios.add(usuario);
		return usuario;
	}
	
	public Propiedad registrarPropiedad(String nombre, String descripcion, double precioPorNoche, String direccion, Usuario usuario, Politica politica) {
		Propiedad propiedad = new Propiedad(nombre, descripcion, precioPorNoche, direccion, politica);
		this.propiedades.add(propiedad);
		return propiedad;
	}
	
	public List<Propiedad> propiedadesDisponibles(LocalDate desde, LocalDate hasta){
		DateLapse periodo = new DateLapse(desde, hasta);
		return this.propiedades.stream()
			   .filter(propiedad-> propiedad.isAvailable(periodo))
			   .collect(Collectors.toList());
	}
}
