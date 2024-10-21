package ar.edu.unlp.info.oo1.ejercicio3bis;
import java.time.LocalDate;

import java.util.List;

public class Ticket {
	private LocalDate fecha;
	private List<Producto> productos;
	
	public Ticket(List<Producto> productos) {
		this.setFecha(LocalDate.now());
		this.setProductos(productos);
	};
	
	public List<Producto> getProductos() {
		return productos;
	}
	
	public void setProductos(List<Producto> productos) {
		this.productos = productos;
	}
	
	public LocalDate getFecha() {
		return this.fecha;
	}
	
	public void setFecha(LocalDate fecha) {
		this.fecha = fecha;
	}
	
	public int getCantidadDeProductos() {
		return this.getProductos().size();
	};
	
	public double getPesoTotal() {
		double total = 0;
		for(Producto producto: this.getProductos()) {
			total += producto.getPeso();
		}
		return total;
	};
	
	public double getPrecioTotal() {
		double total = 0;
		for(Producto producto: this.getProductos()) {
			total += producto.getPrecio();
		}
		return total;
	};
	
	public double impuesto() {
		return this.getPrecioTotal()*0.21;
	};
}
