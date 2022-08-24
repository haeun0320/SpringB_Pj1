package com.memberController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.memberDAO;
import com.VO.memberVO;

@WebServlet("/LoginCon")
public class LoginCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		memberDAO dao = new memberDAO();
		memberVO vo = dao.Login(id,pw);
		
		if(vo != null) {
			HttpSession session = request.getSession();
			session.setAttribute("vo", vo);
			response.sendRedirect("Main.jsp");
		}else {
			response.sendRedirect("LoginF.html");
		}
	}

}
