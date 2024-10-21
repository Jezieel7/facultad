package ar.edu.unlp.info.oo1.ejercicio12;

public abstract class Pieza {
	private String material;
	private String color;
	
	public Pieza(String material, String color) {
		this.setMaterial(material);
		this.setColor(color);
	}
	
	public abstract double volumen();
	
	public abstract double superficie();
	
	public String getMaterial() {
		return material;
	}
	public void setMaterial(String material) {
		this.material = material;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	
}
