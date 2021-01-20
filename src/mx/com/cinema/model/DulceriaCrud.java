package mx.com.cinema.model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Arrays;

import mx.com.cinema.entities.InfoCarrito;

public class DulceriaCrud {
	Connection con;
	ConnectionDB conAWS;
	CallableStatement ctmt; 
	PreparedStatement ptmt;
	ResultSet rs;
	
	public int realizarVenta(InfoCarrito[] productos, Long idUser) {
		int total = 0;
		int idTicketVenta = 0;
		for(InfoCarrito producto: productos) {
			String id = producto.getId();
			total = total + producto.getTotal();
			System.out.println(id.substring(0, 1));
		}
		System.out.println(total);
		String ventaDul ="{call p_venta_dulceria(?, ?)}";
		conAWS = new ConnectionDB();
		con = conAWS.getConexion();
		try {
			ctmt = con.prepareCall(ventaDul);
			ctmt.setInt(1, total);
			ctmt.setDouble(2, idUser);
			rs = ctmt.executeQuery();
			if(rs.next()) {
				idTicketVenta = rs.getInt("id_ticket");
				for(InfoCarrito producto: productos) {//refresco
					String idProducto = producto.getId().substring(0, 1);
					if(idProducto.equals("C")) {
						while(producto.getCantidad() > 0) {
							relacionVentaCombo(idTicketVenta,producto.getId());
							producto.setCantidad(producto.getCantidad() - 1);
						}
					}else {
						while(producto.getCantidad() > 0) {
							relacionVentaProducto(idTicketVenta,producto.getId());
							producto.setCantidad(producto.getCantidad() - 1);
						}
					}
				}
			}else {
				idTicketVenta = -1;
			}
		}catch(SQLException sqle) {
			System.out.println(sqle.getMessage());
		}finally {
			try {
				con.close();
			}catch(SQLException sqle){
				System.out.println("Error al cerrar la conexión");
				System.out.println(sqle.getMessage());
			}
		}
		return idTicketVenta;
	}
	
	public void relacionVentaCombo(int idVenta, String idCombo) {
		String insertVentaCombo = "insert into rel_venta_combo values(?,?)";
		try {
			ptmt = con.prepareStatement(insertVentaCombo);
			ptmt.setString(1, idCombo);
			ptmt.setInt(2, idVenta);
			int registroInsertado = ptmt.executeUpdate();
			System.out.println("Combo insertado con venta " + registroInsertado );
		}catch(SQLException sqle) {
			System.out.println(sqle.getMessage());
		}
	}
	
	public void relacionVentaProducto(int idVenta, String idProducto) {
		String insertVentaProducto = "insert into rel_venta_producto values(?,?)";
		try {
			ptmt = con.prepareStatement(insertVentaProducto);
			ptmt.setInt(1, Integer.parseInt(idProducto));
			ptmt.setInt(2, idVenta);
			int registroInsertado = ptmt.executeUpdate();
			System.out.println("Producto insertado con venta " + registroInsertado );
		}catch(SQLException sqle) {
			System.out.println(sqle.getMessage());
		}
	}
	
	public List<String> productosVentas(int idVenta) {
		String procComboProducto = "{call p_productos_combo_venta(?)}";
		String procProducto = "{call P_Productos_venta(?)}";
		List<String> productosAEntregar = new ArrayList<String>();
		conAWS = new ConnectionDB();
		con = conAWS.getConexion();
		try {
			ctmt = con.prepareCall(procComboProducto);
			ctmt.setInt(1, idVenta);
			rs = ctmt.executeQuery();
			while(rs.next()) {
				productosAEntregar.add(rs.getString("nombre"));
			}
			ctmt = con.prepareCall(procProducto);
			ctmt.setInt(1, idVenta);
			
			rs = ctmt.executeQuery();
			while(rs.next()) {
				productosAEntregar.add(rs.getString("nombre"));
			}
		}catch(SQLException sqle) {
			System.out.println(sqle.getMessage());
		}finally {
			try {
				con.close();
			}catch(SQLException sqle){
				System.out.println("Problemas para cerrar la conexión");
				System.out.println(sqle.getMessage());
			}
		}
		return productosAEntregar;
	}
	
	public int ordenEntregada(int idVenta) {
		String procActualizarOrden = "{call P_orden_entregada(?)}";
		int registroAfectado= 0;
		conAWS = new ConnectionDB();
		con = conAWS.getConexion();
		try {
			ctmt = con.prepareCall(procActualizarOrden);
			ctmt.setInt(1, idVenta);
			registroAfectado = ctmt.executeUpdate();
		}catch(SQLException sqle) {
			System.out.println(sqle.getMessage());
		}finally {
			try {
				con.close();
			}catch(SQLException sqle){
				System.out.println("Problemas para cerrar la conexión");
				System.out.println(sqle.getMessage());
			}
		}
		return registroAfectado;
	}
	/*jimmy*/
	private static long convertirToLong(String strNum) {
	    long valor;
	    try {
	        valor = Long.parseLong(strNum);
	    } catch (NumberFormatException | NullPointerException nfe) {
	        return 0; //Valor default en caso de no poder convertir  a Long
	    }
	    return valor;
	}
	
	public int realizarVentaEmpleado(InfoCarrito[] productos, int idEmpleado, String idCliente) {
		float total = 0;
		int idTicketVenta = 0;
		for(InfoCarrito producto: productos) {
			String id = producto.getId();
			total = total + producto.getTotal();
			System.out.println(id.substring(0, 1));
		}
		System.out.println(total);
		String ventaDul ="{call p_venta_empleado(?, ?, ?)}";
		conAWS = new ConnectionDB();
		con = conAWS.getConexion();
		try {
			ctmt = con.prepareCall(ventaDul);
			ctmt.setFloat(1, total);
			ctmt.setInt(2, idEmpleado);
			ctmt.setDouble(3, convertirToLong(idCliente));
			rs = ctmt.executeQuery();
			if(rs.next()) {
				idTicketVenta = rs.getInt("id_ticket");
				for(InfoCarrito producto: productos) {
					String idProducto = producto.getId().substring(0, 1);
					if(idProducto.equals("C")) {
						while(producto.getCantidad() > 0) {
							relacionVentaCombo(idTicketVenta,producto.getId());
							producto.setCantidad(producto.getCantidad() - 1);
						}
					}else {
						while(producto.getCantidad() > 0) {
							relacionVentaProducto(idTicketVenta,producto.getId());
							producto.setCantidad(producto.getCantidad() - 1);
						}
					}
				}
			}else {
				idTicketVenta = -1;
			}
		}catch(SQLException sqle) {
			System.out.println(sqle.getMessage());
		}finally {
			try {
				con.close();
			}catch(SQLException sqle){
				System.out.println("Error al cerrar la conexión");
				System.out.println(sqle.getMessage());
			}
		}
		return idTicketVenta;
	}
}
