package mx.com.cinema.entities;



public class VentaBoletosBean {

	private String tipoBoleto;
	private float subtotal;
	private String nombreDescuento;
	private float total;
	private int numeroAsientos;
	private int idFuncion;
	private int dia;
	private String descuento;


	//private SalaAsientoBean[] idAsientos;
	private int ticket; 
	private int[] arregloAsientos = new int[numeroAsientos];
	
	@Override
	public String toString() {
		return "InfoVenta[descuento="+ descuento +",tipoBoleto="+tipoBoleto+",subtotal="+ subtotal+","
				+ "nombreDescuento="+nombreDescuento+",total="+total+",numeroAsientos="+numeroAsientos+","
				+ "idFuncion="+idFuncion+",idAsientos="+ arregloAsientos +"]" ;
		
		/*return "InfoVenta[descuento="+ descuento +",tipoBoleto="+tipoBoleto+",subtotal="+ subtotal+","
				+ "nombreDescuento="+nombreDescuento+",total="+total+",numeroAsientos="+numeroAsientos+","
				+ "idFuncion="+idFuncion+",idAsientos="+ Arrays.toString(idAsientos)+" ,idAsientos="+ arregloAsientos +" ]" ;*/
	}
	
	public int getTicket() {
		return ticket;
	}

	public void setTicket(int ticket) {
		this.ticket = ticket;
	}
	
/*	public SalaAsientoBean[] getIdAsientos() {
		return idAsientos;
	} */

/*	public void setIdAsientos(SalaAsientoBean[] idAsientos) {
		this.idAsientos = idAsientos;
	} */

	public String getDescuento() {
		return descuento;
	}
	public void setDescuento(String descuento) {
		this.descuento = descuento;
	}
	public int getIdFuncion() {
		return idFuncion;
	}
	public void setIdFuncion(int idFuncion) {
		this.idFuncion = idFuncion;
	}
	public int getDia() {
		return dia;
	}
	public void setDia(int dia) {
		this.dia = dia;
	}
	
	public String getTipoBoleto() {
		return tipoBoleto;
	}
	public void setTipoBoleto(String tipoBoleto) {
		this.tipoBoleto = tipoBoleto;
	}
	public float getSubtotal() {
		return subtotal;
	}
	public void setSubtotal(float subtotal) {
		this.subtotal = subtotal;
	}
	public String getNombreDescuento() {
		return nombreDescuento;
	}
	public void setNombreDescuento(String nombreDescuento) {
		this.nombreDescuento = nombreDescuento;
	}
	public float getTotal() {
		return total;
	}
	public void setTotal(float total) {
		this.total = total;
	}
	public int getNumeroAsientos() {
		return numeroAsientos;
	}
	public void setNumeroAsientos(int numeroAsientos) {
		this.numeroAsientos = numeroAsientos;
	}
	
	public int[] getArregloAsientos() {
		return arregloAsientos;
	}

	public void setArregloAsientos(int[] arregloAsientos) {
		this.arregloAsientos = arregloAsientos;
	}
	
}
