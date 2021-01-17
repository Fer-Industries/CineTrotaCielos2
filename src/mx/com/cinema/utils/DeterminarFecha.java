package mx.com.cinema.utils;

import org.joda.time.DateTime;

public class DeterminarFecha {
	public static void main(String [] args) {
		new DeterminarFecha().diasMostrar();
	}
	
	public void determinarFechas() {
		
	    DateTime dateTime = new DateTime();
	    System.out.println(dateTime);
	    System.out.println(dateTime.toString().substring(0, 10));
	    System.out.println(dateTime.minusDays(1));
	}
	
	public void diasMostrar() {
		for(int i = 0; i< 6;i++) {
			DateTime dateTime = new DateTime();
			System.out.println(dateTime.minusDays(i).toString().substring(0, 10));
		}
	}
}
