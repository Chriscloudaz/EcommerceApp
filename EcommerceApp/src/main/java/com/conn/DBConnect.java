package com.conn;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect 
{

	private static Connection conn = null;
	
	public static Connection getConn()
	{
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
		//	conn = DriverManager.getConnection("jdbc:sqlite:mydatabase.db");
		//	conn = DriverManager.getConnection("jdbc:sqlite:C:/Users/Swapnil/eclipse-workspace/Online Electronic Shopping/mydatabase.db");
		//	conn = DriverManager.getConnection("jdbc:mysql://db:3306/ecommerce_app","root","root");
		//	conn = DriverManager.getConnection("jdbc:mysql://mysql-service.ecommerce-app-db.svc.cluster.local:3306/ecommerce_app","root","root");
		//	conn = DriverManager.getConnection("jdbc:mysql://database-1.csa0snvktt2c.eu-north-1.rds.amazonaws.com:3306/ecommerce_app","admin","3NbAzXbvJFcGVYwZH04h");
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		return conn;
	}
	
}
