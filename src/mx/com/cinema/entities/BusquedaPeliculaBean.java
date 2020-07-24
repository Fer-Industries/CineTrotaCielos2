package mx.com.cinema.entities;

import java.util.Date;

/*
 * idsucursal
 * fecha 
 * hora inicio
 *  
 * pelicula
 * formatos
 * */
public class BusquedaPeliculaBean extends FuncionesBean{
	 //CAMEL CASE!!!!
	 private String horafinal;
	 private String horaInicio;
	 private String NombrePel;
	 private String NombreSuc;
	 private String imagen;
	 private String Nombreformato;
	 private String NombreIdioma;
	 //PEL_IMAGEN, PEL_Nombre as Nombre ,  f.FUN_Hora as Hora, f.FUN_dia as dia, fo.FOR_nombre as Formato, 
	 void BusquedaPeliculaBean() {
			
	}
		 
	 public String getNombrePel() {
		return NombrePel;
	}

	public void setNombrePel(String nombrePel) {
		NombrePel = nombrePel;
	}

	public String getNombreSuc() {
		return NombreSuc;
	}

	public void setNombreSuc(String nombreSuc) {
		NombreSuc = nombreSuc;
	}

	public String getImagen() {
		return imagen;
	}

	public void setImagen(String imagen) {
		this.imagen = imagen;
	}

	public String getNombreformato() {
		return Nombreformato;
	}

	public void setNombreformato(String nombreformato) {
		Nombreformato = nombreformato;
	}

	public String getNombreIdioma() {
		return NombreIdioma;
	}

	public void setNombreIdioma(String nombreIdioma) {
		NombreIdioma = nombreIdioma;
	}

	public String getHorafinal() {
		return horafinal;
	}

	public void setHorafinal(String horafinal) {
		this.horafinal = horafinal;
	}

	public String getHoraInicio() {
		return horaInicio;
	}

	public void setHoraInicio(String horaInicio) {
		this.horaInicio = horaInicio;
	}


	
	
}
