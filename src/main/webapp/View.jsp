<%@page import="com.VO.commentVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.DAO.commentDAO"%>
<%@page import="com.DAO.freeboardDAO"%>
<%@page import="com.VO.memberVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table {border:1px solid black; height:300px; width:400px;}
	.content {height:300px; font-size:200%;}
	td {border:1px solid black;}
	.comment_area {height:60px;}
	.comment_write {height:60px;}
	.comment_flex {display:flex; height:60px;}
	textarea {width:310px;}
</style>
</head>
<body>
	<%
		memberVO vo = (memberVO)session.getAttribute("vo");
	
		String post_id;
		String title;
		String writer;
		String content;
		String post_date;
		int views;
		
		if (request.getParameter("post_id") == null) {
			post_id = (String)request.getAttribute("post_id");
		} else {
			post_id = request.getParameter("post_id");
		}
		
		if (request.getParameter("title") == null) {
			title = (String)request.getAttribute("title");
		} else {
			title = request.getParameter("title");
		}
		
		if (request.getParameter("writer") == null) {
			writer = (String)request.getAttribute("writer");
		} else {
			writer = request.getParameter("writer");
		}
		
		if (request.getParameter("content") == null) {
			content = (String)request.getAttribute("content");
		} else {
			content = request.getParameter("content");
		}
		
		if (request.getParameter("post_date") == null) {
			post_date = (String)request.getAttribute("post_date");
		} else {
			post_date = request.getParameter("post_date");
		}
		
		if (request.getParameter("views") == null) {
			views = (int)request.getAttribute("views");
		} else {
			views = Integer.parseInt(request.getParameter("views"));
		}
		
		freeboardDAO freeboard_dao = new freeboardDAO();
		
		freeboard_dao.viewsUpdate(views+1, post_id);
		
		commentDAO dao = new commentDAO();
		
		ArrayList<commentVO> list = dao.commentSelect(post_id);
	%>
	<table>
		<tr>
			<th><%=title%></th>
		</tr>
		<tr>
			<td>작성자<%=writer%></td>
			<td>작성일자<%=post_date%></td>
			<td>조회수<%=views+1%></td>
		</tr>
		<tr>
			<td colspan="3" class="content"><%=content%></td>
		</tr>
	</table>
	<form action="commentWriteCon?post_id=<%=post_id%>&title=<%=title%>&writer=<%=writer%>&content=<%=content%>&post_date=<%=post_date%>&views=<%=views %>" method="post">
		<table class="comment_writer">
			<tr>
				<td class="comment_write">
					<textarea name="comment_content"></textarea>
					<%if(vo==null){%>
						<button type="button" onclick="alter('로그인 하세요')">댓글 작성</button>
					<%}else{ %>
						<input type="submit" value="댓글 작성">
					<%} %>
				</td>
			</tr>
		</table>
	</form>
	<%for(int i=0; i<list.size(); i++){ %>
		<table class="comment_area">
			<tr>
				<td>
					<%=list.get(i).getComment_writer()%>
					<%=list.get(i).getComment_date()%>
					<%if(vo.getId().equals(list.get(i).getComment_writer())){ %>  <!-- 로그인된 아이디와 댓글 작성자의 아이디가 같으면 수정, 삭제 권한 -->
						<button onclick="location.href='commentUpdate.jsp?comment_id=<%=list.get(i).getComment_id()%>&post_id=<%=post_id%>&title=<%=title%>&writer=<%=writer%>&content=<%=content%>&post_date=<%=post_date%>&views=<%=views %>'">수정</button>
						<button onclick="location.href='commentDeleteCon?comment_id=<%=list.get(i).getComment_id()%>&post_id=<%=post_id%>&title=<%=title%>&writer=<%=writer%>&content=<%=content%>&post_date=<%=post_date%>&views=<%=views %>'">삭제</button>
						<button onclick="location.href='view.jsp'">목록으로</button>
					<%} %>
				</td>
			</tr>
			<tr>
				<td><%=list.get(i).getContent()%></td>
			</tr>
		</table>
	<%} %>
	
	<%if(vo!=null && vo.getId().equals(writer)){%>
		<button onclick="location.href='PostUpdate.jsp?post_id=<%=post_id%>&title=<%=title%>&writer=<%=writer%>&content=<%=content%>&post_date=<%=post_date%>'">글 수정</button>
		<button onclick="confirm('게시글을 삭제하시겠습니까?');location.href='postDeleteCon?post_id=<%=post_id%>';">글 삭제</button>
	<%}%>
</body>
</html>