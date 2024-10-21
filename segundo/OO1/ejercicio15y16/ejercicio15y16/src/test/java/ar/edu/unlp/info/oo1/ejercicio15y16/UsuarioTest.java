package ar.edu.unlp.info.oo1.ejercicio15y16;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.time.LocalDate;

import static org.junit.jupiter.api.Assertions.*;

public class UsuarioTest {
    Usuario u;
    Propiedad p1;
    LocalDate f1,f2;
    DateLapse dl;
    Reserva r;

    @BeforeEach
    void SetUp(){
        u = new Usuario("a","1",1);
        f1 = LocalDate.of(11111,1,1);
        f2 = LocalDate.of(11111,1,10);
        dl = new DateLapse(f1,f2);
        p1 = new Propiedad("a","a",10,"1",new Estricta());
        u.agregarPropiedad(p1);
        r= p1.reservar(dl,u);
    }

    @Test
    void testIngresos(){
        assertEquals(u.ingresos(f1,f2),90);
        r.borrarse();
        assertEquals(u.ingresos(f1,f2),0);
    }
}
