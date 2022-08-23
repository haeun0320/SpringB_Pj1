<%@page import="com.VO.memberVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
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
	
	String comment_id = request.getParameter("comment_id");
	
	if(request.getParameter("post_id")==null){
		post_id = (String)request.getAttribute("post_id");
	}else{
		post_id = request.getParameter("post_id");
	}
	
	if(request.getParameter("title")==null){
		title = (String)request.getAttribute("title");
	}else{
		title = request.getParameter("title");
	}
	
	if(request.getParameter("writer")==null){
		writer = (String)request.getAttribute("writer");
	}else{
		writer = request.getParameter("writer");
	}
	
	if(request.getParameter("content")==null){
		content = (String)request.getAttribute("content");
	}else{
		content = request.getParameter("content");
	}
	
	if(request.getParameter("post_date")==null){
		post_date = (String)request.getAttribute("post_date");
	}else{
		post_date = request.getParameter("post_date");
	}
	
	if(request.getParameter("views")==null){
		views = (int)request.getAttribute("views");
	}else{
		views = Integer.parseInt(request.getParameter("views"));
	}
%>
	<table>
		<tr>
			<th><%= title %>></th>
		</tr>
		<tr>
			<td>작성자<%=writer%></td>
			<td>작성일자<%=post_date%></td>
			<td>조회수<%=views%></td>
		</tr>
		<tr>
			<td class="content" colspan="3"><%=content%></td>
		</tr>
	</table>
	
	
</body>
</html>