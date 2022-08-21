package com.reservationController;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.reservationDAO;
import com.VO.reservationVO;

@WebServlet("/ReservationSElectCon")
public class ReservationSelectCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String cls = request.getParameter("cls");
		
		reservationDAO dao = new reservationDAO();
		
		ArrayList<reservationVO> list = dao.ReservationSelect(cls);
		
		HttpSession session = request.getSession();
		session.setAttribute("reservation_list", list);
		response.sendRedirect("ReservationSelect.jsp");
	}

}
