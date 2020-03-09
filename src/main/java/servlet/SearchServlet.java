package servlet;

import java.io.IOException;
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
import pojo.DorInfo;

/**
 * Servlet implementation class Search
 */
@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SearchServlet() {
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
		response.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String value = request.getParameter("value");
		String selected = request.getParameter("selected");
		String table = request.getParameter("table");
		HttpSession session = request.getSession();

		if (table.equals("dor_info")) {
			if (selected.equals("完整查询")) {
				if (value == null || value.equals("")) {
					response.setContentType("text/html;charset=utf-8");
					response.getWriter().write(
							"<script>alert('值不能为空!');window.location.href='../adminLeft/adminLeftDorInfo.jsp';</script>");
				} else {
					List dorInfoList = DorInfoDao.readOneList2(name, value);
					if (null != dorInfoList && dorInfoList.size() != 0) {
						session.setAttribute("dorInfo", dorInfoList);
						request.getRequestDispatcher("/adminLeft/adminLeftDorInfo.jsp").forward(request, response);
					} else {
						List dorInfoList2 = new ArrayList();
						dorInfoList2 = DorInfoDao.readList();
						session.setAttribute("dorInfo", dorInfoList2);

						response.setContentType("text/html;charset=utf-8");
						response.getWriter().write(
								"<script>alert('查无此结果！');window.location.href='../adminLeft/adminLeftDorInfo.jsp';</script>");
					}
				}
			} else if (selected.equals("模糊查询")) {
				if (value == null || value.equals("")) {
					response.setContentType("text/html;charset=utf-8");
					response.getWriter().write(
							"<script>alert('值不能为空!');window.location.href='../adminLeft/adminLeftDorInfo.jsp';</script>");
				} else {

					List<DorInfo> dorInfoList = DorInfoDao.readOneList2(name, value);
					if (null != dorInfoList && dorInfoList.size() != 0) {
						session.removeAttribute("dorInfo");
						session.setAttribute("dorInfo", dorInfoList);
						request.getRequestDispatcher("/adminLeft/adminLeftDorInfo.jsp").forward(request, response);
					} else {
						List dorInfoList2 = new ArrayList();
						dorInfoList2 = DorInfoDao.readList();
						session.setAttribute("dorInfo", dorInfoList2);

						response.setContentType("text/html;charset=utf-8");
						response.getWriter().write(
								"<script>alert('查无此结果！');window.location.href='../adminLeft/adminLeftDorInfo.jsp';</script>");
					}
				}
			}
		}

		if (table.equals("dor_admin")) {
			if (selected.equals("完整查询")) {
				if (value == null || value.equals("")) {
					response.setContentType("text/html;charset=utf-8");
					response.getWriter().write(
							"<script>alert('值不能为空!');window.location.href='../adminLeft/adminLeftDorAdmin.jsp';</script>");
				} else {
					/*
					 * System.out.println(name); System.out.println(value);
					 */
					List dorAdminInfoList = DorAdminInfoDao.readOneList(name, value);
					if (null != dorAdminInfoList && dorAdminInfoList.size() != 0) {
						session.setAttribute("dorAdminInfo", dorAdminInfoList);
						request.getRequestDispatcher("/adminLeft/adminLeftDorAdmin.jsp").forward(request, response);
					} else {

						List dorAdminInfoList2 = new ArrayList();
						dorAdminInfoList2 = DorAdminInfoDao.readList();
						session.removeAttribute("dorAdminInfo");
						session.setAttribute("dorAdminInfo", dorAdminInfoList2);

						response.setContentType("text/html;charset=utf-8");
						response.getWriter().write(
								"<script>alert('查无此结果！');window.location.href='../adminLeft/adminLeftDorAdmin.jsp';</script>");
					}
				}
			} else if (selected.equals("模糊查询")) {
				if (value == null || value.equals("")) {
					response.setContentType("text/html;charset=utf-8");
					response.getWriter().write(
							"<script>alert('值不能为空!');window.location.href='../adminLeft/adminLeftDorAdmin.jsp';</script>");
				} else {
					/*
					 * System.out.println(name); System.out.println(value);
					 */
					List dorAdminInfoList = DorAdminInfoDao.readOneList2(name, value);
					if (null != dorAdminInfoList && dorAdminInfoList.size() != 0) {
						session.setAttribute("dorAdminInfo", dorAdminInfoList);
						request.getRequestDispatcher("/adminLeft/adminLeftDorAdmin.jsp").forward(request, response);
					} else {

						List dorAdminInfoList2 = new ArrayList();
						dorAdminInfoList2 = DorAdminInfoDao.readList();
						session.removeAttribute("dorAdminInfo");
						session.setAttribute("dorAdminInfo", dorAdminInfoList2);

						response.setContentType("text/html;charset=utf-8");
						response.getWriter().write(
								"<script>alert('查无此结果！');window.location.href='../adminLeft/adminLeftDorAdmin.jsp';</script>");
					}
				}
			}
		}
			if (table.equals("stu_info")) {
				if (selected.equals("完整查询")) {
					if (value == null || value.equals("")) {
						response.setContentType("text/html;charset=utf-8");
						response.getWriter().write(
								"<script>alert('值不能为空!');window.location.href='../adminLeft/adminLeftStu.jsp';</script>");
					} else {
						List studentInfoList = StudentInfoDao.readOneList(name, value);
						if (null != studentInfoList && studentInfoList.size() != 0) {
							session.removeAttribute("stuInfo");
							session.setAttribute("stuInfo", studentInfoList);
							request.getRequestDispatcher("/adminLeft/adminLeftStu.jsp").forward(request, response);
						} else {
							/*
							 * System.out.println(name); System.out.println(value);
							 */
							List studentInfoList2 = new ArrayList();
							studentInfoList2 = StudentInfoDao.readList();
							session.setAttribute("stuInfo", studentInfoList2);

							response.setContentType("text/html;charset=utf-8");
							response.getWriter().write(
									"<script>alert('查无此结果！');window.location.href='../adminLeft/adminLeftStu.jsp';</script>");
						}
					}
				} else if (selected.equals("模糊查询")) {
					if (value == null || value.equals("")) {
						response.setContentType("text/html;charset=utf-8");
						response.getWriter().write(
								"<script>alert('值不能为空!');window.location.href='../adminLeft/adminLeftStu.jsp';</script>");
					} else {
						List studentInfoList = StudentInfoDao.readOneList2(name, value);
						if (null != studentInfoList && studentInfoList.size() != 0) {
							session.removeAttribute("stuInfo");
							session.setAttribute("stuInfo", studentInfoList);
							request.getRequestDispatcher("/adminLeft/adminLeftStu.jsp").forward(request, response);
						} else {
							/*
							 * System.out.println(name); System.out.println(value);
							 */
							List studentInfoList2 = new ArrayList();
							studentInfoList2 = StudentInfoDao.readList();
							session.setAttribute("stuInfo", studentInfoList2);

							response.setContentType("text/html;charset=utf-8");
							response.getWriter().write(
									"<script>alert('查无此结果！');window.location.href='../adminLeft/adminLeftStu.jsp';</script>");
						}
					}
				}
		}
			if (table.equals("water_and_electricity")) {
				System.out.println(table);
				
				if (selected.equals("完整查询")) {
				
					if (value == null || value.equals("")) {
						response.setContentType("text/html;charset=utf-8");
						response.getWriter().write(
								"<script>alert('值不能为空!');window.location.href='../adminLeft/adminLeftFare.jsp';</script>");
					} else {
						List waterAndElectricityFareList = WaterAndElectricityFareDao.readOneList(name, value);
						if (null != waterAndElectricityFareList && waterAndElectricityFareList.size() != 0) {
							session.setAttribute("fare", waterAndElectricityFareList);
							request.getRequestDispatcher("/adminLeft/adminLeftFare.jsp").forward(request, response);
						} else {

							List waterAndElectricityFareList2 = new ArrayList();
							waterAndElectricityFareList2 = WaterAndElectricityFareDao.readList();
							session.setAttribute("fare", waterAndElectricityFareList2);

							response.setContentType("text/html;charset=utf-8");
							response.getWriter().write(
									"<script>alert('查无此结果！');window.location.href='../adminLeft/adminLeftFare.jsp';</script>");
						}
					}
				} else if (selected.equals("模糊查询")) {
					if (value == null || value.equals("")) {
						response.setContentType("text/html;charset=utf-8");
						response.getWriter().write(
								"<script>alert('值不能为空!');window.location.href='../adminLeft/adminLeftFare.jsp';</script>");
					} else {
						List waterAndElectricityFareList = WaterAndElectricityFareDao.readOneList2(name, value);
						if (null != waterAndElectricityFareList && waterAndElectricityFareList.size() != 0) {
							session.setAttribute("fare", waterAndElectricityFareList);
							request.getRequestDispatcher("/adminLeft/adminLeftFare.jsp").forward(request, response);
						} else {
 
							List waterAndElectricityFareList2 = new ArrayList();
							waterAndElectricityFareList2 = WaterAndElectricityFareDao.readList();
							session.setAttribute("fare", waterAndElectricityFareList2);

							response.setContentType("text/html;charset=utf-8");
							response.getWriter().write(
									"<script>alert('查无此结果！');window.location.href='../adminLeft/adminLeftFare.jsp';</script>");
						}
					}
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
