package mx.com.cinema.model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

public class FuncionesCrud {

	ConnectionDB conexion;
	Connection con;
	CallableStatement ctmt;
	ResultSet rs;
	
	public int getDispsala(int idFuncion) {
	int cupo = 0;
	conexion = new ConnectionDB();
	con = conexion.getConexion();
	String procDispsala = "{call disponible (?) }";
	try {
		
		ctmt = con.prepareCall(procDispsala);//preparas el procedure
		ctmt.setInt(1, idFuncion );// seteas el parametro que vas a enviar al proc
		rs =  ctmt.executeQuery();// ejecutaws el proc y el result set lo guardas en rs 
		
		
		if(rs.next()) { //iteras el resultset
			cupo = rs.getInt("Status");// obtienes del result set el valor de la columna "Cupo"
			
		}
		con.close();
	}catch(SQLException sqle) {
		System.out.println(sqle.getMessage());
	}
	return cupo;
}
}
