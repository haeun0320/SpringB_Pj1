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
	<button name="button1" onclick="showLecture()">강의장</button>
	<button name="button2" onclick="showEtc()">AI Lab 및 휴게공간</button>
	
</body>
</html>