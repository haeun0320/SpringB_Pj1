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
	<button name="button1" onclick="showLecture()">������</button>
	<button name="button2" onclick="showEtc()">AI Lab �� �ް԰���</button>
	
</body>
</html>