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
	<% memberVO vo = (memberVO)session.getAttribute("vo"); %>
	<h1>���� �ΰ����� ����б�</h1>
	<% if(vo==null) {%>
		<a href="Login.html">�α���</a>
		<a href="Join.html">ȸ������</a>
	<%}else{ %>
		<%= vo.getName() %><br>
		<a href="LogOutCon">�α׾ƿ�</a>
	<%} %>
	<a>������ ���� ��û</a>
	<a>�������</a>
	<a>�����Խ���</a>
</body>
</html>

<!-- ȸ������ -> �α��� -> �α׾ƿ� -> ���� ��û -> ���� ��ȸ -> ���� ���� -> ���� ���� -->