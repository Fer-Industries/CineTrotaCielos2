package mx.com.cinema.entities;

public class PeliculasBean {
	private int idPelicula;
	private String nombrePelicula;
	private String clasificacionPeliculas;
	private float duracionPelicula;
	
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

	public float getDuracionPelicula() {
		return duracionPelicula;
	}

	public void setDuracionPelicula(float duracionPelicula) {
		this.duracionPelicula = duracionPelicula;
	}

}
