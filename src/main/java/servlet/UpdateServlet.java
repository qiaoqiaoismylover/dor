package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DorAdminInfoDao;
import dao.DorInfoDao;
import dao.StudentInfoDao;
import dao.WaterAndElectricityFareDao;
import mysql.MysqlUtil;

/**
 * Servlet implementation class UpdateServlet
 */
@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		/*
		 * response.getWriter().append("Served at: ").append(request.getContextPath());
		 */
		request.setCharacterEncoding("UTF-8");
		String tab = request.getParameter("tab");
		HttpSession session = request.getSession();
		if (tab.equals("dor_info")) {
			String dor_id = request.getParameter("dor_id");
			String dor_phone = request.getParameter("dor_phone");
			String resident_num = request.getParameter("resident_num");
			String occupied_num = request.getParameter("occupied_num");
			String[] str = new String[] { dor_id, dor_phone, resident_num, occupied_num };
			Integer i = MysqlUtil.AddU("REPLACE INTO dor_info VALUES (?,?,?,?) ", str);
			if (i != null) {
				List dorInfoList = new ArrayList();
				dorInfoList = DorInfoDao.readList();
				session.setAttribute("dorInfo", dorInfoList);
				response.sendRedirect("../adminLeft/adminLeftDorInfo.jsp");
			}
		}
		if (tab.equals("dor_admin")) {
			String dor_ad_id = request.getParameter("dor_ad_id");
			String password = request.getParameter("password");
			String dor_id = request.getParameter("dor_id");
			String dor_ad_phone = request.getParameter("dor_ad_phone");
			String[] str = new String[] { dor_ad_id, password, dor_id, dor_ad_phone };
			Integer i = MysqlUtil.AddU("REPLACE INTO dor_admin VALUES (?,?,?,?) ", str);
			if (i != null) {
				List dorAdminInfoList = new ArrayList();
				dorAdminInfoList = DorAdminInfoDao.readList();
				session.setAttribute("dorAdminInfo", dorAdminInfoList);
				response.sendRedirect("../adminLeft/adminLeftDorAdmin.jsp");
			}
		}
		if (tab.equals("stu_info")) {
			String stu_id = request.getParameter("stu_id");
			String password = request.getParameter("password");
			String name = request.getParameter("name");
			String sex = request.getParameter("sex");
			String department = request.getParameter("department");
			String dor_id = request.getParameter("dor_id");
			String stu_phone = request.getParameter("stu_phone");
			String stu_class = request.getParameter("stu_class");
			String[] str = new String[] { stu_id, password, name, sex, department, dor_id, stu_phone, stu_class };
			Integer i = MysqlUtil.AddU("REPLACE INTO stu_info VALUES (?,?,?,?,?,?,?,?) ", str);
			if (i != null) {
				List stuInfoList = new ArrayList();
				stuInfoList = StudentInfoDao.readList();
				session.setAttribute("stuInfo", stuInfoList);
				response.sendRedirect("../adminLeft/adminLeftStu.jsp");
			}
		}
		if (tab.equals("water_and_electricity")) {
			String bill_id = request.getParameter("bill_id");
			String dor_id = request.getParameter("dor_id");
			String time = request.getParameter("time");
			String water_consum = request.getParameter("water_consum");
			String water_charge = request.getParameter("water_charge");
			String electricity_consum = request.getParameter("electricity_consum");
			String electricity_charge = request.getParameter("electricity_charge");
			String is_pay = request.getParameter("is_pay");
			String[] str = new String[] { bill_id, dor_id, time, water_consum, water_charge, electricity_consum,
					electricity_charge, is_pay };
			Integer i = MysqlUtil.AddU("REPLACE INTO water_and_electricity VALUES (?,?,?,?,?,?,?,?) ", str);
			if (i != null) {
				List waterAndElectricityFareList = new ArrayList();
				waterAndElectricityFareList = WaterAndElectricityFareDao.readList();
				session.setAttribute("fare", waterAndElectricityFareList);
				response.sendRedirect("../adminLeft/adminLeftFare.jsp");
			}
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
