<%@page import="com.DAO.commentDAO"%>
<%@page import="com.DAO.freeboardDAO"%>
<%@page import="com.VO.memberVO"%>
<%@page import="com.VO.freeboardVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		request.setCharacterEncoding("utf-8");
		// viewPage에 맞는 글이 담긴 리스트 
		ArrayList<freeboardVO> list1 = (ArrayList)session.getAttribute("post_list_1");
		ArrayList<freeboardVO> list2 = (ArrayList)session.getAttribute("post_list_2");
		
		memberVO vo = (memberVO)session.getAttribute("vo");
		
		// 글에 관련된 기능을 담당하는 dao 댓글 관련된 기능을 담당하는 comment_dao
		freeboardDAO dao = new freeboardDAO();
		commentDAO comment_dao = new commentDAO();
		// 총 글의 개수
		int total_1 = dao.postTotal_1(); // 총 글 개수
		int total_2 = dao.postTotal_2();
		int pageNumber_1 = 1;
		int pageNumber_2 = 1;
	
		if (total_1 % 5 == 0) {
			pageNumber_1 = total_1 / 5;
		} else {
			pageNumber_1 = (total_1 / 5) + 1;
		}
		if (total_2 % 5 == 0) {
			pageNumber_2 = total_2 / 5;
		} else {
			pageNumber_2 = (total_2 / 5) + 1;
		}
	%>
	
	<%= list1.size() %>
	<%= list2.size() %>
	<h1>인공지능 사관학교 게시판</h1>
	<button id="board_notice" onclick="showNotice()">공지사항</button>
	<button id="board_free" onclick="showFreeboard()">자유게시판</button>
	
	<div id="notice_view">
	<table border="1px solid black;" width="500px;">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		
		<!-- 현재 페이지에 맞는 글의 정보들을 출력 -->
		<% int n=1; %>
		<% for (int i=0; i<list1.size(); i++) { %>
		<% String post_id = list1.get(i).getPost_id(); %>
		<% String title = list1.get(i).getTitle(); %>
		<% String writer = list1.get(i).getWriter(); %>
		<% String content = list1.get(i).getContent(); %>
		<% String post_date = list1.get(i).getPost_date(); %>
		<% int views = list1.get(i).getViews(); %>
		
		
			
			<tr>
				<td><%= n++ %></td>
				<!-- 제목을 클릭하면 해당 글의 정보가 전달된다. 제목 옆에는 해당 글의 댓글 개수 -->
				<td><a href="View.jsp?post_id=<%=post_id%>&title=<%=title%>&writer=<%=writer%>&content=<%=content%>&post_date=<%=post_date%>&views=<%=views%>&board_type=1"><%= list1.get(i).getTitle() %></a> [<%=comment_dao.commentNum(post_id) %>]</td>
				
				<td><%= list1.get(i).getWriter() %></td>
				<td><%= list1.get(i).getPost_date().substring(0,10) %></td>
				<td><%= list1.get(i).getViews() %></td>			
			</tr>
			
		<% } %>
	</table>
		<%
		for (int i = 1; i <= pageNumber_1; i++) {
			out.print("<a href='freeboardSelectCon?num_1=" + i + "'>" + i + "</a>");
		}
		%>
	</div>
	<div id="free_view" style="visibility:hidden; position:relative; top:-50;">
		<table border="1px solid black;" width="500px;">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<!-- 현재 페이지에 맞는 글의 정보들을 출력 -->
		<% int n_1=1; %>
		<% for (int i=0; i<list2.size(); i++) { %>
		<% String post_id = list2.get(i).getPost_id(); %>
		<% String title = list2.get(i).getTitle(); %>
		<% String writer = list2.get(i).getWriter(); %>
		<% String content = list2.get(i).getContent(); %>
		<% String post_date = list2.get(i).getPost_date(); %>
		<% int views = list2.get(i).getViews(); %>
	
			<tr>
				<td><%=n_1++%></td>
				<!-- 제목을 클릭하면 해당 글의 정보가 전달된다. 제목 옆에는 해당 글의 댓글 개수 -->
				<td><a href="View.jsp?post_id=<%=post_id%>&title=<%=title%>&writer=<%=writer%>&content=<%=content%>&post_date=<%=post_date%>&views=<%=views%>&board_type=2"><%= list2.get(i).getTitle() %></a> [<%=comment_dao.commentNum(post_id) %>]</td>
				<td><%= list2.get(i).getWriter() %></td>
				<td><%= list2.get(i).getPost_date().substring(0,10) %></td>
				<td><%= list2.get(i).getViews() %></td>			
			</tr>
			
		<% } %>
	</table>
		<%
		for (int i = 1; i <= pageNumber_2; i++) {
			out.print("<a href='freeboardSelectCon?num_2=" + i + "'>" + i + "</a>");
		}
		%>
	</div>
	<!-- 1부터 pageNumber까지의 목록,클릭하는순간 해당 숫자가 viewPage가 된다.-->
	
	<!-- 로그인 한 사람만 글쓰기 가능 -->
	<% if (vo != null) { %>
		<button onclick="location.href='Write.jsp'">글쓰기</button>
	<% } else { %>
		<button onclick="alert('로그인하시오')">글쓰기</button>
	<% } %>
	<button onclick="location.href='Main.jsp'">메인으로</button>
	
	
	<script>
		function showNotice(){
			document.getElementById("notice_view").style.visibility="visible";
			document.getElementById("free_view").style.visibility="hidden";
		}
		function showFreeboard(){
			document.getElementById("free_view").style.visibility="visible";
			document.getElementById("notice_view").style.visibility="hidden";
		}
	</script>
</body>
</html>