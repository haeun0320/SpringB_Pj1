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
	<h1>������ ���� ��û</h1>
	<button name="button1" onclick="showLecture()">������</button>
	<button name="button2" onclick="showEtc()">AI Lab �� �ް԰���</button><br>
	
	<div action="Lecture_reservation" style="white-space: nowrap;">
		<form action="#">		<!-- formaction��� ���ؼ� form �±׷� ���α� -->
			<div>	<!-- SpringA�� ���� -->
				<h2>Spring_A</h2>
				���� ��û �ο� : <%=dao.ReservationCount("Spring_A") %>��<br>
				
				<select name="time">
					<option value="19:00">19:00</option>
					<option value="20:00">20:00</option>
					<option value="21:00">21:00</option>
					<option value="22:00">22:00</option>
					<option value="23:00">23:00</option>
				</select>
				<!-- �α��ε��ְ� �ش� ���̵�� ������ ����� ���ٸ� -->
				<% if(vo != null && dao.repetitionCheck(vo.getId())==0) { %>
					<!-- formaction : form�±׿� ���� action�� �����ʰ� �±׿��� �����͸� ���� �ּ� �����ϴ� �Ӽ� -->
					<input type="submit" value="��û" formaction="ReservationCon?cls=Spring_A" onclick="alert('��û �Ϸ�')">
				<% } %>
				
			</div>	
		</form>
	
	</div>
	
</body>
</html>    