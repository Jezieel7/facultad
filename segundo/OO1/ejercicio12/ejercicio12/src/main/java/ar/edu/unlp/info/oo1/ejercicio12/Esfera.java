package ar.edu.unlp.info.oo1.ejercicio12;

public class Esfera extends Pieza{
	int radio;

	public Esfera(String material, String color, int radio) {
		super(material, color);
		this.setRadio(radio);
	}
	
	public double volumen() {
		return (4/3) * Math.PI * Math.pow(this.radio, 3);
	}
	
	public double superficie() {
		return 4 * Math.PI * Math.pow(this.radio, 2);
	}
	
	public int getRadio() {
		return radio;
	}

	public void setRadio(int radio) {
		this.radio = radio;
	}
	
}
