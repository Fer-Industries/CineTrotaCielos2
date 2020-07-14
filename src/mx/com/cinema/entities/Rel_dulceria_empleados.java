package mx.com.cinema.entities;

public class Rel_dulceria_empleados {
	
	private int idEmpleado ; 
	
	
	public Rel_dulceria_empleados(int idEmpleado, int idVenta) {
		super();
		this.idEmpleado = idEmpleado;
		this.idVenta = idVenta;
	}
	private int idVenta; 

	public int getIdEmpleado() {
		return idEmpleado;
	}
	public void setIdEmpleado(int idEmpleado) {
		this.idEmpleado = idEmpleado;
	}
	public int getIdVenta() {
		return idVenta;
	}
	public void setIdVenta(int idVenta) {
		this.idVenta = idVenta;
	}
	
	
	
	
	
	
	
}
