package mx.com.cinema.model;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import mx.com.cinema.entities.FormatosBean;
import mx.com.cinema.entities.IdiomaBean;
import mx.com.cinema.entities.PeliculasBean;
import mx.com.cinema.entities.SucursalBean;

public class CatalogosCrud implements CatalogoInterface{
	ConnectionDB conexion;
	Connection con;
	CallableStatement ctmt;
	ResultSet rs;
	
	public List<SucursalBean> getSucursales() {
		List<SucursalBean> listaSucursales = new ArrayList<SucursalBean>();
		
		ConnectionDB conexion = new ConnectionDB();
		con = conexion.getConexion();
		String procSucursales = "{call P_SUCURSALES_ACTIVAS}";
		try {
			ctmt = con.prepareCall(procSucursales);
			rs = ctmt.executeQuery();
			
			while(rs.next()) {
				SucursalBean sucursal = new SucursalBean();
				sucursal.setIdSucursal(rs.getInt("id"));
				sucursal.setNombre(rs.getString("name"));
				listaSucursales.add(sucursal);
			}
			con.close();
		}catch(SQLException sqle) {
			System.out.println(sqle.getMessage());
		}
		return listaSucursales;
	}
	
	public List<FormatosBean> getFormatos() {
		List<FormatosBean> listaFormatos = new ArrayList<FormatosBean>();
		
		ConnectionDB conexion = new ConnectionDB();
		con = conexion.getConexion();
		String procFormatos = "{call P_FORMATOS_ACTIVOS}";
		try {
			ctmt = con.prepareCall(procFormatos);
			rs = ctmt.executeQuery();
			while(rs.next()) {
				FormatosBean formato = new FormatosBean();
				formato.setIdFormato(rs.getInt("id"));
				formato.setNombreFormato(rs.getString("name"));
				listaFormatos.add(formato);
			}
			con.close();
		}catch(SQLException sqle) {
			System.out.println(sqle.getMessage());
		}
		return listaFormatos;
	}
	
	
	public List<IdiomaBean> getIdiomas()
	{
		/*Falta el nombre del proc y las columnas de la base de datos*/
		List<IdiomaBean> listaIdiomas = new ArrayList<IdiomaBean>();
		ConnectionDB conection = new ConnectionDB();
		con = conection.getConexion();
		String textsql= "{call P_IDIOMAS_ACTIVOS}";
		try {
			ctmt= con.prepareCall(textsql);
			rs = ctmt.executeQuery();
			while(rs.next()){
				IdiomaBean idioma = new IdiomaBean();
				idioma.setIdidioma(rs.getInt("ID"));
				idioma.setNombre(rs.getString("Nombre"));
				idioma.setStatus(rs.getInt("Estatus"));
				listaIdiomas.add(idioma);
			}
			con.close();
		}
		catch(SQLException sqle) {
			System.out.println(sqle.getMessage());
		}
		return listaIdiomas;
	}
	
	
	public List<PeliculasBean> getListapelicula(){
		List<PeliculasBean> listaPeliculas = new ArrayList<PeliculasBean>();
		ConnectionDB conexion = new ConnectionDB();
		con = conexion.getConexion();
		String llamarproc ="{call P_PELICULAS}";
		try {
			ctmt =con.prepareCall(llamarproc) ;
			rs= ctmt.executeQuery();
			while(rs.next()) {
				PeliculasBean pelencontrada = new PeliculasBean();
				pelencontrada.setNombrePelicula(rs.getString("Nombre"));
				pelencontrada.setIdPelicula(rs.getInt("ID"));
				listaPeliculas.add(pelencontrada);
			}
			con.close();
		}
		catch(SQLException sqle) {
			System.out.println(sqle.getMessage());
		}
		return listaPeliculas;
	
	}
	
}
