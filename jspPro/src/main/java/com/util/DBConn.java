package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

// 싱글톤(Sington)
public class DBConn {

	private static Connection conn = null;

	private DBConn() {

	}

	public static Connection getConnection() {
		 // 기본 설정을 사용하여 연결 생성

		if (conn == null) {
			// 연결이 아직 생성되지 않았을 때만 새로운 연결을 생성
			String className = "oracle.jdbc.driver.OracleDriver";
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "scott";
			String password = "tiger";

			try {
				// 1. JDBC 드라이버 로딩 - Class.forName()		
				Class.forName(className);
				// 2. Connection 객체 - DriverManager
				conn = DriverManager.getConnection(url, user, password);
			} catch (ClassNotFoundException e) { 
				e.printStackTrace();
			} catch (SQLException e) { 
				e.printStackTrace();
			}			
		} // if

		return conn;

	}
	
	public static Connection getConnection(String url, String user, String password) {
		// 전달된 매개변수를 사용하여 연결 생성
		if (conn == null) { 
			String className = "oracle.jdbc.driver.OracleDriver";
			try {		
				Class.forName(className);
				conn = DriverManager.getConnection(url, user, password);
			} catch (ClassNotFoundException e) { 
				e.printStackTrace();
			} catch (SQLException e) { 
				e.printStackTrace();
			}			
		} // if

		return conn;

	} // getConnection
	
	public static void close() {
		try {
			if( conn != null && !conn.isClosed() ) {
				conn.close();
			}
		} catch (SQLException e) { 
			e.printStackTrace();
		}
		
		conn = null;
	}
	

} // class
