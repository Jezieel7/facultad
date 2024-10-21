package ar.edu.unlp.info.oo1.ejercicio3;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class Presupuesto {
	private LocalDate fecha;
	private String cliente;
	private List<Item> items;
	
	public Presupuesto() {
		this.setFecha(LocalDate.now());
		this.setItems(new ArrayList<Item>());
	}
	
	public LocalDate getFecha() {
		return fecha;
	}

	public void setFecha(LocalDate fecha) {
		this.fecha = fecha;
	}

	public String getCliente() {
		return cliente;
	}

	public void setCliente(String cliente) {
		this.cliente = cliente;
	}
	
	public Presupuesto cliente(String cliente) {
		this.setCliente(cliente);
		return this;
	}
	
	public List<Item> getItems() {
		return items;
	}

	public void setItems(List<Item> items) {
		this.items = items;
	}
	
	public void agregarItem(Item item) {
		this.items.add(item);
		//this.setItems(this.getItems().add(item));
	}
	
	public double calcularTotal() {
		double total = 0;
		for(Item item: this.getItems()) {
			total += item.costo();
		}
		//this.getItems().stream();
		//forEach(item -> item.costo());
		return total;
	}
}
