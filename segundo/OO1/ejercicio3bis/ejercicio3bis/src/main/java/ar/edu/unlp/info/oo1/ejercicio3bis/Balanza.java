package ar.edu.unlp.info.oo1.ejercicio3bis;
import java.util.ArrayList;
import java.util.List;

public class Balanza {
	private List<Producto> productos = new ArrayList<Producto>();
	
	public int getCantidadDeProductos() {
		return this.getProductos().size();
	};
	
	public double getPesoTotal() {
		double total = 0;
		for(Producto producto : this.getProductos()) {
			total += producto.getPeso();
		}
		return total;
	};
	
	public double getPrecioTotal() {
		double total = 0;
		for(Producto producto : this.getProductos()) {
			total += producto.getPrecio();
		}
		return total;
	};
	
	public List<Producto> getProductos() {
		return productos;
	}

	public void ponerEnCero() {
		this.productos = new ArrayList<Producto>();
	};
	
	public void agregarProducto(Producto producto) {
		this.productos.add(producto);
	};
	
	public Ticket emitirTicket() {
		return new Ticket(this.getProductos());
	};
}
