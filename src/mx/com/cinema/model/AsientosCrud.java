package mx.com.cinema.model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mx.com.cinema.entities.FuncionesBean;
import mx.com.cinema.entities.SalaAsientoBean;




public class AsientosCrud {
	ConnectionDB conexion;
	Connection con;
	CallableStatement ctmt;
	ResultSet rs;
	

	public List<SalaAsientoBean> getAsientos(int idFuncion) {
		List<SalaAsientoBean> listaAsientos = new ArrayList<SalaAsientoBean>();
		ConnectionDB conexion = new ConnectionDB();
		con = conexion.getConexion();
		String procAsientos = "{call mostrarDispAsientos (?)}";
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
}
