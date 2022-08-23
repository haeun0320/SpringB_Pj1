<%@page import="com.DAO.commentDAO"%>
<%@page import="com.DAO.freeboardDAO"%>
<%@page import="com.VO.memberVO"%>
<%@page import="com.VO.freeboardVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		ArrayList<freeboardVO> list = (ArrayList)session.getAttribute("post list");
		memberVO vo = (memberVO)session.getAttribute("vo");
		
		freeboardDAO dao = new freeboardDAO();
		commentDAO comment_dao = new commentDAO();
		
		int total = dao.postTotal(); // �� �� ����
		int pageNumber = 1;
		
		if(total%5==0){
			pageNumber = total/5;
		}else{
			pageNumber = (total/5)+1;
		}
		
	%>
	<h1>�ΰ����� ����б� �Խ���</h1>
	<table>
		<tr>
			<th>��ȣ</th>
			<th>����</th>
			<th>�ۼ���</th>
			<th>�ۼ���</th>
			<th>��ȸ��</th>
		</tr>
		<% 
			for(int i=0; i<list.size(); i++){
			String post_id = list.get(i).getPost_id();
			String title = list.get(i).getTitle();
			String writer = list.get(i).getWriter();
			String content = list.get(i).getContent();
			String post_date = list.get(i).getPost_date();
			int views = list.get(i).getViews();
		%>
			<tr>
				<td><%= list.get(i).getPost_id()%></td>		
				<td><a href="View.jsp?post_id=<%=post_id%>&title=<%=title%>&writer=<%=writer%>&content=<%=content%>&post_date=<%=post_date%>&views=<%=views%>"><%=list.get(i).getTitle()%></a>[<%=comment_dao.commentNum(post_id)%>]</td>		
				<td><%= list.get(i).getWriter()%></td>		
				<td><%= list.get(i).getPost_date()%></td>		
				<td><%= list.get(i).getViews()%></td>		
			</tr>
		<%  }%>
	</table>
	
	<%
		for(int i=1; i<=pageNumber; i++){
			out.print("<a href='freeboardSelectCon?num="+i+"'>"+i+"</a>");
		}
	%>
	<%	if(vo != null){%>
			<button onclick="location.href='Write.jsp'">�۾���</button>
	<%	}else{ %>
			<button onclick="alert('�α����ϼ���')">�۾���</button>
	<%	} %>
	
</body>
</html>