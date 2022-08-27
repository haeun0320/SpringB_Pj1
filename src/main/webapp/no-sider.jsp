<%@page import="com.DAO.commentDAO"%>
<%@page import="com.DAO.freeboardDAO"%>
<%@page import="com.VO.memberVO"%>
<%@page import="com.VO.freeboardVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>No Sidebar - Helios by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="css/main.css" />
		<noscript><link rel="stylesheet" href="css/noscript.css" /></noscript>
		<style>
				table{
					border: 1px #a39485 solid;
					font-size: .9em;
					box-shadow: 0 2px 5px rgba(0,0,0,.25);
					width: 100%;
					border-collapse: collapse;
					border-radius: 5px;
					overflow: hidden;
				}
				th{
					text-align: left;
					font-weight: bold;
					border-bottom: 1px solid #a39485;
				}
				td{
					border-bottom: 1px solid rgba(0, 0, 0, .1);
					background: #fff;
					padding: 0.5em 1em 0.5em 1em;
				}
				.container hr{
					margin-top: 10px;
				}
				.comment_btn{
					width: 109px;
					border-radius: 0.5em;
					background: #735780;
				
				}
				.commnet_btn:hover {
					color: #fff;
					background: #a97fba;
				}
				
				#board_line{
					margin-top: -50px;
				}
		</style>
	</head>
	<body class="no-sidebar is-preload">
	<%
		request.setCharacterEncoding("utf-8");
		// viewPage에 맞는 글이 담긴 리스트 
		ArrayList<freeboardVO> list1 = (ArrayList)session.getAttribute("post_list_1");
		ArrayList<freeboardVO> list2 = (ArrayList)session.getAttribute("post_list_2");
		
		memberVO vo = (memberVO)session.getAttribute("vo");
		
		// 글에 관련된 기능을 담당하는 dao 댓글 관련된 기능을 담당하는 comment_dao
		freeboardDAO dao = new freeboardDAO();
		commentDAO comment_dao = new commentDAO();
		// 총 글의 개수
		int total_1 = dao.postTotal_1(); // 총 글 개수
		int total_2 = dao.postTotal_2();
		int pageNumber_1 = 1;
		int pageNumber_2 = 1;
	
		if (total_1 % 5 == 0) {
			pageNumber_1 = total_1 / 5;
		} else {
			pageNumber_1 = (total_1 / 5) + 1;
		}
		if (total_2 % 5 == 0) {
			pageNumber_2 = total_2 / 5;
		} else {
			pageNumber_2 = (total_2 / 5) + 1;
		}
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
								<h3 align="left"><a href="#">게시판</a></h3>
									<button id="board_notice" onclick="showNotice()">공지사항</button>
									<button id="board_free" onclick="showFreeboard()">자유게시판</button>
							</header>
						</article>
						<hr id="board_line"/>
						<div id="notice_view">
						<table border="1px solid black;" width="500px;">
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>조회수</th>
							</tr>
							<!-- 현재 페이지에 맞는 글의 정보들을 출력 -->
							<% int n=1; %>
							<% for (int i=0; i<list1.size(); i++) { %>
							<% String post_id = list1.get(i).getPost_id(); %>
							<% String title = list1.get(i).getTitle(); %>
							<% String writer = list1.get(i).getWriter(); %>
							<% String content = list1.get(i).getContent(); %>
							<% String post_date = list1.get(i).getPost_date(); %>
							<% int views = list1.get(i).getViews(); %>
								<tr>
									<td><%= n++ %></td>
									<!-- 제목을 클릭하면 해당 글의 정보가 전달된다. 제목 옆에는 해당 글의 댓글 개수 -->
									<td><a href="board_read.jsp?post_id=<%=post_id%>&title=<%=title%>&writer=<%=writer%>&content=<%=content%>&post_date=<%=post_date%>&views=<%=views%>&board_type=1"><%= list1.get(i).getTitle() %></a> [<%=comment_dao.commentNum(post_id) %>]</td>
									
									<td><%= list1.get(i).getWriter() %></td>
									<td><%= list1.get(i).getPost_date().substring(0,10) %></td>
									<td><%= list1.get(i).getViews() %></td>			
								</tr>
								
							<% } %>
						</table>
							<%
							for (int i = 1; i <= pageNumber_1; i++) {
								out.print("<a href='freeboardSelectCon?num_1=" + i + "'>" + i + "</a>");
							}
							%>
						</div>
						<div class="row">

						</div>
					</div>
						<div id="free_view" style="visibility:hidden; position:relative; top:-50;">
						<table border="1px solid black;" width="500px;">
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
						<!-- 현재 페이지에 맞는 글의 정보들을 출력 -->
						<% int n_1=1; %>
						<% for (int i=0; i<list2.size(); i++) { %>
						<% String post_id = list2.get(i).getPost_id(); %>
						<% String title = list2.get(i).getTitle(); %>
						<% String writer = list2.get(i).getWriter(); %>
						<% String content = list2.get(i).getContent(); %>
						<% String post_date = list2.get(i).getPost_date(); %>
						<% int views = list2.get(i).getViews(); %>
							<tr>
								<td><%=n_1++%></td>
								<!-- 제목을 클릭하면 해당 글의 정보가 전달된다. 제목 옆에는 해당 글의 댓글 개수 -->
								<td><a href="board_read.jsp?post_id=<%=post_id%>&title=<%=title%>&writer=<%=writer%>&content=<%=content%>&post_date=<%=post_date%>&views=<%=views%>&board_type=2"><%= list2.get(i).getTitle() %></a> [<%=comment_dao.commentNum(post_id) %>]</td>
								<td><%= list2.get(i).getWriter() %></td>
								<td><%= list2.get(i).getPost_date().substring(0,10) %></td>
								<td><%= list2.get(i).getViews() %></td>			
							</tr>
						<% } %>
					</table>
						<%
						for (int i = 1; i <= pageNumber_2; i++) {
							out.print("<a href='freeboardSelectCon?num_2=" + i + "'>" + i + "</a>");
						}
						%>
					</div>
					<% if (vo != null) { %>
						<button onclick="location.href='board_write.jsp'">글쓰기</button>
					<% } else { %>
						<button onclick="alert('로그인하시오')">글쓰기</button>
					<% } %>
					<button onclick="location.href='Main.jsp'">메인으로</button>
					
					
					<script>
						function showNotice(){
							document.getElementById("notice_view").style.visibility="visible";
							document.getElementById("free_view").style.visibility="hidden";
						}
						function showFreeboard(){
							document.getElementById("free_view").style.visibility="visible";
							document.getElementById("notice_view").style.visibility="hidden";
						}
					</script>
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