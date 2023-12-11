package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {

	 private static final String URL = "jdbc:mysql://localhost:3306/shopping";
	    private static final String USER = "root";
	    private static final String PASSWORD = "";

	    public static Connection getConnecttion() {
	        Connection connection = null;
	        try {
	            Class.forName("com.mysql.cj.jdbc.Driver"); 
	            connection = DriverManager.getConnection(URL, USER, PASSWORD);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return connection;
	    }
	    public static void closeConnection(Connection connection) {
	        if (connection != null) {
	            try {
	                connection.close();
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	        }
	    }
	
	public static void main(String[] args) {
		Connection connection = getConnecttion();
		System.out.println(getConnecttion());
		 //closeConnection(connection);
	}

}
