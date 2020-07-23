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
		System.out.println(peliculas);
		List<BusquedaPeliculaBean> listaencontrado = new ArrayList <BusquedaPeliculaBean>();
		String generandoConsulta = 
				"select PEL_IMAGEN as Imagen, PEL_Nombre as Nombre ,  f.FUN_Hora as Hora, f.FUN_dia as Dia, fo.FOR_nombre as Formato, s.SUC_nombre as Sucursal,\r\n" + 
				"i.IDI_nombre as Idioma\r\n" + 
				" from peliculas as p  \r\n" + 
				"inner join funciones as f on  p.PEL_idpelicula = f.FUN_idpelicula \r\n" + 
				"inner join formatos as fo on fo.FOR_idformato = f.FUN_idformato\r\n" + 
				"inner join sucursal as s on f.FUN_idsucursal = s.SUC_idsucursal\r\n" + 
				"inner join idiomas as i on i.IDI_id = f.FUN_ididioma where f.FUN_dia >= curdate() and f.FUN_Hora >= now()";
        try {
		PreparedStatement ptmt = con.prepareStatement(generandoConsulta);
        int bandera = 1;
        if(peliculas.getIdFormato() > 0){
            generandoConsulta = generandoConsulta + " and FOR_idformato = ?";
            ptmt.setInt(bandera, peliculas.getIdFormato());
            bandera++;
        }
        if(peliculas.getIdSucursal() > 0 ){
            generandoConsulta = generandoConsulta + " and s.SUC_idsucursal = ?";           
            ptmt.setInt(bandera, peliculas.getIdSucursal());
            bandera++;
        }
        if(peliculas.getIdPelicula() > 0 ){
            generandoConsulta = generandoConsulta + " and p.PEL_idpelicula = ?";           
            ptmt.setInt(bandera, peliculas.getIdPelicula());
            bandera++;
        }
        if(peliculas.getIdIdioma() > 0 ){
            generandoConsulta = generandoConsulta + " and  i.IDI_id = ?";           
            ptmt.setInt(bandera, peliculas.getIdIdioma());
            bandera++;
        }
        
        java.sql.Date sDate = new java.sql.Date(peliculas.getDiaFuncion().getTime());
        generandoConsulta = generandoConsulta + " and f.FUN_dia = ?";   
        ptmt.setDate(bandera, sDate);
        bandera++;
        
        
        generandoConsulta = generandoConsulta + " and f.FUN_Hora  >= ?";   
        DateFormat formatter = new SimpleDateFormat("HH:mm:ss");
        java.sql.Time timeValue = new java.sql.Time(formatter.parse(peliculas.getHoraFuncion()).getTime());
        ptmt.setTime(bandera, timeValue);
        bandera++;
        
        
        generandoConsulta = generandoConsulta + " and f.FUN_Hora  <= ?";   
        java.sql.Time horafinal= new java.sql.Time(formatter.parse(peliculas.getHorafinal()).getTime());
        ptmt.setTime(bandera, horafinal);
        bandera++;
        
        System.out.println(generandoConsulta);
        
        rs = ptmt.executeQuery();
        
        while(rs.next()) {
			BusquedaPeliculaBean found = new BusquedaPeliculaBean();
			
			found.setImagen(rs.getString("Imagen"));
			
			found.setNombrePel(rs.getString("Nombre"));
			
			found.setHoraFuncion(rs.getTime("Hora").toString());
			
			found.setDiaFuncion(rs.getDate("Dia"));
			
			found.setNombreformato(rs.getNString("Formato"));
			
			found.setNombreSuc(rs.getString("Sucursal"));
			
			found.setNombreIdioma(rs.getString("Idioma"));
			listaencontrado.add(found);
		}
		con.close();
        }catch(SQLException sqle) {
        	System.out.println(sqle.getMessage() + "chechar peliculas crud metodo Busqueda");
        }catch(ParseException pe) {
			System.out.println(pe.getMessage() + "La cagamos en la conversionn disculpa :c ia estaooooosss");
		} 
        
        System.out.println(generandoConsulta);
		
		
	/*	String getPeliculas = "{call mostrarPeli(?,?,?,?,?,?)}";
		
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
		} */
		return listaencontrado;
	}	
	
}
