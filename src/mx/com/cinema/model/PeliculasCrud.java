package mx.com.cinema.model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.sql.Date;

import mx.com.cinema.model.ConnectionDB;
import mx.com.cinema.entities.PeliculasBean;
import mx.com.cinema.entities.BusquedaPelBean;
import mx.com.cinema.entities.BusquedaPeliculaBean;
import mx.com.cinema.entities.FormatosBean;




public class PeliculasCrud {
	
	ConnectionDB conexion;
	Connection con;
	CallableStatement ctmt;
	ResultSet rs;


	
	public PeliculasCrud() {
		conexion= new ConnectionDB();
		con  = conexion.getConexion();
	}
	
	public List<PeliculasBean> getPeliculasEstreno(){
		String getPelEstreno = "{call Pel_estreno}";
		List<PeliculasBean> listaPeliculas = new ArrayList <> ();
		
		try {
			ctmt= con.prepareCall(getPelEstreno);
			
			rs= ctmt.executeQuery();
			while(rs.next()) {
				PeliculasBean peliculaEncontrada = new PeliculasBean();
				peliculaEncontrada.setIdPelicula(rs.getInt("PEL_idpelicula"));
				peliculaEncontrada.setNombrePelicula(rs.getString("PEL_nombre"));
				peliculaEncontrada.setClasificacionPeliculas(rs.getString("PEL_clasificacion"));
				peliculaEncontrada.setDuracionPelicula(rs.getString("PEL_duracion"));
				peliculaEncontrada.setFechaEstreno(rs.getDate("PEL_fechaestreno"));
				peliculaEncontrada.setImagenPelicula(rs.getString("PEL_imagen"));
				listaPeliculas.add(peliculaEncontrada);
			
			}
			con.close();
		}catch (SQLException sqle){
			System.out.println(sqle.getMessage());
		}
			return listaPeliculas;
		}
	
	public List<BusquedaPeliculaBean> Busqueda(BusquedaPeliculaBean peliculas ){
	
		String getPeliculas = "{call mostrarPeli(?,?,?,?,?)}";
		
		List<BusquedaPeliculaBean> listaenontrado = new ArrayList <BusquedaPeliculaBean>();
		try {
			java.sql.Date sDate = new java.sql.Date(peliculas.getFecha().getTime());
			ctmt = con.prepareCall(getPeliculas);
			ctmt.setInt(1,peliculas.getIdpel());
			ctmt.setInt(2,peliculas.getIdidioma());
			ctmt.setInt(3,peliculas.getIdformato());
			ctmt.setInt(4,peliculas.getIdsucursal());
			ctmt.setDate(5,sDate);
			
			ctmt.set
			/*id del formato 
			 * 
			 * id del idioma 
			 * 
			 * */
		}catch(SQLException sqle) {
			System.out.println(sqle.getMessage());
		}
		
		
		
		
		
		
		
		List<PeliculasBean> listaPeliculas = new ArrayList <> ();
		
		try {
			java.sql.Date sDate = new java.sql.Date(peliculas.getFecha().getTime());
			ctmt= con.prepareCall(getPeliculas);
			ctmt.setString(1, peliculas.getNombre());
			ctmt.setString(2, peliculas.getHora());
			ctmt.setDate (3,  sDate );
			ctmt.setNString(4, peliculas.getFormato());
			ctmt.setNString(5, peliculas.getSucursal());
			
			rs= ctmt.executeQuery();
			
			while(rs.next()) {
				PeliculasBean peliculaEncontrada = new PeliculasBean();
				FormatosBean formatos = new FormatosBean();
				peliculaEncontrada.setNombrePelicula(rs.getString("nombre"));
				formatos.setNombreFormato(rs.getString("Formato"));
				peliculaEncontrada.setDuracionPelicula(rs.getString("Hora"));
				peliculaEncontrada.setFechaEstreno(rs.getDate("dia"));
				peliculaEncontrada.setImagenPelicula(rs.getString("PEL_IMAGEN"));
				listaPeliculas.add(peliculaEncontrada);
			
			}
			con.close();
		}catch (SQLException sqle){
			System.out.println(sqle.getMessage());
		}
			return listaPeliculas;
		}
	}
/*
public int generarOrden(OrdenBean orden) {
	String procOrden = "{call crearOrden(?,?,?)}";
	String procOrderDetails = "{call productosOrden(?,?,?)}";
	
	int idOrdenGenerado = 0;
	try {
		ctmt = con.prepareCall(procOrden);
		ctmt.setString(1, orden.getCustomer());
		ctmt.setString(2, orden.getFechaReq());
		ctmt.setInt(3, orden.getEmployeeId());
		rs = ctmt.executeQuery();
		if(rs.next()) {
			idOrdenGenerado = rs.getInt(1);
			System.out.println(idOrdenGenerado);
			ctmt = con.prepareCall(procOrderDetails);
			
			for(ProductoJson producto: orden.getProducts()) {
				ctmt.setInt(1,idOrdenGenerado);
				ctmt.setInt(2,producto.getId());
				ctmt.setInt(3, producto.getCantidad());
				ctmt.executeQuery();
			}
		}else {
			System.out.println("oppss");
		}
		con.close();
	}catch(SQLException sqle){
		System.out.println(sqle.getMessage());
	}
	return idOrdenGenerado;
}
*/