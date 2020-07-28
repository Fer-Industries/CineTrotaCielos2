package mx.com.cinema.model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import mx.com.cinema.entities.FuncionesBean;



public class AsientosCrud {
	ConnectionDB conexion;
	Connection con;
	CallableStatement ctmt;
	ResultSet rs;
	
	public int mostrardispAsiento(FuncionesBean sala) {
		int mensaje = 0;
		String dispAsiento = "{call mostrarDispAsientos (?)}";
		
		ConnectionDB conexion = new ConnectionDB();
		con = conexion.getConexion();
		try{
			CallableStatement ctmt = con.prepareCall(dispAsiento);
			ctmt.setInt(1,sala.getIdFormato());
			rs = ctmt.executeQuery();
			rs.next();
			mensaje = rs.getInt("disponible");
			/*
			 * mensaje = 1 El asiento esta disponible
			 * mensaje = 2 El asiento está ocupado
			 */
			con.close();
		}catch(SQLException sqle){
			System.out.println("Error de SQL "+ sqle.getMessage());
		}
		return mensaje;
	}
	
}
