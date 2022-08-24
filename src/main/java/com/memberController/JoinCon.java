package com.memberController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.memberDAO;

@WebServlet("/JoinCon")
public class JoinCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		String cls = request.getParameter("cls");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String birth = request.getParameter("birth");
		String tel = request.getParameter("tel");
		char m_type = request.getParameter("m_type").charAt(0); 
	
		memberDAO dao = new memberDAO();
		
		int cnt = dao.join(cls, id, pw, email, name, birth, tel, m_type);
		
		if(cnt>0) {
			response.sendRedirect("Main.jsp");
		}else {
			System.out.println("회원가입 실패");
		}
		
	}

}
