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
			conn = DriverManager.getConnection("jbdc:mysql://db-mysql-lon1-56322-do-user-15714856-0.c.db.ondigitalocean.com:25060/ecommerce_app","ecommerce_user","AVNS_Be4krs4TIVTTf2-ssJQ");
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		return conn;
	}
	
}
