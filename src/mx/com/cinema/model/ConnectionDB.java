package mx.com.cinema.model;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;


public class ConnectionDB {
	
	Connection con;
	
	public ConnectionDB() {
		
	
		try{ 
			//java database conectivity 
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cinema?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC&autoReconnect=true&useSSL=false&" +"user=root&password=Starwars.97");
				/* local host en vez de eso va la ip*/
			if(con != null)
				System.out.println("Success Connection");
			else
				System.out.println("Fail Connection");
		}catch(SQLException sqle){
			System.out.println("Checa la conexion");
			sqle.getMessage();
		}
	}
	
	public Connection getConexion(){
		return this.con;
	}
}