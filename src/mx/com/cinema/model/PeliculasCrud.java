package mx.com.cinema.model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
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
	
		String getPeliculas = "{call mostrarPeli(?,?,?,?,?,?)}";
		
		List<BusquedaPeliculaBean> listaencontrado = new ArrayList <BusquedaPeliculaBean>();
		try {
			java.sql.Date sDate = new java.sql.Date(peliculas.getFecha().getTime());
			DateFormat formatter = new SimpleDateFormat("HH:mm:ss");
			java.sql.Time timeValue = new java.sql.Time(formatter.parse(peliculas.getHora()).getTime());
			
			
			ctmt = con.prepareCall(getPeliculas);
			ctmt.setInt(1,peliculas.getIdpel());
			ctmt.setInt(2,peliculas.getIdidioma());
			ctmt.setInt(3,peliculas.getIdformato());
			ctmt.setInt(4,peliculas.getIdsucursal());
			ctmt.setDate(5,sDate);
			ctmt.setTime(6, timeValue );
			/*id del formato 
			 * 
			 * id del idioma 
			 * 
			 * */
			
			rs = ctmt.executeQuery();
			while(rs.next()) {
				BusquedaPeliculaBean found = new BusquedaPeliculaBean();
				found.setImagen(rs.getString("Imagen"));
				found.setIdpel(rs.getInt("IDpelicula"));
				found.setNombrePel(rs.getString("Pelicua"));
				found.setIdformato(rs.getInt("IDformato"));
				found.setNombreformato(rs.getNString("Formato"));
				found.setIdidioma(rs.getInt("IDidioma"));
				found.setNombreIdioma(rs.getString("Idioma"));
				found.setIdsucursal(rs.getInt("IDsucursal"));
				found.setNombreSuc(rs.getString("Sucursal"));
				found.setHora(rs.getTime("Hora").toString());
				listaencontrado.add(found);
			}
			con.close();
		}catch(SQLException sqle) {
			System.out.println(sqle.getMessage());
		}catch(ParseException pe) {
			System.out.println(pe.getMessage() + "La cagamos en la conversionn disculpa :c ia estaooooosss");
		}
		return listaencontrado;
	}	
	
}
