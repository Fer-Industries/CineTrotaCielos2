package mx.com.cinema.entities;

import java.util.Date;

public class RegistroBean {
	
	private int tarjetaIdRegistro;
	private String correoRegistro;
	private String nombreRegistro;
	private String apellidopRegistro;
	private String apellidomRegistro;
	private Date   cumplea�osRegistro;
	private String contrasenaRegistro;
	
	public RegistroBean () {
		
	}

	public int getTarjetaIdRegistro() {
		return tarjetaIdRegistro;
	}

	public void setTarjetaIdRegistro(int tarjetaIdRegistro) {
		this.tarjetaIdRegistro = tarjetaIdRegistro;
	}

	public String getCorreoRegistro() {
		return correoRegistro;
	}

	public void setCorreoRegistro(String correoRegistro) {
		this.correoRegistro = correoRegistro;
	}

	public String getNombreRegistro() {
		return nombreRegistro;
	}

	public void setNombreRegistro(String nombreRegistro) {
		this.nombreRegistro = nombreRegistro;
	}

	public String getApellidopRegistro() {
		return apellidopRegistro;
	}

	public void setApellidopRegistro(String apellidopRegistro) {
		this.apellidopRegistro = apellidopRegistro;
	}

	public String getApellidomRegistro() {
		return apellidomRegistro;
	}

	public void setApellidomRegistro(String apellidomRegistro) {
		this.apellidomRegistro = apellidomRegistro;
	}

	public Date getCumplea�osRegistro() {
		return cumplea�osRegistro;
	}

	public void setCumplea�osRegistro(Date cumplea�osRegistro) {
		this.cumplea�osRegistro = cumplea�osRegistro;
	}

	public String getContrasenaRegistro() {
		return contrasenaRegistro;
	}

	public void setContrasenaRegistro(String contrasenaRegistro) {
		this.contrasenaRegistro = contrasenaRegistro;
	}


}
