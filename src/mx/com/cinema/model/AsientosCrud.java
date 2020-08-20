package mx.com.cinema.model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mx.com.cinema.entities.SalaAsientoBean;

public class AsientosCrud {
	ConnectionDB conexion;
	Connection con;
	CallableStatement ctmt;
	ResultSet rs;
	
	public List<SalaAsientoBean> getAsientos(int idFuncion) {
		List<SalaAsientoBean> listaAsientos = new ArrayList<SalaAsientoBean>();
		conexion = new ConnectionDB();
		con = conexion.getConexion();
		String procAsientos = "{call P_OBTENER_ASIENTOS (?)}";
		try {
			ctmt = con.prepareCall(procAsientos);
			ctmt.setInt(1, idFuncion);
			rs = ctmt.executeQuery();
			while
				(rs.next()) {
				SalaAsientoBean asiento = new SalaAsientoBean();
				asiento.setIdAsiento(rs.getInt("SAS_idasiento"));
				asiento.setAsiento(rs.getString("SAS_asiento"));
				asiento.setDisponibilidad(rs.getInt("RFA_disponible"));
				listaAsientos.add(asiento);
			}
			con.close();
		}catch(SQLException sqle) {
			System.out.println(sqle.getMessage());
		}
		return listaAsientos;
	}
	
	public int apartarLugares(int idFuncion, int [] idAsientos) {
		//validar que esten disponibles
		VentasCrud ventas = new VentasCrud();
		int disponible = ventas.validarAsientos(idAsientos, idFuncion);
		int filasActualizadas = 0;
		if(disponible > 0) { //algunos de los asientos ya esta ocupado
			return -1;
		}else {// caso contrario los apartamos
			conexion = new ConnectionDB();
			con = conexion.getConexion();
			String proc = "{call P_RESERVAR_LUGAR(?,?)}";
			try {
				for(int idAsiento: idAsientos) {
					ctmt = con.prepareCall(proc);
					ctmt.setInt(1,idFuncion);
					ctmt.setInt(2, idAsiento);
					filasActualizadas = ctmt.executeUpdate();
				}
			}catch(SQLException sqle) {
				System.out.println(sqle.getMessage());
			}finally {
				try {
					if(con != null) 
						con.close();
				}catch(SQLException sqle) {
					System.out.println(sqle.getMessage());
				}
			}
		return filasActualizadas;
		}	
	}
	
	public int desapartarLugares(int idFuncion, int [] idAsientos) {
		//validar que esten disponibles		
		int filasActualizadas = 0;
		conexion = new ConnectionDB();
		con = conexion.getConexion();
		String proc = "{call P_LIBERAR_LUGAR(?,?)}";
		try {
			for(int idAsiento: idAsientos) {
				ctmt = con.prepareCall(proc);
				ctmt.setInt(1,idFuncion);
				ctmt.setInt(2, idAsiento);
				filasActualizadas = ctmt.executeUpdate();
			}
		}catch(SQLException sqle) {
			System.out.println(sqle.getMessage());
		}finally {
			try {
				if(con != null) 
					con.close();
				if(ctmt != null)
					ctmt.close();
			}catch(SQLException sqle) {
				System.out.println(sqle.getMessage());
			}
		}
		return filasActualizadas;	
	}
	
}
