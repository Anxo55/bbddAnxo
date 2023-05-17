import java.sql.*;

public class Conexion {
	
	private Connection conexion;
	
	public Conexion(String server,int puerto,String user,String password,String bd) {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url="jdbc:mysql://"+server+":"+String.valueOf(puerto);
			conexion=DriverManager.getConnection(url,user,password);
			
		} catch (Exception e) {
			e.printStackTrace();
		
		}
	}
	
	public Connection getConexion() {
		return this.conexion;
	}
	
	

}