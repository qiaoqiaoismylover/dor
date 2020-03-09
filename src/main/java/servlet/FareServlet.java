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

import dao.WaterAndElectricityFareDao;
import mysql.MysqlUtil;

/**
 * Servlet implementation class FareServlet
 */
@WebServlet("/FareServlet")
public class FareServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FareServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		int bill_id =Integer.valueOf( request.getParameter("bill_id"));
 		int[] str = new int[]{bill_id};
 		Integer i = MysqlUtil.AddU2("update water_and_electricity set is_pay= 1 WHERE bill_id =? ",str); 
 		if(i!=null) {
 			String value = String.valueOf(session.getAttribute("dor_id"));
			List list = WaterAndElectricityFareDao.readOneList("dor_id", value);
			session.setAttribute("fare", list);
			response.sendRedirect("../adminLeft/adminLeftFare.jsp");
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
