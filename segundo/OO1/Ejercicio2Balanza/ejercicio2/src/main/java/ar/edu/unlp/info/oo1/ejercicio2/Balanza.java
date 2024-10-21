package ar.edu.unlp.info.oo1.ejercicio2;

public class Balanza {
	private int cantidadDeProductos;
	private double precioTotal;
	private double pesoTotal;
	
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
	
	public double getPrecioTotal() {
		return this.precioTotal;
	};
	
	public void setPrecioTotal(double precioTotal) {
		this.precioTotal = precioTotal;
	};
	
	public void ponerEnCero() {
		this.setCantidadDeProductos(0);
		this.setPrecioTotal(0);
		this.setPesoTotal(0);
	};
	
	public void agregarProducto(Producto producto) {
		this.setCantidadDeProductos(this.getCantidadDeProductos()+1);
		this.setPesoTotal(this.getPesoTotal() + producto.getPeso());
		this.setPrecioTotal(this.getPrecioTotal() + producto.getPrecio());
	};
	
	public Ticket emitirTicket() {
		Ticket ticket = new Ticket(this.getCantidadDeProductos(), this.getPesoTotal(), this.getPrecioTotal());
		return ticket;
	};
}
