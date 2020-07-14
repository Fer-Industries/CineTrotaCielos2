package mx.com.cinema.entities;

public class PromocionesBean {
	private int idPromocion;
	private String promocionNombre;
	private float promocionDescuento;
	private int promocionStatus;
	
	public PromocionesBean() {
		
	}

	public int getIdPromocion() {
		return idPromocion;
	}

	public void setIdPromocion(int idPromocion) {
		this.idPromocion = idPromocion;
	}

	public String getPromocionNombre() {
		return promocionNombre;
	}

	public void setPromocionNombre(String promocionNombre) {
		this.promocionNombre = promocionNombre;
	}

	public float getPromocionDescuento() {
		return promocionDescuento;
	}

	public void setPromocionDescuento(float promocionDescuento) {
		this.promocionDescuento = promocionDescuento;
	}

	public int getPromocionStatus() {
		return promocionStatus;
	}

	public void setPromocionStatus(int promocionStatus) {
		this.promocionStatus = promocionStatus;
	}
	

}
