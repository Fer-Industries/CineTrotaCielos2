package mx.com.cinema.entities;

import java.util.Date;

public class FuncionesBean {
	private int idFuncion;
	private int idPelicula;
	private int idSucursal;
	private String horaFuncion;
	private Date diaFuncion;
	private int idFormato;
	private int idIdioma;
	
	public FuncionesBean() {
		
	}

	
	public int getIdFormato() {
		return idFormato;
	}

	public void setIdFormato(int idFormato) {
		this.idFormato = idFormato;
	}

	public int getIdIdioma() {
		return idIdioma;
	}

	public void setIdIdioma(int idIdioma) {
		this.idIdioma = idIdioma;
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

	public String getHoraFuncion() {
		return horaFuncion;
	}


	public void setHoraFuncion(String horaFuncion) {
		this.horaFuncion = horaFuncion;
	}


	public Date getDiaFuncion() {
		return diaFuncion;
	}

	public void setDiaFuncion(Date diaFuncion) {
		this.diaFuncion = diaFuncion;
	}

}
