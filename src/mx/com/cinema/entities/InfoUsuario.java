package mx.com.cinema.entities;

public class InfoUsuario {
	private int idVenta;
	private Long   idTarjeta = new Long(0);
	private String nombreCompleto;
	private String fechaVenta;
	public int getIdVenta() {
		return idVenta;
	}
	public void setIdVenta(int idVenta) {
		this.idVenta = idVenta;
	}
	public Long getIdTarjeta() {
		return idTarjeta;
	}
	public void setIdTarjeta(Long idTarjeta) {
		this.idTarjeta = idTarjeta;
	}
	public String getNombreCompleto() {
		return nombreCompleto;
	}
	public void setNombreCompleto(String nombreCompleto) {
		this.nombreCompleto = nombreCompleto;
	}
	public String getFechaVenta() {
		return fechaVenta;
	}
	public void setFechaVenta(String fechaVenta) {
		this.fechaVenta = fechaVenta;
	}
	@Override
	public String toString() {
		return "InfoUsuario [idVenta=" + idVenta + ", idTarjeta=" + idTarjeta + ", nombreCompleto=" + nombreCompleto
				+ ", fechaVenta=" + fechaVenta + "]";
	}
}
