package ar.edu.unlp.info.oo1.ejercicio17;

public class Pais {
    private int montoDiurno,montoNocturno;

    public Pais(int montoDiurno, int montoNocturno) {
        this.montoDiurno = montoDiurno;
        this.montoNocturno = montoNocturno;
    }

    public double monto(int hora){
        return (hora >= 8 && hora < 20) ? montoDiurno : montoNocturno;
    }
}
