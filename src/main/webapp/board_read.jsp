<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Generic - Hyperspace by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
	</head>
	<body class="is-preload">

		<!-- Header -->
			<header id="header">
				<a href="index.html" class="title">Hyperspace</a>
				<nav>
					<ul>
						<li><a href="index.html">Home</a></li>
						<li><a href="generic.html" class="active">Generic</a></li>
						<li><a href="elements.html">Elements</a></li>
					</ul>
				</nav>
			</header>

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<section id="main" class="wrapper">
						<div class="inner">
							<h1 class="major">게시글 </h1>
							<!-- <span class="image fit"><img src="images/pic04.jpg" alt="" /></span> -->
                            <table>
                                <tr>
                                    <th>작성자</th>
                                    <th>제목</th>
                                    <th>작성일</th>
                                    
                                </tr>
                                <tr>
                                    <td>내용</td>
                                    <td colspan="2">
                                        <textarea readonly="readonly"></textarea>
                                    </td>
                                </tr>
                                <!-- <c:if test="${sessionScope.userid != null}">

                                </c:if> 로그인 돼있어야 댓글 작성 가능-->

                            </table>
                            <!-- <div id="listReply">
                                <table>
                                    <tr>
                                        <td>아이디</td>
                                        <td><textarea name="" id="" rows="1"></textarea></td>
                                        <td>작성일</td>
                                        <td>
                                            <c:if>
                                                <a href="">수정</a>
                                                <a href="">삭제</a>    
                                            </c:if>
                                        </td>
                                    </tr>
                                </table>
                            </div> -->
                            
                            <table>
                                <tr>
                                    <th colspan="4">댓글</th>
                                </tr>
                                <tr>
                                    <td>아이디</td>
                                    <td>(댓글내용)</td>
                                    <td>작성일</td>
                                    <td>
                                        <c:if><!--아이디 같을 때 조건식-->
                                            <a href="">수정</a>
                                            <a href="">삭제</a>    
                                        </c:if>
                                    </td>
                                </tr>
                                <tr>
                                    <td>댓글</td>
                                    <td>
                                        <textarea name="" id="" rows="1" placeholder="댓글을 작성하세요"></textarea>
                                    </td>
                                    <td colspan="2">
                                        <input type="submit" value="댓글 등록" class="button">
                                    </td>
                                </tr>
                            </table>
                            <ul class="actions">
                                <!-- <li><input type="submit" value="게시글 등록" class="button"></li> -->
                                <li><a href="index.html#three" class="button">목록으로</a></li>
                            </ul>
						</div>
					</section>

			</div>

		<!-- Footer -->
			<footer id="footer" class="wrapper alt">
				<div class="inner">
					<ul class="menu">
						<li>&copy; Untitled. All rights reserved.</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
					</ul>
				</div>
			</footer>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>