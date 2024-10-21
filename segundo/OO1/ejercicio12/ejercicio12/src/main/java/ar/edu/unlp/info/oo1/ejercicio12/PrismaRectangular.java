package ar.edu.unlp.info.oo1.ejercicio12;

public class PrismaRectangular extends Pieza{
	int ladoMayor;
	int ladoMenor;
	int altura;
	
	public PrismaRectangular(String material, String color, int ladoMayor, int ladoMenor, int altura) {
		super(material, color);
		this.setLadoMenor(ladoMenor);
		this.setLadoMenor(ladoMenor);
		this.setAltura(altura);
	}
	
	public double volumen() {
		return this.ladoMayor * this.ladoMenor * this.altura;
	}
	
	public double superficie() {
		return 2 * (this.ladoMayor * this.ladoMenor + this.ladoMayor * this.altura + this.ladoMenor * this.altura);
	}
	
	public int getLadoMayor() {
		return ladoMayor;
	}
	public void setLadoMayor(int ladoMayor) {
		this.ladoMayor = ladoMayor;
	}
	public int getLadoMenor() {
		return ladoMenor;
	}
	public void setLadoMenor(int ladoMenor) {
		this.ladoMenor = ladoMenor;
	}
	public int getAltura() {
		return altura;
	}
	public void setAltura(int altura) {
		this.altura = altura;
	}
	
}
