package mx.com.cinema.model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import mx.com.cinema.entities.EmpleadoBean;

public class EmpleadoCrud {
	Connection con;
	ConnectionDB conAWS;
	CallableStatement ctmt; // ejecutar procs
	PreparedStatement ptmt;
	ResultSet rs;
	
	public EmpleadoBean validar(EmpleadoBean empleadoLogin) {
		conAWS = new ConnectionDB();
		con = conAWS.getConexion();
		String queryValidar = "select * from Empleados where name=? and contraseña=? ; ";
		
		try {
			ptmt = con.prepareStatement(queryValidar);
			ptmt.setString(1, empleadoLogin.getNombre());
			ptmt.setString(2, empleadoLogin.getContrasena());
			
			rs = ptmt.executeQuery();
			if(rs.next()) {
				empleadoLogin.setIdEmpleado(rs.getInt("idEmpleado"));
				empleadoLogin.setNombre(rs.getString("nombre"));
				empleadoLogin.setaPaterno(rs.getString("aPaterno"));
				
			}
			con.close();
		}catch(SQLException sqle) {
			System.out.println("Error SQL" + sqle.getMessage());
		}
		return empleadoLogin;
	}

}
