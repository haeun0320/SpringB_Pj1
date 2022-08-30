<%@page import="com.VO.memberVO"%>
<%@page import="com.VO.commentVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.DAO.commentDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE HTML>
<!--
	Helios by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>No Sidebar - Helios by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
	</head>
	<body class="no-sidebar is-preload">
	<%		
		memberVO vo = (memberVO)session.getAttribute("vo");
 
		String post_id;
		String title;
		String writer;
		String content;
		String post_date;
		int views;
		
		String comment_id = request.getParameter("comment_id");

		if (request.getParameter("post_id") == null) {
			post_id = (String)request.getAttribute("post_id");
		} else {
			post_id = request.getParameter("post_id");
		}
		
		if (request.getParameter("title") == null) {
			title = (String)request.getAttribute("title");
		} else {
			title = request.getParameter("title");
		}
		
		if (request.getParameter("writer") == null) {
			writer = (String)request.getAttribute("writer");
		} else {
			writer = request.getParameter("writer");
		}
		
		if (request.getParameter("content") == null) {
			content = (String)request.getAttribute("content");
		} else {
			content = request.getParameter("content");
		}
		
		if (request.getParameter("post_date") == null) {
			post_date = (String)request.getAttribute("post_date");
		} else {
			post_date = request.getParameter("post_date");
		}
		
		if (request.getParameter("views") == null) {
			views = (int)request.getAttribute("views");
		} else {
			views = Integer.parseInt(request.getParameter("views"));
		}
		
		commentDAO dao = new commentDAO();

		ArrayList<commentVO> list = dao.commentSelect(post_id);
	%>
		<div id="page-wrapper">

			<!-- Header -->
				<div id="header">

					<!-- Inner -->
						<div class="inner">
							<header>
								<h1><a href="index.html" id="logo">Helios</a></h1>
							</header>
						</div>

					<!-- Nav -->
						<nav id="nav">
							<ul>
								<li><a href="index.html">Home</a></li>
								<li>
									<a href="#">Dropdown</a>
									<ul>
										<li><a href="#">Lorem ipsum dolor</a></li>
										<li><a href="#">Magna phasellus</a></li>
										<li><a href="#">Etiam dolore nisl</a></li>
										<li>
											<a href="#">And a submenu &hellip;</a>
											<ul>
												<li><a href="#">Lorem ipsum dolor</a></li>
												<li><a href="#">Phasellus consequat</a></li>
												<li><a href="#">Magna phasellus</a></li>
												<li><a href="#">Etiam dolore nisl</a></li>
											</ul>
										</li>
										<li><a href="#">Veroeros feugiat</a></li>
									</ul>
								</li>
								<li><a href="left-sidebar.html">Left Sidebar</a></li>
								<li><a href="right-sidebar.html">Right Sidebar</a></li>
								<li><a href="no-sidebar.html">No Sidebar</a></li>
							</ul>
						</nav>

				</div>

			<!-- Main -->
				<div class="wrapper style1">

					<div class="container">
						<article id="main" class="special">
							<header>
								<h3 align="left"><a href="#">공지사항</a></h3>
							</header>
						</article>
						<hr id="board_line"/>
						<section>
							<table>
								<tr>
									<th><%=title%><th>
								</tr>
								<tr>
									<td>작성자<%=writer %></td>
									<td>작성일자<%=post_date %></td>
									<td>조회수 <%=views %></td>
								</tr>
								<tr>
									<td class="content" colspan="4"><%=content %></td>
								</tr>
							</table>
							<table class="comment_area">
                            	<% for(int i=0; i<list.size(); i++) { %>
									<tr>
										<td>
											<%=list.get(i).getComment_writer()%>					
											<%=list.get(i).getComment_date()%>
										</td>
									</tr>
									<tr>
										<form action="commentUpdateCon" method="post">
											
											<input type="hidden" name="comment_id" value="<%=comment_id %>"> 
											<input type="hidden" name="post_id" value="<%=post_id%>"> 
											<input type="hidden" name="title" value="<%=title%>"> 
											<input type="hidden" name="writer" value="<%=writer%>"> 
											<input type="hidden" name="content" value="<%=content%>"> 
											<input type="hidden" name="post_date" value="<%=post_date%>"> 
											<input type="hidden" name="views" value="<%=views %>"> 
											<input type="hidden" name="board_type" value="<%= request.getParameter("board_type") %>"> 
											
											<!-- View.jsp에서 보낸 댓글의 아이디와 리스트에 담긴 댓글의 아이디가 같은 단 하나의 댓글만 수정가능 -->
											<% if (list.get(i).getComment_id().equals(comment_id)) { %>					
												<td>
													<input type="text" name="update_content" value="<%=list.get(i).getContent() %>">
													<input type="submit" value="수정">
												</td>
											<% } else {%>
												<td><%=list.get(i).getContent() %></td>
											<% } %>
										</form>
									</tr>
								<% } %>
							</table>
                            <!-- 
                                <form action="commentWriteCon?post_id=<%=post_id%>&title=<%=title%>&writer=<%=writer%>&content=<%=content%>&post_date=<%=post_date%>&views=<%=views %>" method="post">
									<table class="comment_write">
										<tr>
											<td class="comment_flex">
												<textarea name="comment_content"></textarea>
												<% if (vo == null) { %>
													<button type="button" onclick="alert('로그인 하세요')">댓글 작성</button>
												<% } else { %>						
													<input type="submit" value="댓글 작성">
												<% } %>	
											</td>
										</tr>
									</table>
								</form>	
							-->
                            <ul class="actions">
                                <!-- <li><input type="submit" value="게시글 등록" class="button"></li> -->
                                <li><a href="no-sidebar.html" class="button">목록으로</a></li>
                            </ul>
						</section>
						<div class="row">

						</div>
					</div>

				</div>

			<!-- Footer -->
				<div id="footer">
					<div class="container">
						<div class="row">

							<!-- Tweets -->
								<section class="col-4 col-12-mobile">
									<header>
										<h2 class="icon brands fa-twitter circled"><span class="label">Tweets</span></h2>
									</header>
									<ul class="divided">
										<li>
											<article class="tweet">
												Amet nullam fringilla nibh nulla convallis tique ante sociis accumsan.
												<span class="timestamp">5 minutes ago</span>
											</article>
										</li>
										<li>
											<article class="tweet">
												Hendrerit rutrum quisque.
												<span class="timestamp">30 minutes ago</span>
											</article>
										</li>
										<li>
											<article class="tweet">
												Curabitur donec nulla massa laoreet nibh. Lorem praesent montes.
												<span class="timestamp">3 hours ago</span>
											</article>
										</li>
										<li>
											<article class="tweet">
												Lacus natoque cras rhoncus curae dignissim ultricies. Convallis orci aliquet.
												<span class="timestamp">5 hours ago</span>
											</article>
										</li>
									</ul>
								</section>

							<!-- Posts -->
								<section class="col-4 col-12-mobile">
									<header>
										<h2 class="icon solid fa-file circled"><span class="label">Posts</span></h2>
									</header>
									<ul class="divided">
										<li>
											<article class="post stub">
												<header>
													<h3><a href="#">Nisl fermentum integer</a></h3>
												</header>
												<span class="timestamp">3 hours ago</span>
											</article>
										</li>
										<li>
											<article class="post stub">
												<header>
													<h3><a href="#">Phasellus portitor lorem</a></h3>
												</header>
												<span class="timestamp">6 hours ago</span>
											</article>
										</li>
										<li>
											<article class="post stub">
												<header>
													<h3><a href="#">Magna tempus consequat</a></h3>
												</header>
												<span class="timestamp">Yesterday</span>
											</article>
										</li>
										<li>
											<article class="post stub">
												<header>
													<h3><a href="#">Feugiat lorem ipsum</a></h3>
												</header>
												<span class="timestamp">2 days ago</span>
											</article>
										</li>
									</ul>
								</section>

							<!-- Photos -->
								<section class="col-4 col-12-mobile">
									<header>
										<h2 class="icon solid fa-camera circled"><span class="label">Photos</span></h2>
									</header>
									<div class="row gtr-25">
										<div class="col-6">
											<a href="#" class="image fit"><img src="images/pic10.jpg" alt="" /></a>
										</div>
										<div class="col-6">
											<a href="#" class="image fit"><img src="images/pic11.jpg" alt="" /></a>
										</div>
										<div class="col-6">
											<a href="#" class="image fit"><img src="images/pic12.jpg" alt="" /></a>
										</div>
										<div class="col-6">
											<a href="#" class="image fit"><img src="images/pic13.jpg" alt="" /></a>
										</div>
										<div class="col-6">
											<a href="#" class="image fit"><img src="images/pic14.jpg" alt="" /></a>
										</div>
										<div class="col-6">
											<a href="#" class="image fit"><img src="images/pic15.jpg" alt="" /></a>
										</div>
									</div>
								</section>

						</div>
						<hr />
						<div class="row">
							<div class="col-12">

								<!-- Contact -->
									<section class="contact">
										<header>
											<h3>Nisl turpis nascetur interdum?</h3>
										</header>
										<p>Urna nisl non quis interdum mus ornare ridiculus egestas ridiculus lobortis vivamus tempor aliquet.</p>
										<ul class="icons">
											<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
											<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
											<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
											<li><a href="#" class="icon brands fa-pinterest"><span class="label">Pinterest</span></a></li>
											<li><a href="#" class="icon brands fa-dribbble"><span class="label">Dribbble</span></a></li>
											<li><a href="#" class="icon brands fa-linkedin-in"><span class="label">Linkedin</span></a></li>
										</ul>
									</section>

								<!-- Copyright -->
									<div class="copyright">
										<ul class="menu">
											<li>&copy; Untitled. All rights reserved.</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
										</ul>
									</div>

							</div>

						</div>
					</div>
				</div>

		</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.dropotron.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>