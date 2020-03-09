package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import pojo.StuInfo;
import util.JDBCUtil_c3p0;

public class StudentInfoDao {

	// 查找
	public static boolean checkLogin(String username, String password) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		boolean ifLogin = false;

		try {

			conn = JDBCUtil_c3p0.getConnection();
			ps = conn.prepareStatement("select * from stu_info where stu_id=? and password=?");
			ps.setString(1, username);
			ps.setString(2, password);
			rs = ps.executeQuery();
			if (rs.next())
				ifLogin = true;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (ps != null) {
					ps.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
		return ifLogin;

	}

	// 读取其中一组
	public static List<StuInfo> readOneList2(String na, String value) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<StuInfo> list = new ArrayList<StuInfo>();

		try {
			conn = JDBCUtil_c3p0.getConnection();
			ps = conn.prepareStatement("select * from stu_info where " + na + " like ?");
			ps.setString(1, "%" + value + "%");

			//System.out.println(ps.toString());
			rs = ps.executeQuery();

			while (rs.next()) {
				String stu_id = rs.getString("stu_id");
				String password = rs.getString("password");
				String name = rs.getString("name");
				String sex = rs.getString("sex");
				String department = rs.getString("department");
				String dor_id = rs.getString("dor_id");
				String stu_phone = rs.getString("stu_phone");
				String stu_class = rs.getString("stu_class");
				StuInfo dg = new StuInfo(stu_id, password, name, sex, department, dor_id, stu_phone, stu_class);
				list.add(dg);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (ps != null) {
					ps.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
		return list;
	}

	// 读取其中一组
	public static List<StuInfo> readOneList(String na, String value) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<StuInfo> list = new ArrayList<StuInfo>();

		try {
			conn = JDBCUtil_c3p0.getConnection();
			ps = conn.prepareStatement("select * from stu_info where " + na + " = ?");
			/* System.out.println(ps.toString()); */
			ps.setString(1, value);
			rs = ps.executeQuery();

			while (rs.next()) {
				String stu_id = rs.getString("stu_id");
				String password = rs.getString("password");
				String name = rs.getString("name");
				String sex = rs.getString("sex");
				String department = rs.getString("department");
				String dor_id = rs.getString("dor_id");
				String stu_phone = rs.getString("stu_phone");
				String stu_class = rs.getString("stu_class");
				StuInfo dg = new StuInfo(stu_id, password, name, sex, department, dor_id, stu_phone, stu_class);
				list.add(dg);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (ps != null) {
					ps.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
		return list;
	}

	// 读取
	public static List<StuInfo> readList() {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<StuInfo> list = new ArrayList<StuInfo>();

		try {
			conn = JDBCUtil_c3p0.getConnection();
			ps = conn.prepareStatement("select * from stu_info");
			rs = ps.executeQuery();

			while (rs.next()) {
				String stu_id = rs.getString("stu_id");
				String password = rs.getString("password");
				String name = rs.getString("name");
				String sex = rs.getString("sex");
				String department = rs.getString("department");
				String dor_id = rs.getString("dor_id");
				String stu_phone = rs.getString("stu_phone");
				String stu_class = rs.getString("stu_class");
				StuInfo dg = new StuInfo(stu_id, password, name, sex, department, dor_id, stu_phone, stu_class);
				list.add(dg);

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (ps != null) {
					ps.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
		return list;
	}

	// 添加
	@SuppressWarnings("static-access")
	public static void insert(String stu_id, String password, String name,String sex, String department, String dor_id,
			String stu_phone, String stu_class) {
		Connection conn = null;
		PreparedStatement ps = null;

		try {
			conn = JDBCUtil_c3p0.getConnection();
			ps = conn.prepareStatement("insert into stu_info values(?,?,?,?,?,?,?,?)");
			ps.setString(1, stu_id);
			ps.setString(2, password);
			ps.setString(3, name);
			ps.setString(4, sex);
			ps.setString(5, department);
			ps.setString(6, dor_id);
			ps.setString(7, stu_phone);
			ps.setString(8, stu_class);

			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps != null) {
					ps.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}

	// 删除
	public static int delete(String id) {
		Connection conn = null;
		PreparedStatement ps = null;
		int i = 0;
		try {
			conn = JDBCUtil_c3p0.getConnection();
			ps = conn.prepareStatement("delete from stu_info where stu_id=?");
			ps.setString(1, id);
			i = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps != null) {
					ps.close();
				}
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return i;
	}

	public ResultSet Search(String sql, String str[]) {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = JDBCUtil_c3p0.getConnection();
			ps = conn.prepareStatement(sql);
			if (str != null) {
				for (int i = 0; i < str.length; i++) {
					ps.setString(i + 1, str[i]);
				}
			}
			rs = ps.executeQuery();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				
				if (conn != null) {
					conn.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return rs;
	}

//	public int AddU(String sql, String str[]) {
//		int a = 0;
//		Connection conn = null;
//		PreparedStatement ps = null;
//		try {
//			conn = JDBCUtil_c3p0.getConnection();
//			ps = conn.prepareStatement(sql);
//			if (str != null) {
//				for (int i = 0; i < str.length; i++) {
//					ps.setString(i + 1, str[i]);
//				}
//			}
//			a = ps.executeUpdate();
//		} catch (Exception e) {
//			// TODO Auto-generated
//			e.printStackTrace();
//		}
//		return a;
//		
//	}
//	

}
