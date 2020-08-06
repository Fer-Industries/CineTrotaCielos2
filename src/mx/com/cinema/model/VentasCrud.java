package mx.com.cinema.model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

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
		VentaBoletosBean infoVenta  = new VentaBoletosBean();
		
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
				infoVenta.setTipoBoleto(rs.getString("Formato"));
				subtotal = rs.getFloat("Precio");
			}
			subtotal = subtotal * parametrosVenta.getNumeroAsientos();
			infoVenta.setSubtotal(subtotal);
			cmt = con.prepareCall(procPromocion);
			cmt.setInt(1, parametrosVenta.getDia());
			rs = cmt.executeQuery();
			if(rs.next()) {
				infoVenta.setNombreDescuento(rs.getString("Nombre"));
				total = rs.getFloat("Descuento");
				descuentoo = Math.round(total*100) + "%"; 
				infoVenta.setDescuento(descuentoo);
				total = subtotal - ( total * subtotal);
				infoVenta.setTotal(total);
			}			
			else {
				total = subtotal;
				infoVenta.setTotal(total);
			}
			infoVenta.setNumeroAsientos(parametrosVenta.getNumeroAsientos());
			con.close();
		}catch(SQLException sqle) {
			System.out.println(sqle.getMessage());
		}
		System.out.println(infoVenta);
		return infoVenta;
	}
	public int generarTicket(VentaBoletosBean parametrosVenta){
		//falta id tarjeta
		//obtener la atrjeta de la sesion 
		UsuarioBean usuario = new UsuarioBean();
		
		String obtenerTicket ="{call ventaTicket(?, ? , ?)}";
		String insertarAsientos="{call InsertarAsiento(? , ?, ?)}";
		try {
			con = conexion.getConexion();
			cmt = con.prepareCall(obtenerTicket);
			cmt.setInt(1,parametrosVenta.getIdFuncion());
			cmt.setDouble(2, usuario.getIdTarjeta());
			cmt.setFloat(3, parametrosVenta.getTotal());
			rs = cmt.executeQuery();
			if(rs.next()) {
				parametrosVenta.setTicket(rs.getInt("idVenta"));
				cmt = con.prepareCall(insertarAsientos);
				cmt.setInt(1, parametrosVenta.getTicket());
				cmt.setDouble(3, usuario.getIdTarjeta());
				for(int x: parametrosVenta.getArregloAsientos()) {
					cmt.setInt(2, x);
					rs = cmt.executeQuery();
					if(rs.next()) {
						//obtenemos la salida 
					}else {
						System.out.println("Ocurrio un problema en el rs de InsertarAsiento");
					}	
				}
				for(int i = 0;i< parametrosVenta.getArregloAsientos().length ;i++ ) {
					cmt.setInt(2, parametrosVenta.getArregloAsientos()[i]);
					rs = cmt.executeQuery();
					if(rs.next()) {
						//obtenemos la salida 
					}else {
						System.out.println("Ocurrio un problema en el rs de InsertarAsiento");
					}
				}
				/*for(SalaAsientoBean asiento: parametrosVenta.getIdAsientos()) {
					cmt.setInt(2, asiento.getIdAsiento());
					rs = cmt.executeQuery();
				}*/
			}else {
				System.out.println("Ocurrio un problema en el rs de ventaTicket");
			}
			con.close();
		}catch(SQLException sql) {
			System.out.println(sql.getMessage());
		}
		return 1;
	}
	/*public int generarTicket(int idFuncion,int idTarjeta,List<SalaAsientoBean> asientos) {
		float total = 0;
		String procAsientos = "{call costo(? ?)}";
		String ticket ="{call generarTicket( ? ? ? ? )}";
		String rel_ventas_ticket ="{call llenarRel(? ?)}";
		try {
			con = conexion.getConexion();
			for(SalaAsientoBean asiento :asientos){	
				cmt = con.prepareCall(procAsientos);
				cmt.setInt(1,asiento.getIdAsiento());
				cmt.setInt(2,idFuncion);
				rs = cmt.executeQuery();
				while(rs.next()) {
					total = total + rs.getFloat("Precio");
				}
			}
			Date myDate = new Date();
			//Aquí obtienes el formato que deseas
 		    String hoy = new SimpleDateFormat("yyyy/M/dd").format(myDate);
 		    System.out.println("la fecha es :"+ hoy);
			
			cmt = con.prepareCall(ticket);
			cmt.setInt(1,idFuncion);
			cmt.setInt(2,idTarjeta);
			cmt.setString(3, hoy);
			cmt.setFloat(4, total);
			rs = cmt.executeQuery();
			while(rs.next()) {
				total = total + rs.getFloat("IDVenta");
			}
			
			for(SalaAsientoBean asiento :asientos){	
				cmt = con.prepareCall(procAsientos);
				cmt.setInt(1,asiento.getIdAsiento());
				cmt.setInt(2,idFuncion);
				rs = cmt.executeQuery();
				while(rs.next()) {
					
				}
			}
			
			
		con.close();	
		}catch(SQLException sqle) {
			System.out.println("Error desde VentasCrud "+sqle.getMessage());
		}
		
		
		return 1;
		
	}
	
	*/
}
