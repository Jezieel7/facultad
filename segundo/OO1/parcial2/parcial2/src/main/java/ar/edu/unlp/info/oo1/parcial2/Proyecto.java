package ar.edu.unlp.info.oo1.parcial2;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class Proyecto {
	private String titulo;
	private String descripcionObjetivos;
	private double montoMinimo;
	private LocalDate fechaLimite;
	private Usuario propietario;
	private List<Aporte> aportes;
	
	public Proyecto(Usuario propietario, String titulo, String descripcionObjetivos, double monto, LocalDate fechaLimite) {
		this.titulo = titulo;
		this.descripcionObjetivos = descripcionObjetivos;
		this.montoMinimo = monto;
		this.fechaLimite = fechaLimite;
		this.propietario = propietario;
		this.aportes = new ArrayList<Aporte>();
	}
	
	public Aporte recibirAporte(double monto) {
		Aporte aporte = new Aporte(monto, LocalDate.now());
		this.aportes.add(aporte);
		return aporte;
	}
	
	public boolean isVigente() {
		return this.fechaLimite.isAfter(LocalDate.now());
	}
	
	public double totalAportes() {
		return this.aportes.stream()
	               .mapToDouble(a -> a.getMonto())
	               .sum();
	}
	
	public boolean isVigenteConFinanciacionCompleta() {
		return (this.isVigente() && (this.totalAportes() >= this.montoMinimo));
	}
	
	public boolean recibioAportesEntreFechas(LocalDate fechaInicio, LocalDate fechaFin) {
		return this.aportes.stream()
			   .filter(a -> a.isEntreFechas(fechaInicio, fechaFin))
			   .findFirst()
			   .isPresent();
	}
	
	public boolean aporteDiarioMayorATotalAportes(){
		return (this.propietario.obtenerTasaDeAportesDiarios() > this.totalAportes());
	}
	
	public boolean isPositivo(LocalDate fechaInicio, LocalDate fechaFin) {
		return (this.recibioAportesEntreFechas(fechaInicio, fechaFin) && this.aporteDiarioMayorATotalAportes());
	}
}
