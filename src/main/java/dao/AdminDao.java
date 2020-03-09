package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import util.JDBCUtil_c3p0;

public class AdminDao {
	
		//登录
		public static boolean checkLogin(String username,String password) {
			Connection conn = null;
			PreparedStatement ps = null;
			ResultSet rs=null;
			boolean ifLogin=false;	
			try {
				
				
				conn = JDBCUtil_c3p0.getConnection();
				ps = conn.prepareStatement("select * from admin where ad_id=? and password=?");
				ps.setString(1, username);
				ps.setString(2, password);
				rs = ps.executeQuery();	
				if(rs.next()) ifLogin=true;
				
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				try {
				if(rs!=null) {
					rs.close();
				}
				if(ps!=null) {
					ps.close();
				}
				if(conn!=null) {
					conn.close();
					}
				}catch(SQLException e) {
					e.printStackTrace();
				}
				
			}
			return ifLogin;
		
		}
	
}
	
