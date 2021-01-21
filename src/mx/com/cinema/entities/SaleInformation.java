package mx.com.cinema.entities;

import java.util.ArrayList;
import java.util.List;

public class SaleInformation {
	private List<String> productosEntregar = new ArrayList<String>();
	private InfoUsuario infoUsuEncontrada;
	public List<String> getProductosEntregar() {
		return productosEntregar;
	}
	public void setProductosEntregar(List<String> productosEntregar) {
		this.productosEntregar = productosEntregar;
	}
	public InfoUsuario getInfoUsuEncontrada() {
		return infoUsuEncontrada;
	}
	public void setInfoUsuEncontrada(InfoUsuario infoUsuEncontrada) {
		this.infoUsuEncontrada = infoUsuEncontrada;
	}
	
	
}
