package mx.com.cinema.model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import mx.com.cinema.entities.UsuarioBean;

public class UsuarioCrud {
	
	Connection con;
	ConnectionDB conAWS;
	CallableStatement ctmt; 
	PreparedStatement ptmt;
	ResultSet rs;
	
	public UsuarioBean validar(UsuarioBean usuarioLogin) {
		conAWS = new ConnectionDB();
		con = conAWS.getConexion();
		String proc = "call Login(??)";
		
		try {
			ptmt = con.prepareStatement(proc);
			ptmt.setString(1, usuarioLogin.getCorreo());
			ptmt.setString(2, usuarioLogin.getContrasena());
			
			rs = ptmt.executeQuery();
			if(rs.next()) {
				usuarioLogin.setIdTarjeta(rs.getInt("idTarjeta"));
				usuarioLogin.setNombre(rs.getString("nombre"));
				usuarioLogin.setaPaterno(rs.getString("aPaterno"));
				
			}
			con.close();
		}catch(SQLException sqle) {
			System.out.println("Error SQL" + sqle.getMessage());
		}
		return usuarioLogin;
	}

}
