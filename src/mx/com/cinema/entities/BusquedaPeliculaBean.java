package mx.com.cinema.entities;

import java.util.Date;

public class BusquedaPeliculaBean extends FuncionesBean{
	
	 private String horaFinal;
	 private String horaInicio;
	 private String nombrePel;
	 private String nombreSuc;
	 private String imagen;
	 private String nombreFormato;
	 private String nombreIdioma;
		public String getHoraFinal() {
			return horaFinal;
		}
		public void setHoraFinal(String horaFinal) {
			this.horaFinal = horaFinal;
		}
		public String getHoraInicio() {
			return horaInicio;
		}
		public void setHoraInicio(String horaInicio) {
			this.horaInicio = horaInicio;
		}
		public String getNombrePel() {
			return nombrePel;
		}
		public void setNombrePel(String nombrePel) {
			this.nombrePel = nombrePel;
		}
		public String getNombreSuc() {
			return nombreSuc;
		}
		public void setNombreSuc(String nombreSuc) {
			this.nombreSuc = nombreSuc;
		}
		public String getImagen() {
			return imagen;
		}
		public void setImagen(String imagen) {
			this.imagen = imagen;
		}
		public String getNombreFormato() {
			return nombreFormato;
		}
		public void setNombreFormato(String nombreFormato) {
			this.nombreFormato = nombreFormato;
		}
		public String getNombreIdioma() {
			return nombreIdioma;
		}
		public void setNombreIdioma(String nombreIdioma) {
			this.nombreIdioma = nombreIdioma;
		}

}
