package ar.edu.unlp.info.oo1.parcial2;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class FinanciaTuIdea {
	private List<Usuario> usuarios;
	private List<Proyecto> proyectos;
	
	public FinanciaTuIdea() {
		this.usuarios = new ArrayList<Usuario>();
		this.proyectos = new ArrayList<Proyecto>();
	}
	
	public void registrarUsuario(String nombre) {
		Usuario usuario = new Usuario(nombre, LocalDate.now());
		this.usuarios.add(usuario);
	}
	
	public void registrarUnProyecto(Usuario usuario, String titulo, String descripcion, double montoMinimo, LocalDate fechaLimite) {
		Proyecto proyecto = new Proyecto(usuario, titulo, descripcion, montoMinimo, fechaLimite);
		this.proyectos.add(proyecto);
	}
	
	public List<Proyecto> listarProyectosVigentes() {
		return this.proyectos.stream()
			   .filter(p -> p.isVigente())
			   .toList();
	}
	
	public List<Proyecto> listarProyectosVigentesConFinanciacionCompleta() {
		return this.proyectos.stream()
				   .filter(p -> p.isVigenteConFinanciacionCompleta())
				   .toList();
	}
	
	public List<Proyecto> listarProyectosConAportesRecibidosEntreDosFechas(LocalDate fechaInicio, LocalDate fechaFin) {
		return this.proyectos.stream()
				   .filter(p -> p.recibioAportesEntreFechas(fechaInicio, fechaFin))
				   .toList();
	}
	
	public List<Proyecto> listarProyectosPositivosEntreDosFechas(LocalDate fechaInicio, LocalDate fechaFin) {
		return this.proyectos.stream()
				   .filter(p -> p.isPositivo(fechaInicio, fechaFin))
				   .toList();
	}
}
