import java.util.Scanner;
import java.sql.*;

public class Principal {

	public static void main(String[] args) {
		String servidor="localhost";
		int puerto=3306;
		String user="root";
		String password="";
		String bd="Sakila";		
		Conexion conexion=new Conexion(servidor,puerto,user,password,bd);

		
		try {
			Statement s=conexion.getConexion().createStatement();
			s.execute("USE "+bd);
			ResultSet rs=s.executeQuery("SELECT * FROM film");
			
			ResultSetMetaData rsmd=rs.getMetaData();
			int numRegistros=0;
			while(rs.next()) {
				numRegistros++;
			}
			
			for (int i=1;i<=rsmd.getColumnCount();i++) {
				System.out.println("COLUMNA "+i+" "+rsmd.getColumnName(i));
			}
			
			System.out.println("HAY "+numRegistros+" películas.");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
	}

}
