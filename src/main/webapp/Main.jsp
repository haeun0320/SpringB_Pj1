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
	<h1>광주 인공지능 사관학교</h1>
	<% if(vo==null) {%>
		<a href="Login.html">로그인</a>
		<a href="Join.html">회원가입</a>
	<%}else{ %>
		<%= vo.getName() %><br>
		<a href="LogOutCon">로그아웃</a>
	<%} %>
	<a>강의장 연장 신청</a>
	<a>보충수업</a>
	<a>자유게시판</a>
</body>
</html>

<!-- 회원가입 -> 로그인 -> 로그아웃 -> 예약 신청 -> 예약 조회 -> 예약 수정 -> 예약 삭제 -->