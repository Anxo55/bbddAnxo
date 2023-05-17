import java.util.Scanner;

public class Evaluadora {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("Dime dia de la semana: ");
		String dia = sc.nextLine();
		System.out.println(ComprobarDiaSemana.compruebaDia(dia));

	}

}
