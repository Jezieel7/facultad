package ar.edu.unlp.info.oo1.ejercicio14;

public class Resolver {
	public int solution(int A, int B) {
		int x = 1; int consecutiveIntegers = 0;
		while((x * (x + 1)) < A) {
			x++;
		}
		if((x * (x + 1)) == A) {
			consecutiveIntegers++;
			x++;
		}
		while((x * (x + 1) < B)) {
			consecutiveIntegers++;
			x++;
		}
		if((x * (x + 1)) == B) {
			consecutiveIntegers++;
		}
		return consecutiveIntegers;
	}
	
	public boolean solution2(int[] A) {
		for(int i = 0; i < A.length; i++) {
			int actual = A[i];
			if(actual != 0) {
				if((actual + 1) == A[i] || (actual - 1) == A[i]) {
					return true;
				}
			}
		}
		return false;
	}
	
	//private int[] initialize(int[] R) {
	////	for(int i = 0; i < (R.length - 1); i++) {
	////		R[i] = 0;
	//	}
	//	return R;
	//}
	
	//private int recursiveSlot(String[] B, int i, int j) {
	//	int cant = 1;
		//	if(i != 0) {
	//		if(B[i-1].charAt(j) == '#') {
	//			cant =+ recursiveSlot(B, i-1, j);
	//		}
//	}
	//	if(i != (B.length - 1)) {
			//		if(B[i+1].charAt(j) == '#') {
	//			cant =+ recursiveSlot(B, i+1, j);
	//		}
//	}
	//	if(j != 0) {
	//		if(B[i].charAt(j-1) == '#') {
				//			cant =+ recursiveSlot(B, i, j-1);
	//		}
	//	}
	//	if(j != (B.length - 1)) {
	//		if(B[i].charAt(j+1) == '#') {
	//			cant =+ recursiveSlot(B, i, j+1);
	//		}
	//	}
	//	return cant;
	//}
	
	//public int[] solution(String[] B) {
	//	int[] R = new int[3];
		//	R = initialize(R);
	//	int cant = 0;
	//	for(int i = 0; i < (B.length - 1); i++) {
	//		for(int j = 0; j < (B[i].length() - 1); j++) {
	//		if(B[i].charAt(j) == '#') {
	//			cant = recursiveSlot(B, i, j);
					//			
	//			
	//			switch(cant) {
	//				case 1:  R[0]++;
	//				break;
	//			case 2:  R[1]++;
	//			break;
	//			case 3:  R[2]++;
	//				break;
						//		}

					
					//Si tiene alrededor vacio es patrulla
					//Si tiene alguno de los costados o arriba submarino
					//Si tiene 2 lugares es un destructor
					//B[".##..", ".#.#.", ".###."];
	//		}
	//		}
	//	}
	//	return R;
	//}
}
