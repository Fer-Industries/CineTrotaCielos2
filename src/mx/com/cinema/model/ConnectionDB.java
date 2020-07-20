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
			Class.forName("com.mysql.cj.jdbc.Driver");//Obtiene el driver 
			con = DriverManager.getConnection("jdbc:mysql://127.0.0.1/Cinema?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC&autoReconnect=true&useSSL=false&" +"user=root&password=12345");
				/* local host en vez de eso va la ip*/
			if(con != null)
				System.out.println("Success Connection");
			else
				System.out.println("Fail Connection");
		}
		//si no se encuentra el driver 
		catch(ClassNotFoundException cnfe){
			System.out.println("Revisa el driver"+cnfe);
		}
		catch(SQLException sqle){
			System.out.println("Checa la conexion");
			sqle.getMessage();
		}
	}
	
	public Connection getConexion(){
		return this.con;
	}
}