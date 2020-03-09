package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.ArrayList;
import java.util.List;

import dao.*;
import pojo.DorAdminInfo;
import pojo.StuInfo;

@WebServlet("/LoginServlet")

public class LoginServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4069971059282821774L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");

		String piccode = (String) request.getSession().getAttribute("piccode");
		String checkCode = request.getParameter("checkCode"); // 取值
//        checkCode=checkCode.toUpperCase();  //把字符全部转换为大写的（此语句可以用于验证码不区分大小写）
		String userName = request.getParameter("username");
		String userPwd = request.getParameter("password");
		String status = request.getParameter("status");

		if (checkCode.equalsIgnoreCase(piccode)) {
			if (status.equals("admin")) {
				if (AdminDao.checkLogin(userName, userPwd)) {

					HttpSession session = request.getSession();
					session.setAttribute("loginName", userName);
					session.setAttribute("loginPassword", userPwd);

					List dorInfoList = new ArrayList();
					dorInfoList = DorInfoDao.readList();
					session.setAttribute("dorInfo", dorInfoList);

					List stuInfoList = new ArrayList();
					stuInfoList = StudentInfoDao.readList();
					session.setAttribute("stuInfo", stuInfoList);

					List dorAdminInfoList = new ArrayList();
					dorAdminInfoList = DorAdminInfoDao.readList();
					session.setAttribute("dorAdminInfo", dorAdminInfoList);

					List waterAndElectricityFareList = new ArrayList();
					waterAndElectricityFareList = WaterAndElectricityFareDao.readList();
					session.setAttribute("fare", waterAndElectricityFareList);

					session.setAttribute("status", "admin");

					response.sendRedirect("../admin.jsp");

				} else {
					response.setContentType("text/html;charset=utf-8");
					response.getWriter()
							.write("<script>alert('权限/账号/密码错误');window.location.href='../login.jsp';</script>");
				}
			} else if (status.equals("doradmin")) {
				if (DorAdminInfoDao.checkLogin(userName, userPwd)) {

					HttpSession session = request.getSession();
					session.setAttribute("loginName", userName);
					List dorInfoList = new ArrayList();
					dorInfoList = DorInfoDao.readList();
					session.setAttribute("dorInfo", dorInfoList);

					List<DorAdminInfo> dorAdminInfoList = new ArrayList<DorAdminInfo>();
					dorAdminInfoList = DorAdminInfoDao.readList();
					String dor_id = dorAdminInfoList.get(0).getDor_id();
					session.setAttribute("dorAdminInfo", dorAdminInfoList);

					List stuInfoList = new ArrayList();
					stuInfoList = StudentInfoDao.readOneList2("dor_id", dor_id);
					session.setAttribute("stuInfo", stuInfoList);

					List waterAndElectricityFareList = new ArrayList();
					waterAndElectricityFareList = WaterAndElectricityFareDao.readList();
					session.setAttribute("fare", waterAndElectricityFareList);

					session.setAttribute("status", "doradmin");

					response.sendRedirect("../admin.jsp");

				} else {
					response.setContentType("text/html;charset=utf-8");
					response.getWriter()
							.write("<script>alert('权限/账号/密码错误');window.location.href='../login.jsp';</script>");
				}
			} else if (status.equals("stu")) {
				if (StudentInfoDao.checkLogin(userName, userPwd)) {

					HttpSession session = request.getSession();
					session.setAttribute("loginName", userName);

					List<StuInfo> stuInfoList = new ArrayList<StuInfo>();
					stuInfoList = StudentInfoDao.readOneList("stu_id", userName);
					String dor_id = stuInfoList.get(0).getDor_id();
					session.setAttribute("dor_id", dor_id);
					session.setAttribute("stuInfo", stuInfoList);

					List dorInfoList = new ArrayList();
					dorInfoList = DorInfoDao.readOneList("dor_id", dor_id);
					session.setAttribute("dorInfo", dorInfoList);

					List dorAdminInfoList = new ArrayList();
					dorAdminInfoList = DorAdminInfoDao.readOneList("dor_id", dor_id.substring(0, 2));
					session.setAttribute("dorAdminInfo", dorAdminInfoList);

					List waterAndElectricityFareList = new ArrayList();
					waterAndElectricityFareList = WaterAndElectricityFareDao.readOneList("dor_id", dor_id);
					session.setAttribute("fare", waterAndElectricityFareList);

					session.setAttribute("status", "stu");

					response.sendRedirect("../adminLeft/adminLeftStu.jsp");

				} else {
					response.setContentType("text/html;charset=utf-8");
					response.getWriter()
							.write("<script>alert('权限/账号/密码错误');window.location.href='../login.jsp';</script>");
				}
			}
		} else {
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write("<script>alert('验证码错误');window.location.href='../login.jsp';</script>");
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
