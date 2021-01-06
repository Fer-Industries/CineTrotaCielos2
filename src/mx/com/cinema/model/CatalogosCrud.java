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

import mx.com.cinema.entities.Combo;
import mx.com.cinema.entities.DatosDulceria;
import mx.com.cinema.entities.FormatosBean;
import mx.com.cinema.entities.IdiomaBean;
import mx.com.cinema.entities.OpcionProducto;
import mx.com.cinema.entities.PeliculasBean;
import mx.com.cinema.entities.Producto;
import mx.com.cinema.entities.SucursalBean;
import mx.com.cinema.entities.TipoProducto;

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
	
	public DatosDulceria getCatalogosDul() {
		DatosDulceria datos = new DatosDulceria();
		datos.setOpciones(getOpciones());
		datos.setCombos(getCombos());
		datos.setTiposProductos(getTipos());
		return datos;
	}
	
	public List<Combo> getCombos() {
		List<Combo> combos = new ArrayList<Combo>();
		ConnectionDB conexion = new ConnectionDB();
		con = conexion.getConexion();
		String comboProc = "{call P_COMBOS}";
		try {
			ctmt = con.prepareCall(comboProc);
			rs = ctmt.executeQuery();
			while(rs.next()) {
				Combo combo = new Combo();
				combo.setId(rs.getString("COMBO_id"));
				combo.setNombre(rs.getString("COMBO_nombre"));
				combo.setPrecio(rs.getInt("COMBO_precio"));
				combo.setImg(rs.getString("img"));
				combos.add(combo);
			}
			con.close();
		}catch(SQLException e) {
			System.out.println(e.getMessage());
		}
		
		return combos;
	}
	
	public List<OpcionProducto> getOpciones() {
		List<OpcionProducto> opciones = new ArrayList<OpcionProducto>();
		ConnectionDB conexion = new ConnectionDB();
		con = conexion.getConexion();
		String opcionesProc = "{call P_OPCIONES}";
		try {
			ctmt = con.prepareCall(opcionesProc);
			rs = ctmt.executeQuery();
			while(rs.next()) {
				OpcionProducto opcion = new OpcionProducto();
				opcion.setId(rs.getInt(1));
				opcion.setNombre(rs.getString(2));
				opciones.add(opcion);
			}
			con.close();
		}catch(SQLException sqle){
			System.out.println(sqle.getMessage());
		}
		return opciones;
	}
	
	public List<TipoProducto> getTipos() {
		List<TipoProducto> tipos = new ArrayList<TipoProducto>();
		ConnectionDB conexion = new ConnectionDB();
		con = conexion.getConexion();
		String tiposProc = "{call P_TIPOS}";
		try {
			ctmt = con.prepareCall(tiposProc);
			rs = ctmt.executeQuery();
			while(rs.next()) {
				TipoProducto tipo = new TipoProducto();
				tipo.setId(rs.getInt(1));
				tipo.setNombre(rs.getString(2));
				tipos.add(tipo);
			}
		}catch(SQLException sqle) {
			System.out.println(sqle.getMessage());
		}
		
		return tipos;
	}
	
	public List<Producto> getProductos(int tipoSeleccionado) {
		List<Producto> productos = new ArrayList<Producto>();
		ConnectionDB conexion = new ConnectionDB();
		con = conexion.getConexion();
		String productosProc = "{call P_PRODUCTOS_TIPO(?)}";
		try{
			ctmt = con.prepareCall(productosProc);
			ctmt.setInt(1, tipoSeleccionado);
			rs = ctmt.executeQuery();
			while(rs.next()) {
				Producto producto= new Producto();
				producto.setId(rs.getInt(1));
				producto.setNombre(rs.getString(2));
				producto.setPrecio(rs.getInt(3));
				producto.setSize(rs.getString(4));
				producto.setImg(rs.getString(5));
				productos.add(producto);
			}
			con.close();
		}catch(SQLException sqle) {
			System.out.println(sqle.getMessage());
		}
		
		return productos;
	}
	
	public List<Combo> getTodosLosProductos(){
		List<Combo> combos = new ArrayList<Combo>();
		ConnectionDB conexion = new ConnectionDB();
		con = conexion.getConexion();
		String comboProc = "{call P_Cat_Productos}";
		try {
			ctmt = con.prepareCall(comboProc);
			rs = ctmt.executeQuery();
			while(rs.next()){
				Combo combo = new Combo();
				combo.setId(rs.getString("Id"));
				combo.setNombre(rs.getString("Nombre"));
				combo.setPrecio(rs.getInt("Precio"));
				combo.setImg(rs.getString("img"));
				combos.add(combo);
			}
			con.close();
		}catch(SQLException e) {
			System.out.println(e.getMessage());
		}
		return combos;
	}
	
}
