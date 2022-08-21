<%@page import="com.VO.memberVO"%>
<%@page import="com.VO.reservationVO"%>
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
		ArrayList<reservationVO> list = (ArrayList)session.getAttribute("reservation_list");
		memberVO vo = (memberVO)session.getAttribute("vo");
		
		if(list != null){
	%>
			
	<%  }%>
	
</body>
</html>