package com.mx.cinema.entities;

public class Rel_product_combo {

	private int idCombo;
	private int idProducto;
	
	public Rel_product_combo(int idCombo, int idProducto) {
		super();
		this.idCombo = idCombo;
		this.idProducto = idProducto;
	}

	public int getIdCombo() {
		return idCombo;
	}

	public void setIdCombo(int idCombo) {
		this.idCombo = idCombo;
	}

	public int getIdProducto() {
		return idProducto;
	}

	public void setIdProducto(int idProducto) {
		this.idProducto = idProducto;
	}
	
	
	
	
}
