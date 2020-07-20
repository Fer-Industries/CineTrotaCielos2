package mx.com.cinema.entities;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class BusquedaPelBean {
	 String nombre;
	 
	 DateFormat dateformat = new SimpleDateFormat("yyyy/mm/dd");
	 Date fecha = new Date();
	 String hora;
	 String formato;
	 String sucursal;
	 public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public Date getFecha() {
		return fecha;
	}
	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}
	public String getHora() {
		return hora;
	}
	public void setHora(String hora) {
		this.hora = hora;
	}
	public String getFormato() {
		return formato;
	}
	public void setFormato(String formato) {
		this.formato = formato;
	}
	public String getSucursal() {
		return sucursal;
	}
	public void setSucursal(String sucursal) {
		this.sucursal = sucursal;
	}
	
	 
	 
}
