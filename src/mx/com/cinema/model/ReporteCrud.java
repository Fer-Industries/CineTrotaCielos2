package mx.com.cinema.model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.joda.time.DateTime;

import mx.com.cinema.entities.InfoReporte;

public class ReporteCrud {
	Connection con;
	ConnectionDB conAws;
	CallableStatement ctmt;
	ResultSet rs;
	
	public List<InfoReporte> reporteVentasCincoDias(int idEmpleado) {
		List<InfoReporte> infoEncontrada = new ArrayList<InfoReporte>();
		conAws = new ConnectionDB();
		con = conAws.getConexion();
		String procReporte = "{ call p_reporte_empleado(?,?)}";
		try{
			for(int i = 0; i< 6;i++) {
				InfoReporte info = new InfoReporte();
				DateTime dateTime = new DateTime();
				String fechaActual = dateTime.minusDays(i).toString().substring(0, 10);
				ctmt = con.prepareCall(procReporte);
				ctmt.setInt(1, idEmpleado);
				ctmt.setString(2, fechaActual);
				rs = ctmt.executeQuery();
				if(rs.next()) {
					info.setFecha(fechaActual);
					info.setNumeroVentas(rs.getInt("ventas"));
				}
				infoEncontrada.add(info);
			}
		}catch(SQLException sqle) {
			System.out.println("ERROR REPORTE VENTAS "+ sqle.getMessage());
		}finally {
			try {
				con.close();
			}catch(SQLException sqle) {
				System.out.println("ERROR CERRAR CONEXION REPORTE VENTAS "+ sqle.getMessage());
			}
		}
		return infoEncontrada;
	}
}
