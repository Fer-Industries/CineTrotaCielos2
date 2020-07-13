package com.mx.cinema.entities;


public class FuncionesBean {
	private int idFuncion;
	private int idPelicula;
	private int idSucursal;
	private float horaFuncion;
	private String diaFuncion;
	
	public FuncionesBean() {
		
	}

	public int getIdFuncion() {
		return idFuncion;
	}

	public void setIdFuncion(int idFuncion) {
		this.idFuncion = idFuncion;
	}

	public int getIdPelicula() {
		return idPelicula;
	}

	public void setIdPelicula(int idPelicula) {
		this.idPelicula = idPelicula;
	}

	public int getIdSucursal() {
		return idSucursal;
	}

	public void setIdSucursal(int idSucursal) {
		this.idSucursal = idSucursal;
	}

	public float getHoraFuncion() {
		return horaFuncion;
	}

	public void setHoraFuncion(float horaFuncion) {
		this.horaFuncion = horaFuncion;
	}

	public String getDiaFuncion() {
		return diaFuncion;
	}

	public void setDiaFuncion(String diaFuncion) {
		this.diaFuncion = diaFuncion;
	}

}
