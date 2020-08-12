package mx.com.cinema.model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import mx.com.cinema.controller.Usuario;
import mx.com.cinema.entities.UsuarioBean;
import mx.com.cinema.entities.VentaBoletosBean;


public class VentasCrud {

	Connection con;
	ConnectionDB conexion = new ConnectionDB();
	CallableStatement cmt;
	ResultSet rs;
	 
	
	/*parametros a recibir en servelet 
	 * 
	 * Bean 
	 * 
	 * idFuncion 
	 * numeroDeAsientos 
	 * dia de la semana 0 1 2 3 4 5 6  
	 * 
	 * 
	 * */

	public VentaBoletosBean getInfoVenta(VentaBoletosBean parametrosVenta){
		
		String textoProcedure = "{call  getFormatoPrecio( ? )}";
				/*"select FOR_nombre as Formato, FOR_precio as Precio  from formatos \r\n" + 
				"inner join funciones on FUN_idformato = FOR_idformato  where FUN_idfuncion = "+ parametrosVenta.getIdFuncion() +"";*/
		String procPromocion = "{call getPromo( ? )}";
				//"select PRO_nombre as Nombre ,PRO_descuento as Descuento from promociones";
		float subtotal = 1;
		float total = 1;
		String descuentoo;
		try {
			con = conexion.getConexion();
			cmt = con.prepareCall(textoProcedure);
			cmt.setInt(1, parametrosVenta.getIdFuncion());
			rs = cmt.executeQuery();
			while(rs.next()) {
				parametrosVenta.setTipoBoleto(rs.getString("Formato"));
				subtotal = rs.getFloat("Precio");
			}
			subtotal = subtotal * parametrosVenta.getNumeroAsientos();
			parametrosVenta.setSubtotal(subtotal);
			cmt = con.prepareCall(procPromocion);
			cmt.setInt(1, parametrosVenta.getDia());
			rs = cmt.executeQuery();

			if(rs.next()) {
				parametrosVenta.setNombreDescuento(rs.getString("Nombre"));
				total = rs.getFloat("Descuento");
				descuentoo = Math.round(total*100) + "%"; 
				parametrosVenta.setDescuento(descuentoo);
				total = subtotal - ( total * subtotal);
				parametrosVenta.setTotal(total);
			}			
			else {
			
				total = subtotal;
				parametrosVenta.setTotal(total);
			}
			//infoVenta.setNumeroAsientos(parametrosVenta.getNumeroAsientos());
			con.close();
		}catch(SQLException sqle) {
			System.out.println(sqle.getMessage());
		}
		System.out.println(parametrosVenta);
		return parametrosVenta;
	}
	
	
	public int generarTicket(VentaBoletosBean parametrosVenta,UsuarioBean usuarioLogin){		
		int respuesta = 0;
		String obtenerTicket ="{call ventaTicket(?, ? , ?)}";
		String insertarAsientos="{call ventasAsientos(? , ?, ?)}";
		try {
			con = conexion.getConexion();
			cmt = con.prepareCall(obtenerTicket);
			cmt.setInt(1,parametrosVenta.getIdFuncion());
			cmt.setDouble(2, usuarioLogin.getIdTarjeta());
			cmt.setFloat(3, parametrosVenta.getTotal());
			rs = cmt.executeQuery();
			if(rs.next()) {
				parametrosVenta.setTicket(rs.getInt("idVenta"));
				for(int x: parametrosVenta.getArregloAsientos()) {
					cmt = con.prepareCall(insertarAsientos);
					cmt.setInt(1, parametrosVenta.getTicket());
					cmt.setInt(2, x);
					cmt.setInt(3, parametrosVenta.getIdFuncion());
					rs = cmt.executeQuery();
					if(rs.next()) {
						 respuesta = rs.getInt("Status");
					}else {
						respuesta = -1;
					}	
				}
			}else {
				respuesta = -1;
			}
			con.close();
		}catch(SQLException sql) {
			System.out.println("Es problema con la BD" + sql.getMessage());
		}
		return respuesta;
	}
}
