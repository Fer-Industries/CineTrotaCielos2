package com.mx.cinema.entities;

public class Rel_fun_asientos {

  private int idAsiento;
  private int idFuncion; 
  private int disponible;
  
  
 
public Rel_fun_asientos(int idAsiento, int idFuncion, int disponible) {
	super();
	this.idAsiento = idAsiento;
	this.idFuncion = idFuncion;
	this.disponible = disponible;
}

public int getIdAsiento() {
	return idAsiento;
}
public void setIdAsiento(int idAsiento) {
	this.idAsiento = idAsiento;
}
public int getIdFuncion() {
	return idFuncion;
}
public void setIdFuncion(int idFuncion) {
	this.idFuncion = idFuncion;
}
public int getDisponible() {
	return disponible;
}
public void setDisponible(int disponible) {
	this.disponible = disponible;
} 
  
  
  
  
	
	
	
}
