<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>인공지능 사관학교 게시판</h1>
	<form action="freeBoardWriteCon" method="post">
		<table>
			<tr>
				<td><input type="text" placeholder="제목" name="title"></td>
			</tr>
			<tr>
				<td><textarea placeholder="내용" name="content"></textarea></td>
			</tr>
		</table>
		<input type="submit" value="작성">
	</form>
</body>
</html>