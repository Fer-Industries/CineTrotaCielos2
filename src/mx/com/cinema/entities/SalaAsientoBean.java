package mx.com.cinema.entities;

public class SalaAsientoBean {
	
	private int idAsiento;
	private String asiento;
	private int disponibilidad;
	
	@Override
	public String toString() {
		return "listaAsientos[id = "+ idAsiento +"]";
	}
	public int getDisponibilidad() {
		return disponibilidad;
	}
	public void setDisponibilidad(int disponibilidad) {
		this.disponibilidad = disponibilidad;
	}
	public SalaAsientoBean() {
		
	}
	public int getIdAsiento() {
		return idAsiento;
	}
	public void setIdAsiento(int idAsiento) {
		this.idAsiento = idAsiento;
	}
	public String getAsiento() {
		return asiento;
	}
	public void setAsiento(String asiento) {
		this.asiento = asiento;
	}
}
