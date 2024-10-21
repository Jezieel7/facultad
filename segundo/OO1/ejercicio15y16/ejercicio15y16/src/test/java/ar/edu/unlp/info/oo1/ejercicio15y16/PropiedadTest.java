package ar.edu.unlp.info.oo1.ejercicio15y16;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.time.LocalDate;

import static org.junit.jupiter.api.Assertions.*;
public class PropiedadTest {
    private Propiedad p1,p2,p3;
    private Usuario u;
    private Reserva r;
    private LocalDate f1,f2,f3;
    private DateLapse dl;
    
    @BeforeEach
    void SetUp(){
        p1 = new Propiedad("a","a",10,"1",new Estricta());
        u = new Usuario("a","1",1);
        f1 = LocalDate.of(1,1,1);
        f2 = LocalDate.of(1,1,10);
        f3 = LocalDate.of(2,1,10);
        dl = new DateLapse(f1,f2);
    }

    @Test
    void testReservar(){
        assertNotNull(p1.reservar(dl,u));
        assertNull(p1.reservar(dl,u));
    }

    @Test
    void testValorEntre(){
        p1.reservar(dl,u);
        assertEquals(90,p1.valorEntre(dl));
        dl = new DateLapse(f3,f3);
        assertEquals(0,p1.valorEntre(dl));
    }

    @Test
    void testIsAvailable(){
        assertTrue(p1.isAvailable(dl));
        p1.reservar(dl,u);
        assertFalse(p1.isAvailable(dl));
    }

    @Test
    void testDelRes(){
        Reserva r = p1.reservar(dl,u);
        p1.eliminarReserva(r);
        assertTrue(p1.isAvailable(dl));
    }

}
