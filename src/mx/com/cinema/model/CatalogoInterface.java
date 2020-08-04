package mx.com.cinema.model;

import java.util.List;

import mx.com.cinema.entities.FormatosBean;
import mx.com.cinema.entities.IdiomaBean;
import mx.com.cinema.entities.PeliculasBean;
import mx.com.cinema.entities.SucursalBean;

public interface CatalogoInterface {
	float pi = 3.1416f; /// SON CONSTANTES OSEA NO PUEDEN CAMBIAR DE VALOR
	/*Una interfaz en Java es una colecci�n de m�todos abstractos y propiedades constantes. 
	 * En las interfaces se especifica qu� se debe hacer pero no su implementaci�n.
	 *  Ser�n las clases que implementen estas interfaces las que describen la l�gica del comportamiento de los m�todos.*/
	/*Aqui estoy diciendo que la clase que implemente a esta interface va a regresar una List de tipo SucursalBean
	 * No se pueden instanciars*/
	public List<SucursalBean> getSucursales();
	
	public List<FormatosBean> getFormatos();
	
	public List<IdiomaBean> getIdiomas();
	
	public List<PeliculasBean> getListapelicula();
}
