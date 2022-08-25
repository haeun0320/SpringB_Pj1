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
		int viewPage = 1;
		String num = request.getParameter("num");
		
		
		if (num != null) {
			viewPage = Integer.parseInt(num);
		}
		
		freeboardDAO dao = new freeboardDAO();
	
		
		// viewPage에 맞는 글들의 정보를 리턴받는다.
		ArrayList<freeboardVO> list1 = dao.postSelect_1(viewPage);
		ArrayList<freeboardVO> list2 = dao.postSelect_2(viewPage);
		
		HttpSession session = request.getSession();
		
		session.setAttribute("post_list_1",list1);
		session.setAttribute("post_list_2",list2);
		
		response.sendRedirect("Freeboard.jsp");
	}
}
