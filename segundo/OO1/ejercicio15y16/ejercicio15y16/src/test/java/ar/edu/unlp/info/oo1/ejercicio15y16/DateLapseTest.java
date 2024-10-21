package ar.edu.unlp.info.oo1.ejercicio15y16;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.time.LocalDate;
import static org.junit.jupiter.api.Assertions.*;
//Tiempo 1:13:02:32
public class DateLapseTest {

    LocalDate d1,d2,d3,d4,d5,d6;
    DateLapse dl1,dl2,dl3,dl4,dl5,dl6;

    @BeforeEach
    void setup() {
        d1 = LocalDate.of(1, 1, 1);
        d2 = LocalDate.of(1, 6, 6);
        d3 = LocalDate.of(1, 12, 31);
        d4 = LocalDate.of(2, 1, 1);
        d6 = LocalDate.of(2, 12, 31);
        dl1 = new DateLapse(d1,d3);
        dl2 = new DateLapse(d1,d1);
        dl3 = new DateLapse(d1,d2);
        dl4 = new DateLapse(d4,d6);
    }
    @Test
    void includesDateTest(){
        assertTrue(dl1.includesDate(d2));
        assertFalse(dl1.includesDate(d6));
    }
    @Test
    void sizeInDaysTest(){
        assertEquals(dl1.sizeInDays(),364);
        assertEquals(dl2.sizeInDays(),0);
    }
    @Test
    void overlapsTest(){
        assertTrue(dl1.overlaps(dl3));
        assertTrue(dl2.overlaps(dl2));
        assertFalse(dl4.overlaps(dl1));
    }
}
