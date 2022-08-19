<%@page import="com.DAO.reservationDAO"%>
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
	reservationDAO dao = new reservationDAO();
%>
	<h1>강의장 연장 신청</h1>
	<button name="button1" onclick="showLecture()">강의장</button>
	<button name="button2" onclick="showEtc()">AI Lab 및 휴게공간</button><br>
	
	<div action="Lecture_reservation" style="white-space: nowrap;">
		<form action="#">		<!-- formaction사용 위해서 form 태그로 감싸기 -->
			<div>	<!-- SpringA반 예약 -->
				<h2>Spring_A</h2>
				현재 신청 인원 : <%=dao.ReservationCount("Spring_A") %>명<br>
				
				<select name="time">
					<option value="19:00">19:00</option>
					<option value="20:00">20:00</option>
					<option value="21:00">21:00</option>
					<option value="22:00">22:00</option>
					<option value="23:00">23:00</option>
				</select>
				<!-- 로그인돼있고 해당 아이디로 예약한 기록이 없다면 -->
				<% if(vo != null && dao.repetitionCheck(vo.getId())==0) { %>
					<!-- formaction : form태그에 따로 action을 주지않고 태그에서 데이터를 보낼 주소 설정하는 속성 -->
					<input type="submit" value="신청" formaction="ReservationCon?cls=Spring_A" onclick="alert('신청 완료')">
				<% } %>
				
			</div>	
		</form>
	
	</div>
	
</body>
</html>    