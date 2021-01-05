package mx.com.cinema.entities;

import java.util.ArrayList;
import java.util.List;

public class CarritoBean {
	private List<InfoCarrito> info = new ArrayList<InfoCarrito>();
	
	public List<InfoCarrito> getInfo() {
		return info;
	}

	public void setInfo(List<InfoCarrito> info) {
		this.info = info;
	}

	@Override
	public String toString() {
		return "CarritoBean [info=" + info + "]";
	}
}
