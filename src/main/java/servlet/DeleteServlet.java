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
import mysql.MysqlUtil;

/**
 * Servlet implementation class DeleteServlet
 */
@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		/*response.getWriter().append("Served at: ").append(request.getContextPath());*/
		request.setCharacterEncoding("UTF-8");
 		String tab = request.getParameter("tab");
		HttpSession session = request.getSession();
 		if(tab.equals("dor_info")){			
 			String dor_id = request.getParameter("dor_id");
	 		String[] str = new String[]{dor_id};
	 		Integer i = MysqlUtil.AddU("DELETE FROM dor_info WHERE dor_id =? ",str); 
	 		if(i!=null) {
	 			List dorInfoList = new ArrayList();
	 			dorInfoList = DorInfoDao.readList();
				session.setAttribute("dorInfo", dorInfoList);
				response.sendRedirect("../adminLeft/adminLeftDorInfo.jsp");
	 		}
 		}
 		if(tab.equals("dor_admin")){			
 			String dor_ad_id = request.getParameter("dor_ad_id");
	 		String[] str = new String[]{dor_ad_id};
	 		Integer i = MysqlUtil.AddU("DELETE FROM dor_admin WHERE dor_ad_id =? ",str); 
	 		if(i!=null) {
	 			List dorAdminInfoList = new ArrayList();
	 			dorAdminInfoList = DorAdminInfoDao.readList();
				session.setAttribute("dorAdminInfo", dorAdminInfoList);
				response.sendRedirect("../adminLeft/adminLeftDorAdmin.jsp");
	 		}
 		}
 		if(tab.equals("stu_info")){			
 			String stu_id = request.getParameter("stu_id");
	 		String[] str = new String[]{stu_id};
	 		Integer i = MysqlUtil.AddU("DELETE FROM stu_info WHERE stu_id = ? ",str); 
	 		if(i!=null) {
	 			List studentInfoList = new ArrayList();
	 			studentInfoList = StudentInfoDao.readList();
				session.setAttribute("stuInfo", studentInfoList);
				response.sendRedirect("../adminLeft/adminLeftStu.jsp");
	 		}
 		}
 		if(tab.equals("water_and_electricity")){			
 			int bill_id =Integer.valueOf( request.getParameter("bill_id"));
	 		int[] str = new int[]{bill_id};
	 		Integer i = MysqlUtil.AddU2("DELETE FROM water_and_electricity WHERE bill_id =? ",str); 
	 		if(i!=null) {
	 			List fareList = new ArrayList();
	 			fareList = WaterAndElectricityFareDao.readList();
				session.setAttribute("fare", fareList);
				response.sendRedirect("../adminLeft/adminLeftFare.jsp");
	 		}
 		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
