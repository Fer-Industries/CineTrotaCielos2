package mx.com.cinema.model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mx.com.cinema.entities.FormatosBean;
import mx.com.cinema.entities.SucursalBean;

public class CatalogosCrud {
	ConnectionDB conexion;
	Connection con;
	CallableStatement ctmt;
	ResultSet rs;
	
	public List<SucursalBean> getSurcursales() {
		List<SucursalBean> listaSucursales = new ArrayList<SucursalBean>();
		
		ConnectionDB conexion = new ConnectionDB();
		con = conexion.getConexion();
		String procSucursales = "{call surcursalesActivas}";
		try {
			ctmt = con.prepareCall(procSucursales);
			rs = ctmt.executeQuery();
			
			while(rs.next()) {
				SucursalBean sucursal = new SucursalBean();
				sucursal.setIdSucursal(rs.getInt("id"));
				sucursal.setNombre(rs.getString("name"));
				listaSucursales.add(sucursal);
			}
			con.close();
		}catch(SQLException sqle) {
			System.out.println(sqle.getMessage());
		}
		return listaSucursales;
	}
	
	public List<FormatosBean> getFormatos() {
		List<FormatosBean> listaFormatos = new ArrayList<FormatosBean>();
		
		ConnectionDB conexion = new ConnectionDB();
		con = conexion.getConexion();
		String procFormatos = "{call formatosActivos}";
		try {
			ctmt = con.prepareCall(procFormatos);
			rs = ctmt.executeQuery();
			while(rs.next()) {
				FormatosBean formato = new FormatosBean();
				formato.setIdFormato(rs.getInt("id"));
				formato.setNombreFormato(rs.getString("name"));
				listaFormatos.add(formato);
			}
			con.close();
		}catch(SQLException sqle) {
			System.out.println(sqle.getMessage());
		}
		return listaFormatos;
	}
}
