package mx.com.cinema.model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import mx.com.cinema.entities.SalaAsientoBean;
import mx.com.cinema.entities.VentaBoletosBean;
import mx.com.cinema.model.ConnectionDB;

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
		String textoProcedure = "select FOR_nombre as Formato, FOR_precio as Precio  from formatos \r\n" + 
				"inner join funciones on FUN_idformato = FOR_idformato  where FUN_idfuncion = "+ parametrosVenta.getIdFuncion() +"";
		String procPromocion = "select PRO_nombre as Nombre ,PRO_descuento as Descuento from promociones";
		float subtotal = 1;
		float total = 1;
		String descuentoo;
		try {
			con = conexion.getConexion();
			cmt = con.prepareCall(textoProcedure);
			rs = cmt.executeQuery();
			while(rs.next()) {
				infoVenta.setTipoBoleto(rs.getString("Formato"));
				subtotal = rs.getFloat("Precio");
			}
			subtotal = subtotal * parametrosVenta.getNumeroAsientos();
			infoVenta.setSubtotal(subtotal);
			if(parametrosVenta.getDia() == 3) {
				cmt = con.prepareCall(procPromocion);
				rs = cmt.executeQuery();
				while(rs.next()) {
					infoVenta.setNombreDescuento(rs.getString("Nombre"));
					total = rs.getFloat("Descuento");
				}
				descuentoo = Math.round(total*100) + "% "; 
				infoVenta.setDescuento(descuentoo);
				total = subtotal - ( total * subtotal);
				infoVenta.setTotal(total);
				
			}else {
				 total = subtotal;
				 infoVenta.setTotal(total);
			}
			infoVenta.setNumeroAsientos(parametrosVenta.getNumeroAsientos());
		}catch(SQLException sqle) {
			System.out.println(sqle.getMessage());
		}
		System.out.println(infoVenta);
		return infoVenta;
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
