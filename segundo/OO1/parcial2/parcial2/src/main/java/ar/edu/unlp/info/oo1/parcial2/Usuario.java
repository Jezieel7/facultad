package ar.edu.unlp.info.oo1.parcial2;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;

public class Usuario {
	private String nombre;
	private LocalDate fechaRegistro;
	private List<Proyecto> proyectos;
	private List<Aporte> aportes;
	
	public Usuario(String nombre, LocalDate fechaRegistro) {
		this.nombre = nombre;
		this.fechaRegistro = fechaRegistro;
		this.proyectos = new ArrayList<Proyecto>();
		this.aportes = new ArrayList<Aporte>();
	}
	
	public void aportarAProyecto(Proyecto proyecto, double monto) {
		if(this.proyectos.stream()
		   .filter(p -> (p == proyecto))
		   .findFirst().isEmpty()){
				proyecto.recibirAporte(monto);
		}
	}
	
	public int diasRegistrado() {
		return (int) this.fechaRegistro.until(LocalDate.now(), ChronoUnit.DAYS); 
	}
	
	public double totalAportes() {
		return this.aportes.stream()
	               .mapToDouble(a -> a.getMonto())
	               .sum();
	}
	
	public double obtenerTasaDeAportesDiarios() {
		return (this.totalAportes() / this.diasRegistrado());
	}
}
