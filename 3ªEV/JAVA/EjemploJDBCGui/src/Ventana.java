
import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.JLabel;
import javax.swing.JTextField;
import javax.swing.JPasswordField;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

public class Ventana extends JFrame {

	private JPanel contentPane;
	private JTextField textFieldServidor;
	private JTextField textFieldPuerto;
	private JTextField txtFieldUsuario;
	private JPasswordField passwordField;
	private JTextField txtFieldBD;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					Ventana frame = new Ventana();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the frame.
	 */
	public Ventana() {
		setTitle("CONEXIÓN");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 281, 358);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));

		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		JLabel lblNewLabel = new JLabel("Servidorrrrrrrr");
		lblNewLabel.setBounds(19, 55, 61, 16);
		contentPane.add(lblNewLabel);
		
		textFieldServidor = new JTextField();
		textFieldServidor.setText("localhost");
		textFieldServidor.setBounds(80, 50, 130, 26);
		contentPane.add(textFieldServidor);
		textFieldServidor.setColumns(10);
		
		textFieldPuerto = new JTextField();
		textFieldPuerto.setText("3306");
		textFieldPuerto.setBounds(80, 83, 130, 26);
		contentPane.add(textFieldPuerto);
		textFieldPuerto.setColumns(10);
		
		JLabel lblPuerto = new JLabel("Puerto");
		lblPuerto.setBounds(19, 88, 61, 16);
		contentPane.add(lblPuerto);
		
		JLabel lblUsuario = new JLabel("Usuario");
		lblUsuario.setBounds(19, 123, 61, 16);
		contentPane.add(lblUsuario);
		
		JLabel lblContrasea = new JLabel("Contraseña");
		lblContrasea.setBounds(19, 158, 61, 16);
		contentPane.add(lblContrasea);
		
		txtFieldUsuario = new JTextField();
		txtFieldUsuario.setBounds(80, 118, 130, 26);
		contentPane.add(txtFieldUsuario);
		txtFieldUsuario.setColumns(10);
		
		passwordField = new JPasswordField();
		passwordField.setBounds(80, 153, 130, 26);
		contentPane.add(passwordField);
		
		JButton btnConectar = new JButton("No tocar");
		btnConectar.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				String servidor=textFieldServidor.getText();
				String puerto=textFieldPuerto.getText();
				String user=txtFieldUsuario.getText();
				String pwd="";
				for(char a:passwordField.getPassword()) {
					pwd+=a;
				}
				String BD=txtFieldBD.getText();
				Conexion conexion=new Conexion(servidor,puerto,user,pwd);
				System.out.println("JA, te pillé");
			}
		});
		btnConectar.setBounds(93, 234, 117, 29);
		contentPane.add(btnConectar);
		
		JLabel lblBd = new JLabel("BD");
		lblBd.setBounds(19, 186, 61, 16);
		contentPane.add(lblBd);
		
		txtFieldBD = new JTextField();
		txtFieldBD.setText("sakila");
		txtFieldBD.setColumns(10);
		txtFieldBD.setBounds(80, 181, 130, 26);
		contentPane.add(txtFieldBD);
	}
}
