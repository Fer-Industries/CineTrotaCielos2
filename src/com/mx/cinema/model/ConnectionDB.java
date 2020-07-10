package com.mx.cinema.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionDB {
	
	Connection con;
	
	public ConnectionDB() {
		try{
			String connectionURL = "jdbc:mysql://proyecto.cgkjurfvbaby.us-east-1.rds.amazonaws.com:3306/Cinema?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC&autoReconnect=true&useSSL=false&" +"user=admin&password=Fer_industries123."; 
			con = DriverManager.getConnection(connectionURL);
			if(con != null){
				System.out.println("Conexion exitosa");
			}else{
				System.out.println("Conexion fallida");
			}
		}catch(SQLException sqle){
			System.out.println(sqle.getMessage());
		}
	}
	
	public Connection getConexion(){
		return this.con;
	}
}