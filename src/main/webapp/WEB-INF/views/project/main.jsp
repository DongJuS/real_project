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
	height: 250px;
}

.situational_recommend {
	margin: 0 auto;
	height: 250px;
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
	height: 220px;
	margin: 0px auto;
	overflow: hidden;
}

.post-slider .post-wrapper2 {
	width: 90%;
	height: 220px;
	margin: 0px auto;
	overflow: hidden;
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
}

.post-slider .post-wrapper2 .post .post-info {
	font-size: 15px;
	height: 30%;
	padding-left: 10px;
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
}
.kakao_icon{
position: fixed;
    bottom: 6px;
    right: 10px;
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
									src="https://recipe1.ezmember.co.kr/cache/recipe/2021/06/11/22f6278827685ecc50bdde1cb8b4cdc51.jpg"
									class="slider-image">
								<div class="post-info">
									<h4>
										<a href="#" class="post-subject">김치볶음밥 </a>
									</h4>
								</div>
							</div>
							<div class="post">
								<img
									src="https://recipe1.ezmember.co.kr/cache/recipe/2021/06/11/a2d3e08d10ea4992a0ed605b7c69d66d1.jpg"
									class="slider-image">
								<div class="post-info">
									<h4>
										<a href="#"> 계란말이 </a>
									</h4>
								</div>
							</div>
							<div class="post">
								<img
									src="https://recipe1.ezmember.co.kr/cache/recipe/2021/06/11/c642c221cdc7ddeaa01e236feb28815a1.jpg"
									class="slider-image">
								<div class="post-info">
									<h4>
										<a href="#">간장공장공장장 </a>
									</h4>

								</div>
							</div>
							<div class="post">
								<img
									src="https://recipe1.ezmember.co.kr/cache/recipe/2021/06/11/c642c221cdc7ddeaa01e236feb28815a1.jpg"
									class="slider-image">
								<div class="post-info">
									<h4>
										<a href="#">캐러셀개헬</a>
									</h4>

								</div>
							</div>
							<div class="post">
								<img
									src="https://recipe1.ezmember.co.kr/cache/recipe/2021/06/11/da40834e75235bc52032a615117b750b1.jpg"
									class="slider-image">
								<div class="post-info">
									<h4>
										<a href="#">믿을수없어</a>
									</h4>

								</div>
							</div>
							<div class="post">
								<img
									src="https://recipe1.ezmember.co.kr/cache/recipe/2021/06/11/da40834e75235bc52032a615117b750b1.jpg"
									class="slider-image">
								<div class="post-info">
									<h4>
										<a href="#">뽀잉</a>
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
						class="cttIcon b_r next2" style="top: 600px;"
						src="/resources/proimg/nexticon.png"></i>
				</div>
				<div class="page-wrapper">
					<!--page slider -->
					<div class="post-slider">

						<div class="post-wrapper2">
							<div class="post">
								<img
									src="https://recipe1.ezmember.co.kr/cache/recipe/2021/06/11/22f6278827685ecc50bdde1cb8b4cdc51.jpg"
									class="slider-image">
								<div class="post-info">
									<h4>
										<a href="#" class="post-subject">김치볶음밥 </a>
									</h4>
								</div>
							</div>
							<div class="post">
								<img
									src="https://recipe1.ezmember.co.kr/cache/recipe/2021/06/11/22f6278827685ecc50bdde1cb8b4cdc51.jpg"
									class="slider-image">
								<div class="post-info">
									<h4>
										<a href="#"> 계란말이 </a>
									</h4>
								</div>
							</div>
							<div class="post">
								<img src="/resources/proimg/star.png" class="slider-image">
								<div class="post-info">
									<h4>
										<a href="#">간장공장공장장 </a>
									</h4>

								</div>
							</div>
							<div class="post">
								<img src="/resources/proimg/star.png" class="slider-image">
								<div class="post-info">
									<h4>
										<a href="#">캐러셀개헬</a>
									</h4>

								</div>
							</div>
							<div class="post">
								<img
									src="https://recipe1.ezmember.co.kr/cache/recipe/2021/06/11/a2d3e08d10ea4992a0ed605b7c69d66d1.jpg"
									class="slider-image">
								<div class="post-info">
									<h4>
										<a href="#">믿을수없어</a>
									</h4>

								</div>
							</div>
							<div class="post">
								<img
									src="https://recipe1.ezmember.co.kr/cache/recipe/2021/06/11/a2d3e08d10ea4992a0ed605b7c69d66d1.jpg"
									class="slider-image">
								<div class="post-info">
									<h4>
										<a href="#">뽀잉</a>
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
					인기글 Best4<br> 진짜 광기의 국산 캐릭터.jpg (36)<br> 법무부, "나라 팔아먹는
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