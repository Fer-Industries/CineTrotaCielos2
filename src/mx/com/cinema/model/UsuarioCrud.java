package mx.com.cinema.model;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import mx.com.cinema.entities.UsuarioBean;

public class UsuarioCrud {
	
	Connection con;
	ConnectionDB conAWS;
	PreparedStatement ptmt;
	ResultSet rs;
	
	
	public UsuarioBean validar(UsuarioBean usuarioLogin) {
		conAWS = new ConnectionDB();
		con = conAWS.getConexion();
		String proc = "{call P_LOGIN(?,?)}";
		
		try {
			ptmt = con.prepareStatement(proc);
			ptmt.setString(1, usuarioLogin.getCorreo());
			ptmt.setString(2, usuarioLogin.getContrasena());
			
			rs = ptmt.executeQuery();
			if(rs.next()) {
				usuarioLogin.setIdTarjeta(rs.getLong("USU_idtarjeta"));
				usuarioLogin.setNombre(rs.getString("USU_nombre"));
				usuarioLogin.setaPaterno(rs.getString("USU_ap"));
				
			}else {
				usuarioLogin.setIdTarjeta(new Long(0));
			}
			con.close();
		}catch(SQLException sqle) {
			System.out.println("Error SQL" + sqle.getMessage());
		}
		System.out.println(usuarioLogin.toString());
		return usuarioLogin;
	}

}
