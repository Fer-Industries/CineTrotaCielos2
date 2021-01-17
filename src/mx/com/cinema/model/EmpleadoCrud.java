package mx.com.cinema.model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
		String queryValidar = "{call Login_emp(?,?)} ";
		try {
			ptmt = con.prepareStatement(queryValidar);
			System.out.println(empleadoLogin.getIdEmpleado());
			ptmt.setInt(1, Integer.parseInt(empleadoLogin.getIdEmpleado()));
			ptmt.setString(2, empleadoLogin.getContrasena());
			rs = ptmt.executeQuery();
			if(rs.next()) {
				empleadoLogin.setIdEmpleado(Integer.toString(rs.getInt("EMP_idempleado")));
				empleadoLogin.setNombre(rs.getString("EMP_nombre"));
				empleadoLogin.setaPaterno(rs.getString("EMP_ap"));
			}
			System.out.println(empleadoLogin.toString());
			con.close();
		}catch(SQLException sqle) {
			System.out.println("Error SQL" + sqle.getMessage());
		}
		return empleadoLogin;
	}
	
	public List<EmpleadoBean> getEmpleadosActivos(){
		List<EmpleadoBean> empleados = new ArrayList<EmpleadoBean>();
		conAWS = new ConnectionDB();
		con = conAWS.getConexion();
		String procEmpleados = "{ call P_EMPLEADOS}";
		try {
			ctmt = con.prepareCall(procEmpleados);
			rs = ctmt.executeQuery();
			while(rs.next()) {
				EmpleadoBean empleado = new EmpleadoBean();
				empleado.setId(rs.getInt("EMP_idempleado"));
				empleado.setNombre(rs.getString("EMP_nombre"));
				empleados.add(empleado);
			}
		}catch(SQLException sqle) {
			System.out.println("ERROR EMPLEADO ACTIVOS" + sqle.getMessage());
		}finally {
			try {
				con.close();
			}catch(SQLException sqle) {
				System.out.println("ERROR CERRAR DE CONEXION "+ sqle.getMessage());
			}
		}
		return empleados;
	}
}
