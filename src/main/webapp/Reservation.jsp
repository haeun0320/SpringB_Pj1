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
	<h1>강의장 연장 신청</h1>
	<input type="button" value="강의장">
	<input type="button" value="AI Lab 및 후게공간">
	
</body>
</html>