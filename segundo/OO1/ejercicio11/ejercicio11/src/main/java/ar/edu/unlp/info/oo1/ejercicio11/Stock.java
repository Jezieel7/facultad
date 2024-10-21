package ar.edu.unlp.info.oo1.ejercicio11;

public class Stock implements Investment{
	String name;
	int quantity;
	double unitValue;
	
	public Stock(String name, int quantity, double unitValue) {
		this.setName(name);
		this.setQuantity(quantity);
		this.setUnitValue(unitValue);
	}
	
	public double currentValue() {
		return (this.quantity * this.unitValue);
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public double getUnitValue() {
		return unitValue;
	}

	public void setUnitValue(double unitValue) {
		this.unitValue = unitValue;
	}
}
