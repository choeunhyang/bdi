package com.bdi.test.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DBTest {
	private static String driver = "org.mariadb.jdbc.Driver";
	private static String url = "jdbc:mariadb://localhost:3306/dbi";
	private static String id = "root";
	private static String pwd = "12345678";
	
	public List<Map<String,String>> getUserlist(){
		Connection con = null;
		List<Map<String,String>> userList = new ArrayList<Map<String,String>>();
		try {
			Class.forName(driver); // 나 오류날수 있어 반드시 예외처리 해줘 내가 모르는 오류
			con = DriverManager.getConnection(url, id, pwd);
			Statement stmt = con.createStatement();
			String sql = "select * from user_info";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				Map<String,String>user = new HashMap<String,String>();
				user.put("uiNo", rs.getString("uiNo"));
				user.put("uiId", rs.getString("uiId"));
				user.put("uipwd", rs.getString("uipwd"));
				user.put("uiName", rs.getString("uiName"));
				/*System.out.print(rs.getInt("uiNo"));
				System.out.print(rs.getString("uiId"));
				System.out.print(rs.getString("uipwd"));
				System.out.print(rs.getString("uiName"));
				System.out.println();*/
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		/*} catch (ClassNotFoundException e) { //에러가 나면 잡아준다  종류가 다르다.
			e.printStackTrace(); // 드라이버 못찾았을때
		} catch (SQLException e) {
			e.printStackTrace();	// SQL못찾았을때
		}*/
		return userList;
	}
	
	public static void main(String[] args) {
		DBTest dbt = new DBTest();
		List<Map<String,String>> userList = dbt.getUserlist();
		for(Map<String,String>user : userList) {
			System.out.println("userNo : " + user.get("uiNo"));
			System.out.println(", userId : " + user.get("uiId"));
			System.out.println(", userName : " + user.get("uiName"));
		}
	}
}
