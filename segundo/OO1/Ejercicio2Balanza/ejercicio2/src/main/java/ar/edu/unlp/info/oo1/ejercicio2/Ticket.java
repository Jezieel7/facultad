package ar.edu.unlp.info.oo1.ejercicio2;
import java.time.LocalDate;

public class Ticket {
	private LocalDate fecha;
	private int cantidadDeProductos;
	private double pesoTotal;
	private double precioTotal;
	
	public Ticket(int cantidadDeProductos, double pesoTotal, double precioTotal) {
		this.fecha = LocalDate.now();
		this.setCantidadDeProductos(cantidadDeProductos);
		this.setPesoTotal(pesoTotal);
		this.setPrecioTotal(precioTotal);
	};

	public LocalDate getFecha() {
		return this.fecha;
	}
	
	public int getCantidadDeProductos() {
		return this.cantidadDeProductos;
	};
	
	public void setCantidadDeProductos(int cantidadDeProductos) {
		this.cantidadDeProductos = cantidadDeProductos;
	};
	
	public double getPesoTotal() {
		return this.pesoTotal;
	};
	
	public void setPesoTotal(double pesoTotal) {
		this.pesoTotal = pesoTotal;
	};
	
	public void setPrecioTotal(double precioTotal) {
		this.precioTotal = precioTotal;
	};
	
	public double getPrecioTotal() {
		return this.precioTotal;
	};
	
	public double impuesto() {
		return this.getPrecioTotal()*0.21;
	};
}
