<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	height: 300px;
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
.kakao_icon{
position: fixed;
    bottom: 6px;
    right: 10px;
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
					<img src="/resources/proimg/star.png" class="main_icon"><span
						class="icon_text">상황별 추천메뉴</span>
				</div>
				<div class="icon_wrapper">
					<i class="prevButton"><img class="cttIcon b_l prev2"
						src="/resources/proimg/previcon.png"></i> <i class="nextButton"><img
						class="cttIcon b_r next2" style="top: 700px;"
						src="/resources/proimg/nexticon.png"></i>
				</div>
				<div class="page-wrapper">
					<!--page slider -->
					<div class="post-slider">

						<div class="post-wrapper2">
							<div class="post">
								<img
									src="https://recipe1.ezmember.co.kr/cache/recipe/2021/01/11/f539b81359c57948bb3bd27bc34163e01.png"
									class="slider-image">
								<div class="post-info">
									<h4>
										<a style="color: black;" href="#" class="post-subject">소시지로 만들 수 있는 음식 종류들!? </a>
									</h4>
								</div>
							</div>
							<div class="post">
								<img
									src="https://recipe1.ezmember.co.kr/cache/recipe/2021/01/22/bdd5bfdaf1e06827b47c18c9cf55928e1.jpg"
									class="slider-image">
								<div class="post-info">
									<h4>
										<a style="color: black;" href="#"> 여름에 먹기 좋은 음식! </a>
									</h4>
								</div>
							</div>
							<div class="post">
								<img src="https://recipe1.ezmember.co.kr/cache/recipe/2021/01/22/976c395176a9bdad0a0c4ff015ce8d251.png" class="slider-image">
								<div class="post-info">
									<h4>
										<a style="color: black;" href="#">과일로 간단하게 만들 수 있는 요리! </a>
									</h4>

								</div>
							</div>
							<div class="post">
								<img src="https://recipe1.ezmember.co.kr/cache/recipe/2021/01/22/3b2337e097db65122581a69d6f4a8e321.jpg" class="slider-image">
								<div class="post-info">
									<h4>
										<a style="color: black;" href="#">단언컨대 가장 완벽한 닭고기 음식들!</a>
									</h4>

								</div>
							</div>
							<div class="post">
								<img
									src="https://recipe1.ezmember.co.kr/cache/recipe/2021/01/22/545c9adc63d830df9b36d0b97b023bda1.jpg"
									class="slider-image">
								<div class="post-info">
									<h4>
										<a style="color: black;" href="#">편스토랑 메뉴들 총집합!</a>
									</h4>

								</div>
							</div>
							<div class="post">
								<img
									src="https://recipe1.ezmember.co.kr/cache/recipe/2021/01/22/f0052c15da83da76b26acf99443271da1.jpg"
									class="slider-image">
								<div class="post-info">
									<h4>
										<a style="color: black;" href="#">토마토를 이용한 맛깔나는 음식들 모음집</a>
									</h4>
								</div>
							</div>
						</div>
					</div>
					<!--post slider-->
				</div>

			</div>
			<div class="main_board">
				<div class="best_text">
					<img src="/resources/proimg/star.png" class="main_icon"><span
						class="icon_text">자유게시판</span>
				</div>
				<div class="free_board">
					<strong>인기글 Best5</strong><br> 진짜 광기의 국산 캐릭터.jpg (36)<br> 법무부, "나라 팔아먹는
					국적법 개정?... (30)<br> GS가 현 상황을 타개할 수 있는 유일...(27)<br> 어릴때
					학교에서 주던 존맛음료 (82)<br> 미국식 화장법 vs 한국식 화장법 (43)<br>
				</div>

			</div>
		</div>
		<div class="kakao_icon">
			<a id="channel-chat-button" href="#" onclick="void chatChannel();"><img src="/resources/proimg/kakao_icon.png"
				style="width: 66px;"></a>
		</div>
		<p id="token-result"></p>

	</div>

	<jsp:include page="include/footer.jsp" />
	<script src="/resources/projs/ex2.js"></script>
	<script src="/resources/projs/slick.js"></script>


</body>
</html>