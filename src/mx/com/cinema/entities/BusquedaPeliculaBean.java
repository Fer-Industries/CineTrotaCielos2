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
public class BusquedaPeliculaBean{
	 private int idpel;
	 private int idsucursal;
	 private int ididioma;
	 private int idformato;
	 private String hora;
	 private String horafinal;
	 private String NombrePel;
	 private String NombreSuc;
	 private String imagen;
	 private String Nombreformato;
	 private String NombreIdioma;
	 
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
	private Date fecha;
	 
	 public Date getFecha() {
		return fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

	void BusquedaPeliculaBean() {
			
	}
	 
	public int getIdpel() {
		return idpel;
	}
	public void setIdpel(int idpel) {
		this.idpel = idpel;
	}
	public int getIdsucursal() {
		return idsucursal;
	}
	public void setIdsucursal(int idsucursal) {
		this.idsucursal = idsucursal;
	}
	public int getIdidioma() {
		return ididioma;
	}
	public void setIdidioma(int ididioma) {
		this.ididioma = ididioma;
	}
	public int getIdformato() {
		return idformato;
	}
	public void setIdformato(int idformato) {
		this.idformato = idformato;
	}
	public String getHora() {
		return hora;
	}
	public void setHora(String hora) {
		this.hora = hora;
	}
	
	
	
}
