package mx.com.cinema.entities;

public class Boleto {
	private String sala;
	private String nombre; //A1,A2,A4
	private String pelicula;// Jonh Wick
	private String hora;
	private String fecha;
	public String getSala() {
		return sala;
	}
	public void setSala(String sala) {
		this.sala = sala;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getPelicula() {
		return pelicula;
	}
	public void setPelicula(String pelicula) {
		this.pelicula = pelicula;
	}
	public String getHora() {
		return hora;
	}
	public void setHora(String hora) {
		this.hora = hora;
	}
	public String getFecha() {
		return fecha;
	}
	public void setFecha(String fecha) {
		this.fecha = fecha;
	}
	
}
