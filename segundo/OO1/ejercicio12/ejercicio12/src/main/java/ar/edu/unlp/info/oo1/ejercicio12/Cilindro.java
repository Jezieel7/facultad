package ar.edu.unlp.info.oo1.ejercicio12;

public class Cilindro extends Pieza{
	public int radio;
	public int altura;
	
	public Cilindro (String material, String color, int radio, int altura) {
		super(material, color);
		this.setRadio(radio);
		this.setAltura(altura);
	}
	
	public double volumen() {
		return Math.PI * Math.pow(this.radio, 2) * this.altura;
	}
	
	public double superficie() {
		return 2 * Math.PI * this.radio * this.altura + 2 * Math.PI * Math.pow(this.radio, 2);
	}
	
	public int getRadio() {
		return radio;
	}
	public void setRadio(int radio) {
		this.radio = radio;
	}
	public int getAltura() {
		return altura;
	}
	public void setAltura(int altura) {
		this.altura = altura;
	}
	
}
