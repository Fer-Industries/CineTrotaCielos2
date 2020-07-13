package com.mx.cinema.entities;

public class Rel_pel_formato {
 
	private int idPelicula ;
	private int idFormato;
	
	public Rel_pel_formato(int idPelicula, int idFormato) {
		super();
		this.idPelicula = idPelicula;
		this.idFormato = idFormato;
	}

	public int getIdPelicula() {
		return idPelicula;
	}

	public void setIdPelicula(int idPelicula) {
		this.idPelicula = idPelicula;
	}

	public int getIdFormato() {
		return idFormato;
	}

	public void setIdFormato(int idFormato) {
		this.idFormato = idFormato;
	} 
	
	
	
	
	
}
