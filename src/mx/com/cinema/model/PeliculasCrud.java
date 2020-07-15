package mx.com.cinema.model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mx.com.cinema.model.ConnectionDB;
import mx.com.cinema.entities.PeliculasBean;


public class PeliculasCrud {
	
	ConnectionDB conexionAWS;
	Connection con;
	CallableStatement ctmt;
	ResultSet rs;


	
	public PeliculasCrud() {
		conexionAWS = new ConnectionDB();
		con  = conexionAWS.getConexion();
	}
	
	public List<PeliculasBean> catalogoPeliculas(int idPelicula){
		String procPeliculas = "";
		List<PeliculasBean> procedimientoPeliculas = new ArrayList <> ();
		
		try {
			ctmt= con.prepareCall(procPeliculas);
			ctmt.setInt(1, idPelicula );
			rs= ctmt.executeQuery();
			while(rs.next()) {
			PeliculasBean peliculaEncontrada = new PeliculasBean();
			peliculaEncontrada.setNombrePelicula(rs.getString("PEL_nombre"));
			peliculaEncontrada.setClasificacionPeliculas(rs.getString("PEL_clasificacion"));
			peliculaEncontrada.setDuracionPelicula(rs.getFloat("PEL_duracion"));
			peliculaEncontrada.setFechaEstreno(rs.getDate("PEL_fechaestreno"));
			peliculaEncontrada.setImagenPelicula(rs.getString("PEL_imagen"));
			
			}
			con.close();
		}catch (SQLException sqle){
			System.out.println(sqle.getMessage());
		}
		return procedimientoPeliculas;
		}
	}

