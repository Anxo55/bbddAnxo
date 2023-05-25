
public class Principal {

	public static void main(String[] args) {
		
		int contador = 0;
		boolean salida = false;
		
		/*while(contador<=10) {
			System.out.println(contador);
			contador++;
			continue;
		}*/
		
		/*for(int i=0; i<=10; i++) {
			System.out.println(i);
			i=1;
		}*/
		do {
			System.out.println(contador);
			contador++;
			salida=(contador==10);
		}while(!salida);
	}
	
}
