import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.swing.JFileChooser;
public class Principal {

	public static void main(String[] args) {
        try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        Connection con;
        
        String cadena="jdbc:mysql://";
        String servidor="localhost";
        String puerto="3306";
        String bd="northwind";
        String usuario="root";
        String password="";
        cadena+=servidor+":"+puerto+"/"+bd;
        
        try {
			con=DriverManager.getConnection(cadena,usuario,password);
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("SELECT CompanyName From customers");
			File fichero; 
			JFileChooser fileChooser = new JFileChooser();
			int seleccion = fileChooser.showSaveDialog(null);
			if (seleccion == JFileChooser.APPROVE_OPTION)
			{
			   fichero = fileChooser.getSelectedFile();
			   FileWriter fw = null;
			   
				try {
					
					fw = new FileWriter(fichero);
					PrintWriter pw = new PrintWriter(fw);
					while(rs.next()) {
						pw.println(rs.getString(1));
					}
					

				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					try {
						fw.close();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			   
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}