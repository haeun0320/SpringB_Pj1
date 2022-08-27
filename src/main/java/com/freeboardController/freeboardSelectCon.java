package com.freeboardController;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.freeboardDAO;
import com.VO.freeboardVO;
import com.VO.reservationVO;

@WebServlet("/freeboardSelectCon")
public class freeboardSelectCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// num이 null인 경우 기본값은 1페이지
		int viewPage_1 = 1;
		int viewPage_2 = 1;
		String num_1 = request.getParameter("num_1");
		String num_2 = request.getParameter("num_2");
		
		
		if (num_1 != null) {
			viewPage_1 = Integer.parseInt(num_1);
		}
		if (num_2 != null) {
			viewPage_2 = Integer.parseInt(num_2);
		}
		
		freeboardDAO dao = new freeboardDAO();
	
		// viewPage에 맞는 글들의 정보를 리턴받는다.
		ArrayList<freeboardVO> list1 = dao.postSelect_1(viewPage_1);
		ArrayList<freeboardVO> list2 = dao.postSelect_2(viewPage_2);
		
		HttpSession session = request.getSession();
		
		session.setAttribute("post_list_1",list1);
		session.setAttribute("post_list_2",list2);
		
		response.sendRedirect("no-sider.jsp");
	}
}
