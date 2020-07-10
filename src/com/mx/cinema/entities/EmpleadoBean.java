package com.mx.cinema.entities;

public class EmpleadoBean {
	private int    EMP_idempleado;
	private String EMP_nombre;
	private String EMP_ap;
	private String EMP_am;
	private String EMP_birthday;
	private String EMP_area;
	private float  EMP_salario;
	private int    EMP_status;
	private String EMP_contrasena;
	private String EMP_administrador;
	
	
    public EmpleadoBean() {
		
	}
	
	public EmpleadoBean(int EMP_idempleado, String EMP_contrasena ){
		this.EMP_idempleado = EMP_idempleado;
		this.EMP_contrasena = EMP_contrasena;
	}
	
	public int getEMP_idempleado() {
		return EMP_idempleado;
	}
	public void setEMP_idempleado(int eMP_idempleado) {
		EMP_idempleado = eMP_idempleado;
	}
	public String getEMP_nombre() {
		return EMP_nombre;
	}
	public void setEMP_nombre(String eMP_nombre) {
		EMP_nombre = eMP_nombre;
	}
	public String getEMP_ap() {
		return EMP_ap;
	}
	public void setEMP_ap(String eMP_ap) {
		EMP_ap = eMP_ap;
	}
	public String getEMP_am() {
		return EMP_am;
	}
	public void setEMP_am(String eMP_am) {
		EMP_am = eMP_am;
	}
	public String getEMP_birthday() {
		return EMP_birthday;
	}
	public void setEMP_birthday(String eMP_birthday) {
		EMP_birthday = eMP_birthday;
	}
	public String getEMP_area() {
		return EMP_area;
	}
	public void setEMP_area(String eMP_area) {
		EMP_area = eMP_area;
	}
	public float getEMP_salario() {
		return EMP_salario;
	}
	public void setEMP_salario(float eMP_salario) {
		EMP_salario = eMP_salario;
	}
	public int getEMP_status() {
		return EMP_status;
	}
	public void setEMP_status(int eMP_status) {
		EMP_status = eMP_status;
	}
	public String getEMP_contrasena() {
		return EMP_contrasena;
	}
	public void setEMP_contrasena(String eMP_contrasena) {
		EMP_contrasena = eMP_contrasena;
	}
	public String getEMP_administrador() {
		return EMP_administrador;
	}
	public void setEMP_administrador(String eMP_administrador) {
		EMP_administrador = eMP_administrador;
	}
	
	
	
}
