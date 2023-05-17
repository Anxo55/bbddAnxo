import javax.swing.*;

import javax.swing.JOptionPane;
public class Principal {

	public static void main(String[] args) {
		String dia = JOptionPane.showInputDialog(
				   null,
				   "Introduzca día de la semana",
				   JOptionPane.QUESTION_MESSAGE);  
		dia=dia.toLowerCase();
		
		
		if(CompruebaDia.comprobarDiaSemana(dia)) {
			System.out.println("Día laborable");
		}else {
			System.out.println("Día festivo");
		}
		
		
		CompruebaDia cd=new CompruebaDia(dia);
		
		if(cd.comprobarDiaSemanaNS()) {
			System.out.println("Día laborable");
		}else {
			System.out.println("Día festivo");
		}
		
		System.out.println(cd.getDia());
		

	}

}

