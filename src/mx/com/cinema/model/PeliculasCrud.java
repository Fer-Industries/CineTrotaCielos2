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

import mx.com.cinema.model.ConnectionDB;
import mx.com.cinema.entities.PeliculasBean;
import mx.com.cinema.entities.BusquedaPeliculaBean;
import mx.com.cinema.entities.FormatosBean;


import java.util.Date;


public class PeliculasCrud {
	
	ConnectionDB conexion;
	Connection con;
	CallableStatement ctmt;
	ResultSet rs;

	public PeliculasCrud() {
		
	}
	public List<PeliculasBean> getPeliculas(){
		List<PeliculasBean> peliculas = new ArrayList<PeliculasBean>();
		
		conexion = new ConnectionDB();
		con = conexion.getConexion();
		String query= "{call cat_peliculas}";
		try {
			ctmt = con.prepareCall(query);
			rs= ctmt.executeQuery();
			while(rs.next()) {
				PeliculasBean pelicula = new PeliculasBean();
				pelicula.setIdPelicula(rs.getInt("ID"));
				pelicula.setDuracionPelicula(rs.getString("Duracion"));
				/*Date fechaf= new Date();
				fechaf =  rs.getDate("Estreno");
				
				fechaf.setDate( fechaf.getDate()+1);
				fechaf.setMonth( fechaf.getMonth()+1);
				
				
				System.out.println(fechaf); */
			    pelicula.setFechaEstreno(rs.getString("Estreno"));
			    //System.out.println("lo que recibo"+ rs.getDate("Estreno"));
				pelicula.setClasificacionPeliculas(rs.getString("Clasificacion"));
				pelicula.setNombrePelicula(rs.getString("Nombre"));
				pelicula.setImagenPelicula(rs.getString("Imagen"));
				peliculas.add(pelicula);
			}
			con.close();
		}catch(SQLException sqle) {
			System.out.println("Error en metodo get Peliculas en el crud"+sqle.getMessage());	
		}
		return peliculas;
	}
	
	public int eleminarPelicula(int id) {
		String query= "{call P_BAJA_PELICULA(?)}";
		conexion = new ConnectionDB();
		con = conexion.getConexion();
		int bandera = 0;
		try {
			ctmt = con.prepareCall(query);
			ctmt.setInt(1, id);
			if(ctmt.executeUpdate() > 0)
				bandera = 1;
		con.close();
		}catch(SQLException sqle){
			System.out.println(sqle.getMessage());
		}
		
		return bandera;
	}
	
	public int agregarPelicula(PeliculasBean pelicula){
		String llamarproc= "{call P_ALTA_PELICULA( ?, ?, ?, ?, ? )}";
		System.out.println(pelicula);
		conexion = new ConnectionDB();
		con = conexion.getConexion();
		int bandera =0;
		try {
			ctmt = con.prepareCall(llamarproc);
			System.out.println("nombre peli: "+pelicula.getNombrePelicula());
			ctmt.setString(1, pelicula.getNombrePelicula());
			ctmt.setString(2,pelicula.getClasificacionPeliculas());
			ctmt.setString(3,pelicula.getDuracionPelicula());
			ctmt.setString(4, pelicula.getFechaEstreno());
			ctmt.setString(5, pelicula.getImagenPelicula());
			
			System.out.println(rs);
			if(ctmt.executeUpdate() >0) {
				bandera =+1;
			}
			con.close();
		}catch(SQLException sql) {
			System.out.println("soy el error en agregar peliculas"+ sql);
		}
		return bandera;
	}
	public List<PeliculasBean> getPeliculasEstreno(){
		conexion= new ConnectionDB();
		con  = conexion.getConexion();
		String getPelEstreno = "{call P_PELICULAS_ESTRENO}";
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
				peliculaEncontrada.setFechaEstreno( rs.getString("PEL_fechaestreno"));
				peliculaEncontrada.setImagenPelicula(rs.getString("PEL_imagen"));
				listaPeliculas.add(peliculaEncontrada);			
			}
			con.close();
		}catch (SQLException sqle){
			System.out.println(sqle.getMessage());
		}
			return listaPeliculas;
		}
				
	public List<BusquedaPeliculaBean> busqueda (BusquedaPeliculaBean parametrosPel ){
		conexion= new ConnectionDB();
		con  = conexion.getConexion();
		System.out.println(parametrosPel);
		
		List<BusquedaPeliculaBean> listaEncontrado = new ArrayList <BusquedaPeliculaBean>();
		String generandoConsulta = 
				"select PEL_IMAGEN as Imagen,f.FUN_idfuncion as Funcion, PEL_Nombre as Nombre ,  f.FUN_Hora as Hora, f.FUN_dia as Dia, fo.FOR_nombre as Formato, s.SUC_nombre as Sucursal,\r\n" + 
				"i.IDI_nombre as Idioma\r\n" + 
				" from peliculas as p  \r\n" + 	
				"inner join funciones as f on  p.PEL_idpelicula = f.FUN_idpelicula \r\n" + 
				"inner join formatos as fo on fo.FOR_idformato = f.FUN_idformato\r\n" + 
				"inner join sucursal as s on f.FUN_idsucursal = s.SUC_idsucursal\r\n" + 
				"inner join idiomas as i on i.IDI_id = f.FUN_ididioma where f.FUN_dia >= curdate()";
		
        try {
	        int bandera    = 1,
	        	idPelicula = 0,
	        	idSucursal = 0, 
	        	idFormato  = 0, 
	        	idIdioma   = 0;	        
	        if(parametrosPel.getIdFormato() > 0){
	            generandoConsulta = generandoConsulta + " and FOR_idformato = ?";
	            idFormato = bandera;
	            bandera++;
	        }
	        if(parametrosPel.getIdSucursal() > 0 ){
	            generandoConsulta = generandoConsulta + " and s.SUC_idsucursal = ?";           
	            idSucursal = bandera;
	            bandera++;
	        }
	        if(parametrosPel.getIdPelicula() > 0 ){
	            generandoConsulta = generandoConsulta + " and p.PEL_idpelicula = ?";           
	            idPelicula = bandera;
	            bandera++;
	        }
	        if(parametrosPel.getIdIdioma() > 0 ){
	            generandoConsulta = generandoConsulta + " and  i.IDI_id = ?";           
	            idIdioma = bandera;
	            bandera++;
	        }
	        generandoConsulta = generandoConsulta + " and f.FUN_dia = ?";
	        generandoConsulta = generandoConsulta + " and f.FUN_Hora between ? and ?";
	        
	        Date myDate = new Date();
			//Aquí obtienes el formato que deseas
 		    String hoy = new SimpleDateFormat("yyyy/M/dd").format(myDate);
 		    System.out.println("la fecha es :"+ hoy);
 		   System.out.println("la fecha es :"+ parametrosPel.getDiaFuncion());
			if(parametrosPel.getDiaFuncion().equals(hoy)) { // comparamos el dia deseado con el día de hoy
			  	generandoConsulta = generandoConsulta + "and f.FUN_Hora >= now()";
			}
	        
	        PreparedStatement ptmt = con.prepareStatement(generandoConsulta);
	        if(idPelicula >0) {
	        	ptmt.setInt(idPelicula, parametrosPel.getIdPelicula());
	        }
	        if(idSucursal >0) {
	        	ptmt.setInt(idSucursal, parametrosPel.getIdSucursal());
	        }
	        if(idFormato > 0) {
	        	ptmt.setInt(idFormato, parametrosPel.getIdFormato());
	        }
	        if(idIdioma > 0) {
	        	ptmt.setInt(idIdioma, parametrosPel.getIdIdioma());	
	        }
	        
	        /*SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
	        Date parsed = format.parse(parametrosPel.getDiaFuncion());
	        java.sql.Date Dsql = new java.sql.Date(parsed.getTime()); */
	        
	        ptmt.setString(bandera, parametrosPel.getDiaFuncion());
	        bandera++; 
	        ptmt.setString(bandera, parametrosPel.getHoraInicio());
	        bandera++; 
	        ptmt.setString(bandera, parametrosPel.getHoraFinal());
	        bandera++;
	        /*DateFormat formateando = new SimpleDateFormat("HH:mm:ss");
	        java.sql.Time horafinal= new java.sql.Time(formateando.parse(parametrosPel.getHorafinal()).getTime());
	        ptmt.setTime(bandera, horafinal);
	        bandera++; */
	       
	        rs = ptmt.executeQuery();
	        
	        while(rs.next()) {
				BusquedaPeliculaBean found = new BusquedaPeliculaBean();
				
				found.setImagen(rs.getString("Imagen"));
				
				found.setNombrePel(rs.getString("Nombre"));
				
				//found.setHoraFuncion(rs.getTime("Hora").toString());
				found.setHoraFuncion(rs.getString("Hora"));
				
				found.setDiaFuncion(rs.getString("Dia"));
				
				found.setNombreFormato(rs.getNString("Formato"));
				
				found.setNombreSuc(rs.getString("Sucursal"));
				
				found.setNombreIdioma(rs.getString("Idioma"));
				
				found.setIdFuncion(rs.getInt("Funcion"));
				
				listaEncontrado.add(found);
			}
			con.close();
        }catch(SQLException sqle){
        	System.out.println(sqle.getMessage() + "chechar peliculas crud metodo Busqueda");
        }/*catch(ParseException pe){
        	System.out.println(pe.getMessage() + "checate la conversion");
        } */
        System.out.println(listaEncontrado);
        return listaEncontrado;
		
	}	
	
}
