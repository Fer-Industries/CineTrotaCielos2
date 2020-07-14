package mx.com.cinema.entities;

public class ProductoBean {
	private int productoId;
	private String productoNombre;
	private float productoPrecio;
	private int productoAlmacen;
	private String productoStatus;
	private String productoArea;
	
	public ProductoBean() {
	
	}

	public int getProductoId() {
		return productoId;
	}

	public void setProductoId(int productoId) {
		this.productoId = productoId;
	}

	public String getProductoNombre() {
		return productoNombre;
	}

	public void setProductoNombre(String productoNombre) {
		this.productoNombre = productoNombre;
	}

	public float getProductoPrecio() {
		return productoPrecio;
	}

	public void setProductoPrecio(float productoPrecio) {
		this.productoPrecio = productoPrecio;
	}

	public int getProductoAlmacen() {
		return productoAlmacen;
	}

	public void setProductoAlmacen(int productoAlmacen) {
		this.productoAlmacen = productoAlmacen;
	}

	public String getProductoStatus() {
		return productoStatus;
	}

	public void setProductoStatus(String productoStatus) {
		this.productoStatus = productoStatus;
	}

	public String getProductoArea() {
		return productoArea;
	}

	public void setProductoArea(String productoArea) {
		this.productoArea = productoArea;
	}
	

}
