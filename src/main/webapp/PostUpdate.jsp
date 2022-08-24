<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%	
		String post_id = request.getParameter("post_id");
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		String post_date = request.getParameter("post_date");
	%>
	<form action="postUpdateCon?&post_id=<%=post_id%>" method="post">
		<table>
			<tr>
				<th><input type="text" name="update_title" value=<%=title%>><th>
			</tr>
			<tr>
				<td>작성자<%=writer%></td>
				<td>작성일자<%=post_date%></td>
				<td>조회수 </td>
				<td>추천수 </td>
			</tr>
			<tr>
				<td colspan="4"><textarea class="content" name="update_content"><%=content%></textarea></td>
			</tr>
		</table>
		
		<input type="submit" value="수정하기">
	</form>
</body>
</html>