package mx.com.cinema.entities;
import java.util.Date;

public class UsuarioBean {
	
	private Long   idTarjeta;
	private String nombre;
	private String aPaterno;
	private String aMaterno;
	private int    idNivel;
	private String birthday;
	private String correo;
	private String contrasena;
	private int    status;
	private int    puntos;
	
	public UsuarioBean() {
		
	}
	
	@Override
	public String toString() {
		return "UsuarioBean [idTarjeta=" + idTarjeta + ", nombre=" + nombre + ", aPaterno=" + aPaterno + ", aMaterno="
				+ aMaterno + ", idNivel=" + idNivel + ", birthday=" + birthday + ", correo=" + correo + ", contrasena="
				+ contrasena + ", status=" + status + ", puntos=" + puntos + "]";
	}



	public UsuarioBean(String correo, String contrasena ){
		this.correo = correo;
		this.contrasena = contrasena;
	}

	public Long getIdTarjeta() {
		return idTarjeta;
	}

	public void setIdTarjeta(Long idTarjeta) {
		this.idTarjeta = idTarjeta;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getaPaterno() {
		return aPaterno;
	}

	public void setaPaterno(String aPaterno) {
		this.aPaterno = aPaterno;
	}

	public String getaMaterno() {
		return aMaterno;
	}

	public void setaMaterno(String aMaterno) {
		this.aMaterno = aMaterno;
	}

	public int getIdNivel() {
		return idNivel;
	}

	public void setIdNivel(int idNivel) {
		this.idNivel = idNivel;
	}



	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getCorreo() {
		return correo;
	}

	public void setCorreo(String correo) {
		this.correo = correo;
	}

	public String getContrasena() {
		return contrasena;
	}

	public void setContrasena(String contrasena) {
		this.contrasena = contrasena;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getPuntos() {
		return puntos;
	}

	public void setPuntos(int puntos) {
		this.puntos = puntos;
	}

	
	
	
	
	

	

}
