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
import mx.com.cinema.entities.BusquedaPelBean;
import mx.com.cinema.entities.BusquedaPeliculaBean;
import mx.com.cinema.entities.FormatosBean;


import java.util.Date;


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
				
	public List<BusquedaPeliculaBean> busqueda (BusquedaPeliculaBean parametrosPel ){
		System.out.println(parametrosPel);
		
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
        int bandera = 1;
        int idpelicula = 0;
        int idsucursal = 0;
        int idformato = 0;
        int ididioma = 0;
        
        if(parametrosPel.getIdFormato() > 0){
            generandoConsulta = generandoConsulta + " and FOR_idformato = ?";
            idformato = bandera;
            bandera++;
        }
        if(parametrosPel.getIdSucursal() > 0 ){
            generandoConsulta = generandoConsulta + " and s.SUC_idsucursal = ?";           
            idsucursal = bandera;
            bandera++;
        }
        if(parametrosPel.getIdPelicula() > 0 ){
            generandoConsulta = generandoConsulta + " and p.PEL_idpelicula = ?";           
            idpelicula = bandera;
            bandera++;
        }
        if(parametrosPel.getIdIdioma() > 0 ){
            generandoConsulta = generandoConsulta + " and  i.IDI_id = ?";           
            ididioma = bandera;
            bandera++;
        }
        generandoConsulta = generandoConsulta + " and f.FUN_dia = ?";
        generandoConsulta = generandoConsulta + " and f.FUN_Hora between ? and ?";
        
        PreparedStatement ptmt = con.prepareStatement(generandoConsulta);
        if(idpelicula >0) {
        	ptmt.setInt(idpelicula, parametrosPel.getIdPelicula());
        }
        if(idsucursal >0) {
        	ptmt.setInt(idsucursal, parametrosPel.getIdSucursal());
        }
        if(idformato > 0) {
        	ptmt.setInt(idformato, parametrosPel.getIdFormato());
        }
        if(ididioma > 0) {
        	ptmt.setInt(ididioma, parametrosPel.getIdIdioma());	
        }
        
        /*SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
        Date parsed = format.parse(parametrosPel.getDiaFuncion());
        java.sql.Date Dsql = new java.sql.Date(parsed.getTime()); */
        
        ptmt.setString(bandera, parametrosPel.getDiaFuncion());
        bandera++; 
        ptmt.setString(bandera, parametrosPel.getHoraInicio());
        bandera++; 
        ptmt.setString(bandera, parametrosPel.getHorafinal());
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
			
			found.setNombreformato(rs.getNString("Formato"));
			
			found.setNombreSuc(rs.getString("Sucursal"));
			
			found.setNombreIdioma(rs.getString("Idioma"));
			
			listaencontrado.add(found);
		}
		con.close();
        }catch(SQLException sqle){
        	System.out.println(sqle.getMessage() + "chechar peliculas crud metodo Busqueda");
        }/*catch(ParseException pe){
        	System.out.println(pe.getMessage() + "checate la conversion");
        } */
		return listaencontrado;
	}	
	
}
