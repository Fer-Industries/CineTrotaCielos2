package mx.com.cinema.entities;

public class NivelesTarjetaBean {
	
	private int idNivel;
	private String tarjetaNombre;
	private int acumulacionPuntos;
	
	public NivelesTarjetaBean() {
	
	}

	public int getIdNivel() {
		return idNivel;
	}

	public void setIdNivel(int idNivel) {
		this.idNivel = idNivel;
	}

	public String getTarjetaNombre() {
		return tarjetaNombre;
	}

	public void setTarjetaNombre(String tarjetaNombre) {
		this.tarjetaNombre = tarjetaNombre;
	}

	public int getAcumulacionPuntos() {
		return acumulacionPuntos;
	}

	public void setAcumulacionPuntos(int acumulacionPuntos) {
		this.acumulacionPuntos = acumulacionPuntos;
	}
	

}
