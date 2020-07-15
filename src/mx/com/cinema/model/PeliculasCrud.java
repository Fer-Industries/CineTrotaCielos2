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
	}

