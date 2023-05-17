
public class ComprobarDiaSemana {

	final static String[] dias = {"lunes","martes","miercoles","jueves","viernes","sabado","domingo"};
	
	
	public static String compruebaDia(String dia) {
		dia=dia.toLowerCase();
		for(int i=0; i<dias.length; ) {
			if(dia.equals(dias[i])) {
				if(i<5) {
					return "es lectivo";
				}else {
					return"no es lectivo";
				}
			}
			
		}
		return  "no es dia de la semana";
	
	}

}
