package mx.com.cinema.entities;

import java.util.List;

public class DatosDulceria {
	private List<OpcionProducto> opciones;
	private List<Combo> combos;
	private List<TipoProducto> tiposProductos;
	
	public List<OpcionProducto> getOpciones() {
		return opciones;
	}
	public void setOpciones(List<OpcionProducto> opciones) {
		this.opciones = opciones;
	}
	public List<Combo> getCombos() {
		return combos;
	}
	public void setCombos(List<Combo> combos) {
		this.combos = combos;
	}
	public List<TipoProducto> getTiposProductos() {
		return tiposProductos;
	}
	public void setTiposProductos(List<TipoProducto> tiposProductos) {
		this.tiposProductos = tiposProductos;
	}
}
