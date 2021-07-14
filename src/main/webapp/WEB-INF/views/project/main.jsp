<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요들넷 - 요리 알려주는 네 남자들</title>
<!-- 슬라이딩 배너에 필요한 링크 -->
<link rel="stylesheet" type="text/css" href="/resources/slick/slick.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/slick/slick-theme.css" />



<style>
.hidden {
	visibility: hidden;
}
a{
text-decoration:none;

}


.main_bottom_container {
	width: 100%;
	height: 800px;
}

.main_bottom_content {
	width: 80%;
	height: 800px;
	margin: 0 auto;
}

.best_menu {
	margin: 0 auto;
	
}

.situational_recommend {
	margin: 0 auto;
}

.main_board {
	/* background-color: yellow; */
	margin: 0 auto;
	height: 250px;
}

.main_icon {
	width: 25px;
}

.icon_text {
	font-size: x-large;
	font-family: 'Jua', sans-serif;
}

.post-slider {
	width: 100%;
	margin: 0px auto;
	position: relative;
	text-align: -webkit-center;
}

.post-slider .silder-title {
	text-align: center;
	margin: 30px auto;
}

.post-slider .next {
	position: absolute;
	top: 50%;
	right: 30px;
	font-size: 2em;
	color: gray;
	cursor: pointer;
}

.post-slider .prev {
	position: absolute;
	top: 50%;
	left: 30px;
	font-size: 2em;
	color: gray;
	cursor: pointer;
}

.post-slider .post-wrapper {
	width: 90%;
	margin: 0px auto;
}

.post-slider .post-wrapper2 {
	width: 90%;

	margin: 0px auto;
}

.post-slider .post-wrapper .post {
	width: 300px;
	height: 300px;
	margin: 0px 10px;
	display: inline-block;
	background: white;
	border-radius: 5px;
}

.post-slider .post-wrapper2 .post {
	width: 300px;
	height: 350px;
	margin: 0px 10px;
	display: inline-block;
	background: white;
	border-radius: 5px;
}

.post-slider .post-wrapper .post .post-info {
	font-size: 15px;
	height: 30%;
	padding-left: 10px;
	text-align: center;
}

.post-slider .post-wrapper2 .post .post-info {
	font-size: 15px;
	height: 30%;
	padding-left: 10px;
	text-align: center;
}

.post-slider .post-wrapper .post .slider-image {
	width: 100%;
	height: 175px;
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
}

.post-slider .post-wrapper2 .post .slider-image {
	width: 100%;
	height: 175px;
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
}

.best_text {
	height: 30px !important;
}

.cttIcon {
	width: 30px;
	position: relative;
}

.icon_wrapper {
	width: 0px;
	height: 0px;
}

.b_l {
	top: 70px;
	left: -65px;
}

.b_r {
	position: absolute;
	right: 52px;
}


.free_board {
	margin-left: 50px;
}

.page-wrapper{
min-width: 800px;
position: relative;
    margin-top: 15px;

}

.kakao_icon {
	position: fixed;
	bottom: 6px;
	right: 10px;
}

ul{
	list-style: none;
}
h4 a:link{
text-decoration:none;
color:black;

}
</style>
</head>
<body>


	<jsp:include page="include/header.jsp" />

	<div class="main_bottom_container">

		<div class="main_bottom_content">

			<div class="best_menu">
				<div class="best_text">
					<img src="/resources/proimg/star.png" class="main_icon"><span
						class="icon_text">베스트 추천메뉴</span>
				</div>
				<div class="icon_wrapper">
					<i class="prevButton"><img class="cttIcon b_l prev"
						src="/resources/proimg/previcon.png"></i> <i class="nextButton"><img
						class="cttIcon b_r next" style="top: 353px;"
						src="/resources/proimg/nexticon.png"></i>
				</div>
				<div class="page-wrapper">
					<!--page slider -->
					<div class="post-slider">

						<div class="post-wrapper">
							<div class="post">
								<img
									src="https://recipe1.ezmember.co.kr/cache/recipe/2021/01/29/34ace1011c503e33c17e852be9cbcab01.jpg"
									class="slider-image">
								<div class="post-info">
									<h4>
										<a style="color: black;" href="#" class="post-subject">알싸한 생강향과 레몬아이싱으로 덮은 홈베이킹 진저케이크 ♥ </a>
									</h4>
								</div>
							</div>
							<div class="post">
								<img
									src="https://recipe1.ezmember.co.kr/cache/recipe/2021/01/28/3ae1b00cdf1fc46005cd08c3fd3d0cb51.jpg"
									class="slider-image">
								<div class="post-info">
									<h4>
										<a style="color: black;" href="#"> 간식으로 감기예방하기! 식빵과 찰떡! 유자생강잼 ♥ </a>
									</h4>
								</div>
							</div>
							<div class="post">
								<img
									src="https://recipe1.ezmember.co.kr/cache/recipe/2021/01/25/f040772d9f85f1fc7503ac323aec20ac1.jpg"
									class="slider-image">
								<div class="post-info">
									<h4>
										<a style="color: black;" href="#">햄 대신 두부와 땡초를 넣은 두부땡초김밥 ♥ </a>
									</h4>

								</div>
							</div>
							<div class="post">
								<img
									src="https://recipe1.ezmember.co.kr/cache/recipe/2021/01/26/a9aa4cc2557c77dae0cb15ca11713c441.jpg"
									class="slider-image">
								<div class="post-info">
									<h4>
										<a style="color: black;" href="#">고급 식재료, 일상에서 쉽게 만나자! 감태 레시피 모음집♥</a>
									</h4>

								</div>
							</div>
							<div class="post">
								<img
									src="https://recipe1.ezmember.co.kr/cache/recipe/2021/01/18/091a901de3cb6d0bf428f9dc0ef8ce061.png"
									class="slider-image">
								<div class="post-info">
									<h4>
										<a style="color: black;" href="#">추운날씨, 단호박솥밥 한그릇으로 따뜻함을 채워요! </a>
									</h4>

								</div>
							</div>
							<div class="post">
								<img
									src="https://recipe1.ezmember.co.kr/cache/recipe/2021/01/25/ff4314a4fd79cb845d6df84ad27655531.png"
									class="slider-image">
								<div class="post-info">
									<h4>
										<a style="color: black;" href="#">볶음밥을 와플팬에 구우면?! 맛있다! 라이스와플 </a>
									</h4>
								</div>
							</div>
						</div>
					</div>
					<!--post slider-->
				</div>




			</div>
			<div class="situational_recommend">
				<div class="best_text">
					<img src="/resources/proimg/star.png" class="main_icon"> <a
						href='recipe/list'><span class="icon_text">전체 레시피</span></a>
				</div>
				<div class="icon_wrapper">
					<i class="prevButton"><img class="cttIcon b_l prev2"
						src="/resources/proimg/previcon.png"></i> <i class="nextButton"><img
						class="cttIcon b_r next2" style="top: 700px;"
						src="/resources/proimg/nexticon.png"></i>
				</div>
				<div class="page-wrapper" style="position: relative;">
					<!--page slider -->
					<div class="post-slider">

						<div class="post-wrapper2">

							<c:forEach var='list' items='${list }'>
								<div class="post">
									<a href='recipe/get?rid=<c:out value='${list.rid }'/>'><img
										src="<c:out value='${list.img }'/>" width='250px'
										></a>
									<div class='post-info'>
										<h4>
											<a href='recipe/get?rid=<c:out value='${list.rid }'/>'>${list.name }</a>
										</h4>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
					
					

					<!--post slider-->
				</div>

			</div>
			<br>
			<br>
			<br>
			
			<div class="main_board">
				<div class="best_text">
					<img src="/resources/proimg/star.png" class="main_icon">
					<a href='/board/list'><span class="icon_text">자유게시판</span></a>
				</div>
				<div class="free_board">

					<ul>
						<c:forEach var='board' items='${board }'>
							<li>
							<a href='/board/get?bno=<c:out value="${board.bno }"/>'>
							<c:out value='${board.title }'/></a></li>
							
						</c:forEach>
					</ul>

				</div>

			</div>
		</div>
		<div class="kakao_icon">
			<a id="channel-chat-button" href="#" onclick="void chatChannel();"><img
				src="/resources/proimg/kakao_icon.png" style="width: 66px;"></a>
		</div>
		<p id="token-result"></p>

	</div>
	


	<jsp:include page="include/footer.jsp" />
	<script src="/resources/projs/ex2.js"></script>
	<script src="/resources/projs/slick.js"></script>
	<script>
		$(document).ready(function() {
			$('.post-wrapper').slick({
				slidesToShow : 4,
				slidesToScroll : 2,
				autoplay : true,
				autoplaySpeed : 10000,
				nextArrow : $('.next'),
				prevArrow : $('.prev')
			});
			$('.post-wrapper2').slick({
				slidesToShow : 4,
				slidesToScroll : 2,
				autoplay : true,
				autoplaySpeed : 10000,
				nextArrow : $('.next2'),
				prevArrow : $('.prev2')
			});
			
			
		})
	</script>

</body>
</html>