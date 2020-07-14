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
		Properties prop = new Properties();
		InputStream is;
		//System.out.println(System.getProperty("user.dir"));
		try {
			is = getClass().getClassLoader().getResourceAsStream("application.properties");
			prop.load(is);
		}catch(IOException ioe) {
			System.out.println(ioe.getMessage());
			return;
		}
		
		String endpoint = prop.getProperty("bd.endpoint");
		String port = prop.getProperty("bd.port");
		String name = prop.getProperty("bd.name");
		String user = prop.getProperty("bd.user");
		String pass = prop.getProperty("bd.pass");
		
		try{
			String connectionURL = "jdbc:mysql://"+endpoint+":"+port+"/"+name+"?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC&autoReconnect=true&useSSL=false&" +
		   "user="+user+"&password="+pass; 
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