package com.mx.cinema.entities;

public class Rel_pel_idioma {

	private int  idPelicula;
	private String idioma;
	public Rel_pel_idioma(int idPelicula, String idioma) {
		super();
		this.idPelicula = idPelicula;
		this.idioma = idioma;
	}
	public int getIdPelicula() {
		return idPelicula;
	}
	public void setIdPelicula(int idPelicula) {
		this.idPelicula = idPelicula;
	}
	public String getIdioma() {
		return idioma;
	}
	public void setIdioma(String idioma) {
		this.idioma = idioma;
	} 
	
	
	
}
