package util;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class c3p0_select_test {
	public static void main(String[] args) throws Exception {
		Connection conn = null;
		Statement stmt = null;
		String id = null;
		String pwd = null;
		conn = JDBCUtil_c3p0.getConnection();

		stmt = conn.createStatement();
		String sql = "select * from admin";
		ResultSet rs = stmt.executeQuery(sql);
		// 表查询
		while (rs.next()) {
			id = rs.getString("ad_id");
			pwd = rs.getString("password");

			if (id == null) {
				System.out.println("表为空!");
			} else {
				System.out.println("id = " + id + "," + "name = " + pwd );
			}

			
		}
		JDBCUtil_c3p0.close(stmt, conn);
	}
}
