package mx.com.cinema.entities;
import java.util.Date;
//import java.time.LocalTime;
import java.time.format.DateTimeFormatter;


public class PeliculasBean  {
	private int idPelicula;
	private String nombrePelicula;
	private String clasificacionPeliculas;
	private String duracionPelicula ;
	private String fechaEstreno;
	private String imagenPelicula;
	public PeliculasBean () {
	
	}

	public int getIdPelicula() {
		return idPelicula;
	}

	public void setIdPelicula(int idPelicula) {
		this.idPelicula = idPelicula;
	}

	public String getNombrePelicula() {
		return nombrePelicula;
	}

	public void setNombrePelicula(String nombrePelicula) {
		this.nombrePelicula = nombrePelicula;
	}

	public String getClasificacionPeliculas() {
		return clasificacionPeliculas;
	}

	public void setClasificacionPeliculas(String clasificacionPeliculas) {
		this.clasificacionPeliculas = clasificacionPeliculas;
	}

	public String getDuracionPelicula() {
		return duracionPelicula;
	}

	public void setDuracionPelicula(String duracionPelicula) {
		this.duracionPelicula = duracionPelicula;
	}

	public String getFechaEstreno() {
		return fechaEstreno;
	}

	public void setFechaEstreno(String fechaEstreno) {
		this.fechaEstreno = fechaEstreno;
	}

	public String getImagenPelicula() {
		return imagenPelicula;
	}

	public void setImagenPelicula(String imagenPelicula) {
		this.imagenPelicula = imagenPelicula;
	}

	

}
