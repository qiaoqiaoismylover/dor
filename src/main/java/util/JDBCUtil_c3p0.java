package util;
 
import java.sql.Connection;
import com.mysql.jdbc.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;
 
public class JDBCUtil_c3p0 {
	private static DataSource ds = new ComboPooledDataSource();
 
// 获取连接池
	public static DataSource getDataSource() {
		return ds;
	}
 
// 获取连接
	public static Connection getConnection() throws SQLException {
		return ds.getConnection();
	}
	
 
	/**
	 * 关闭连接
	 * @param resultSet
	 * @param pst
	 * @param connection
	 */
	public static void close( Statement stmt, Connection conn) {
	close(null,stmt,conn);
	}
	
	public static void close(ResultSet rs, Statement stmt, Connection conn) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (stmt != null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	public static void close( PreparedStatement pstmt, Connection conn) {
	close(null,pstmt,conn);
	}
	
	public static void close(ResultSet rs, PreparedStatement pstmt, Connection conn) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
