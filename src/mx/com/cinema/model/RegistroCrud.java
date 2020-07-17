package mx.com.cinema.model;
import java.sql.CallableStatement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Date;



import mx.com.cinema.entities.UsuarioBean;
import mx.com.cinema.model.ConnectionDB;


public class RegistroCrud {
	
	ConnectionDB conexionAWS;
	Connection con;
	CallableStatement ctmt;
	ResultSet rs;

	
	public RegistroCrud () {
		
	}
	
	public boolean checarId(long idTarjetaGenerado) {
		boolean existente = true;
		conexionAWS = new ConnectionDB();
		con  = conexionAWS.getConexion();
		try {
			String consultaId = "select * from Usuarios where USU_idtarjeta = ? ";
			PreparedStatement ptmt = con.prepareStatement(consultaId);
			ptmt.setLong(1, idTarjetaGenerado);
			rs = ptmt.executeQuery();
			if(rs.next()) {
				existente = true;
			}else {
				existente = false;
			}
			con.close();
		}catch(SQLException sqle) {
			System.out.println(sqle.getMessage());
		}
		return existente;
	}
	
	
	public int guardarUsuario(UsuarioBean usuarioNuevo){
		int mensaje = 0;
		conexionAWS = new ConnectionDB();
		con  = conexionAWS.getConexion();
		String insertarUsuario ="{call InsertarUsuario(?,?,?,?,?,?)}";
		try{
			CallableStatement ctmt = con.prepareCall(insertarUsuario);
			ctmt.setLong(1,usuarioNuevo.getIdTarjeta());
			ctmt.setString(2,usuarioNuevo.getNombre());
			ctmt.setString(3, usuarioNuevo.getaPaterno());
			ctmt.setString(4,usuarioNuevo.getaMaterno());
			ctmt.setString(5,usuarioNuevo.getBirthday());
			ctmt.setString(6, usuarioNuevo.getCorreo());
			ctmt.setString(7,usuarioNuevo.getContrasena());
			rs = ctmt.executeQuery();
			rs.next();
			mensaje = rs.getInt("alta");
			/*
			 * mensaje = 3 todo en orden
			 * mensaje = 2 que existe y esta activo
			 * mensaje = 1 existe y esta inactivo*/
			con.close();
		}catch(SQLException sqle){
			System.out.println("Error de SQL "+ sqle.getMessage());
		}
		return mensaje;
	}
}
