package ar.edu.unlp.info.oo1.ejercicio15y16;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.time.LocalDate;

import static org.junit.jupiter.api.Assertions.*;
public class ReservaTest {
    private Propiedad p1,p2,p3;
    private Usuario u;
    private Reserva r1,r2,r3;
    private LocalDate f1,f2,f3,f4,f5,f6;
    private DateLapse dl,dl2,dl3;

    @BeforeEach
    void SetUp(){
        p1 = new Propiedad("a","a",10,"1",new Estricta());
        p2 = new Propiedad("b","b",10,"2",new Moderada());
        p3 = new Propiedad("c","c",10,"3",new Flexible());
        u = new Usuario("a","1",1);
        f1 = LocalDate.of(1,1,1);
        f2 = LocalDate.of(1,1,10);
        f3 = LocalDate.of(0,1,10);
        f4 = LocalDate.of(0,12,31);
        f5 = LocalDate.of(0,12,29);
        f6 = LocalDate.now().minusDays(10);
        dl = new DateLapse(f1,f2);
        dl2 = new DateLapse(f1,f1);
        dl3 = new DateLapse(f6,LocalDate.now());
        r1 = p1.reservar(dl2,u);
        r2 = p2.reservar(dl,u);
        r3 = p3.reservar(dl,u);
    }

    @Test
    void testPrecio(){
        assertEquals(90,r2.precio());
        assertEquals(0,r1.precio());
    }

    @Test
    void testBorrarse(){
        assertTrue(r1.borrarse());
        assertTrue(u.getReservas().isEmpty());
        assertTrue(p1.isAvailable(dl2));
        r1 = p1.reservar(dl3,u);
        assertFalse(r1.borrarse());
        assertFalse(u.getReservas().isEmpty());
        assertFalse(p1.isAvailable(dl3));
    }

    @Test
    void testReembolso(){
        assertEquals(0,r1.reembolso(f3));
        assertEquals(0,r1.reembolso(f4));
        assertEquals(90,r2.reembolso(f3));
        assertEquals(0,r2.reembolso(f4));
        assertEquals(45,r2.reembolso(f5));
        assertEquals(90,r3.reembolso(f3));
        assertEquals(90,r3.reembolso(f4));
    }


}
