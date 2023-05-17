public class CompruebaDia {
	private String dia;
	
	public CompruebaDia(String dia) {
		this.dia=dia;
	}
	
	
	public String getDia() {
		return dia;
	}


	public static boolean comprobarDiaSemana(String dia) {
		//Devuelve verdadero si el día es laborable y falso en caso contrario
		switch(dia) {
		case "lunes":
		case "martes":
		case "miercoles":
		case "jueves":
		case "viernes": return true;
						
		case "sabado":
		case "domingo": return false;	
		                
		default: return false;
		}		
		
	}
	
	public boolean comprobarDiaSemanaNS() {
		//Devuelve verdadero si el día es laborable y falso en caso contrario
		switch(this.dia) {
		case "lunes":
		case "martes":
		case "miercoles":
		case "jueves":
		case "viernes": return true;
						
		case "sabado":
		case "domingo": return false;	
		                
		default: return false;
		}		
		
	}

}

