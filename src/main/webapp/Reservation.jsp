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
	memberVO vo = (memberVO) session.getAttribute("vo");
%>
	<h1>������ ���� ��û</h1>
	<input type="button" value="������">
	<input type="button" value="AI Lab �� �İ԰���">
	
</body>
</html>