package ar.edu.unlp.info.oo1.ejercicio14;

public class Battleship {
	public int[] solution(String[] B) {
		int[] R = new int[3];
		int cant = 0;
		for(int i = 0; i < (B.length); i++) {
			for(int j = 0; j < (B[i].length()); j++) {
				if(B[i].charAt(j) == '#') {
					cant++;
					if(i != 0) {
						if(B[i-1].charAt(j) == '#') {
							cant++;
						}
					}
					if(i != (B.length - 1)) {
						if(B[i+1].charAt(j) == '#') {
							cant++;
						}
					}
					if(j != 0) {
						if(B[i].charAt(j-1) == '#') {
							cant++;
						}
					}
					if(j != (B[i].length() - 1)) {
						if(B[i].charAt(j+1) == '#') {
							cant++;
						}
					}
					if(cant == 1) {
						R[0] = R[0] + 1;
					}else if(cant == 2) {
						R[1] = R[1] + 1;
					}else {
						R[2] = R[2] + 1;
					}
				}
				cant = 0;
			}
		}
		R[1] = (R[1] - (2 * R[2]))/2;
		return R;
	}
}
