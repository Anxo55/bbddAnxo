
public class PruebaParametros {

	public static void main(String[] args) {
		Persona p1 = new Persona("Pepe", 57);
		Persona p2 = new Persona("Angel", 45);
		
		System.out.println(p1);
		System.out.println(p2);
		
		p1=p2;
		
		System.out.println(p1);
		System.out.println(p2);
		
		p2.nombre="Miguel";
		
		System.out.println(p1);
		
	}
	
}
