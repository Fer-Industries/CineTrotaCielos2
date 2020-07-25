package mx.com.cinema.entities;

import java.util.List;

public class CatalogosBean {
	private List<SucursalBean> listaSucursales;
	private List<FormatosBean> listaFormatos;
	private List<IdiomaBean> listaIdiomas;
	private List<PeliculasBean> listaPeliculas;

	public List<PeliculasBean> getListaPeliculas() {
		return listaPeliculas;
	}

	public void setListaPeliculas(List<PeliculasBean> listaPeliculas) {
		this.listaPeliculas = listaPeliculas;
	}

	public List<IdiomaBean> getListaIdiomas() {
		return listaIdiomas;
	}

	public void setListaIdiomas(List<IdiomaBean> listaIdiomas) {
		this.listaIdiomas = listaIdiomas;
	}

	public List<SucursalBean> getListaSucursales() {
		return listaSucursales;
	}

	public void setListaSucursales(List<SucursalBean> listaSucursales) {
		this.listaSucursales = listaSucursales;
	}

	public List<FormatosBean> getListaFormatos() {
		return listaFormatos;
	}

	public void setListaFormatos(List<FormatosBean> listaFormatos) {
		this.listaFormatos = listaFormatos;
	}
	
	
}
