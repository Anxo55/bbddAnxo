import java.sql.Connection;
import java.sql.Statement;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
public class Principal {

	public static void main(String[] args) {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("PETÓ");
		}
		Connection con;
		try {
			String url="jdbc:mysql://localhost:3306/";
			con = DriverManager.getConnection(url,"root","");
			
			Statement s=con.createStatement();
			s.execute("USE sakila");
			ResultSet rs=s.executeQuery("SELECT film_id, tittle  FROM film");
			
			int numPelis=0;
			
			while (rs.next()) {
				System.out.println(rs.getInt(1)+" "+rs.getString(2));
				numPelis++;
			}
			
			System.out.println("HAY"+numPelis+"en la tabla film");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		

	}

}
