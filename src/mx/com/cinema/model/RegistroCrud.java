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

import mx.com.cinema.entities.RegistroBean;
import mx.com.cinema.entities.UsuarioBean;
import mx.com.cinema.model.ConnectionDB;


public class RegistroCrud {
	
	ConnectionDB conexionAWS;
	Connection con;
	CallableStatement ctmt;
	ResultSet rs;

	
	public RegistroCrud () {
		conexionAWS = new ConnectionDB();
		con  = conexionAWS.getConexion();
	}
	
	public void guardarUsuario(UsuarioBean usuarioNuevo){
		String insertarUsuario ="{call InsertarUsuario(?,?,?,?,?,?)}";
		try{
			CallableStatement ctmt = con.prepareCall(insertarUsuario);
			ctmt.setString(1,usuarioNuevo.getNombre());
			int registroIngresado = ctmt.executeUpdate();
			if(registroIngresado > 0){
				System.out.println("Se insertaron " + registroIngresado + " registros correctamente");
			}else{
				System.out.println("No se insertaron correctamente");
			}
		}catch(SQLException sqle){
			System.out.println("Error de SQL "+ sqle.getMessage());
		}
	}
}