package com.mx.cinema.entities;

public class Rel_ticket {
	
	private int idEmpleado;
	private int idVenta;
	
	public Rel_ticket(int idEmpleado, int idVenta) {
		super();
		this.idEmpleado = idEmpleado;
		this.idVenta = idVenta;
	}

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
