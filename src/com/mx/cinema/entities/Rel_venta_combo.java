package com.mx.cinema.entities;

public class Rel_venta_combo {

	private int idCombo;
	private int idVenta;
	
	public Rel_venta_combo(int idCombo, int idVenta) {
		super();
		this.idCombo = idCombo;
		this.idVenta = idVenta;
	}

	public int getIdCombo() {
		return idCombo;
	}

	public void setIdCombo(int idCombo) {
		this.idCombo = idCombo;
	}

	public int getIdVenta() {
		return idVenta;
	}

	public void setIdVenta(int idVenta) {
		this.idVenta = idVenta;
	}
	
	
	
}
