package com.mx.cinema.entities;

public class UsuarioBean {
	
	private int    USU_idtarjeta;
	private String USU_nombre;
	private String USU_ap;
	private String USU_am;
	private int    USU_idnivel;
	private String USU_birthday;
	private String USU_correo;
	private String USU_contrasena;
	private int    USU_status;
	private int    USU_puntos;
	
	
public UsuarioBean() {
		
	}
	
	public UsuarioBean(String USU_correo, String USU_contrasena ){
		this.USU_correo = USU_correo;
		this.USU_contrasena = USU_contrasena;
	}
	
	
	public int getUSU_idtarjeta() {
		return USU_idtarjeta;
	}
	public void setUSU_idtarjeta(int uSU_idtarjeta) {
		USU_idtarjeta = uSU_idtarjeta;
	}
	public String getUSU_nombre() {
		return USU_nombre;
	}
	public void setUSU_nombre(String uSU_nombre) {
		USU_nombre = uSU_nombre;
	}
	public String getUSU_ap() {
		return USU_ap;
	}
	public void setUSU_ap(String uSU_ap) {
		USU_ap = uSU_ap;
	}
	public String getUSU_am() {
		return USU_am;
	}
	public void setUSU_am(String uSU_am) {
		USU_am = uSU_am;
	}
	public int getUSU_idnivel() {
		return USU_idnivel;
	}
	public void setUSU_idnivel(int uSU_idnivel) {
		USU_idnivel = uSU_idnivel;
	}
	public String getUSU_birthday() {
		return USU_birthday;
	}
	public void setUSU_birthday(String uSU_birthday) {
		USU_birthday = uSU_birthday;
	}
	public String getUSU_correo() {
		return USU_correo;
	}
	public void setUSU_correo(String uSU_correo) {
		USU_correo = uSU_correo;
	}
	public String getUSU_contrasena() {
		return USU_contrasena;
	}
	public void setUSU_contrasena(String uSU_contrasena) {
		USU_contrasena = uSU_contrasena;
	}
	public int getUSU_status() {
		return USU_status;
	}
	public void setUSU_status(int uSU_status) {
		USU_status = uSU_status;
	}
	public int getUSU_puntos() {
		return USU_puntos;
	}
	public void setUSU_puntos(int uSU_puntos) {
		USU_puntos = uSU_puntos;
	}
	
	
	

}
