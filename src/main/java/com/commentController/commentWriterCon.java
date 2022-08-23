package com.commentController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.commentDAO;
import com.VO.memberVO;

@WebServlet("/commentWriterCon")
public class commentWriterCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		
		memberVO vo = (memberVO)session.getAttribute("vo");
		
		String comment_content = request.getParameter("comment_content");
		String post_id = request.getParameter("post_id");
		
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		String post_date = request.getParameter("post_date");
		int views = Integer.parseInt(request.getParameter("views"));
		
		commentDAO dao = new commentDAO();
		
//		int cnt = dao.commentWriter(post_id, comment_content, vo.getId());
	
	}

}
