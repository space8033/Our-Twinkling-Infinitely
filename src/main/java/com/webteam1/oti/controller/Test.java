package com.webteam1.oti.controller;

import java.sql.DriverManager;
import java.sql.SQLException;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@kosa402.iptime.org:1521:orcl";
		String user = "user_webteam1";
		String password = "oracle";
		try {
			//driver 로딩
			Class.forName(driver);
			System.out.println("jdbc driver 로딩 성공");
			//DB와 연결
			DriverManager.getConnection(url, user, password);
			System.out.println("오라클 연결 성공");
		} catch (ClassNotFoundException e) {
			System.out.println("jdbc driver 로딩 실패");
		} catch (SQLException e) {
			System.out.println("오라클 연결 실패");
			e.printStackTrace();
		}
	}
}
