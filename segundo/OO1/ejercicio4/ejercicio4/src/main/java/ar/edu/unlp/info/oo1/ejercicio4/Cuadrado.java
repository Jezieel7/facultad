package ar.edu.unlp.info.oo1.ejercicio4;

public class Cuadrado implements Figura{
    private double lado;

    public void setLado(double lado){
        this.lado = lado;
    };

    public double getLado(){
        return this.lado;
    };

    public double getArea(){
        return Math.pow(this.getLado(), 2);
    };
    
    public double getPerimetro(){
        return (this.getLado() * 4);
    };
}