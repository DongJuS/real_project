<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="true"%>
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
a {
	text-decoration: none;
}

.main_bottom_container {
	width: 100%;
	display: inline-flex;
}

.main_bottom_content {
	width: 80%;
}

.main_board {
    width: 50%;
	margin: 0 auto;
	height: 250px;
}

.main_icon {
	width: 45px;
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

.p_wrapper{
	width: 90%;
	margin: 0px auto;
}

.p_wrapper a:link{
text-decoration: none;
	color: black;
}


.post-slider .p_wrapper a .post {
	height: 235px;
	margin: 0px 10px;
	background: #f1f1f2;
	border-radius: 10px;
	border: 1px solid #e2dede;
}

.post-slider .p_wrapper a .post .post-info {
	font-size: 15px;
	height: 30%;
	padding:10px 10px;
	text-align: center;
}
.post-slider .p_wrapper a .post .slider-image {
	width: 100%;
	height: 160px;
	border-radius: 10px;
	border: 1px solid #e2dede;
}

.best_text {
	display: inline-flex;
	margin: 20px 0 0 6%;
}
.best_text2 {
	display: inline-flex;
	margin: 20px 0 0 12%;
}

.cttIcon {
	width: 30px;
}

.free_board {
	margin-left: 50px;
}

.page-wrapper {
	min-width: 800px;
	position: relative;
	margin-top: 15px;
}

.kakao_icon {
	position: fixed;
	bottom: 6px;
	right: 10px;
}

ul {
	list-style: none;
}

h4 {
	margin-top: 5px;
}

.btn_wrapper {
	width: 3%;
	margin-left: 7%;
}

.btn_wrapper2 {
	width: 3%;
	margin-right: 7%;
}

.prev {
	margin: 120px 40%;
}

.next {
	margin: 120px 0%;
}

.goodIcon {
	width: 20px;
	height: 20px;
	border-radius: 10px;
}

.good_text {
	width: 50px;
	display: inline-flex;
	color: white;
	background: orange;
	border-radius: 10px;
	height: 20px;
	position: absolute;
	margin: -0.18% 0 0 -0.2%;
	border: 1px solid white;
}

.goodCount {
	margin: 0 auto;
	font-family: 'Jua';
	align-self: flex-end;
}
.text_img{
	height:27px;
	margin-top: 9px;
}
#user_recipe_and_board{
display: inline-flex;
    width: 100%;
}
.user_recipe{
width: 50%;
}
.text_guide{
color: darkgray;
    margin: 13px 0 0 7px;
    font-size: 13px;
}
</style>
</head>
<body>


	<jsp:include page="include/header.jsp" />

	<div class="main_bottom_container">
		<div class="btn_wrapper">

			<img class="cttIcon prev" id="prev1"
				src="/resources/proimg/previcon.png"> <img
				class="cttIcon prev" id="prev2" src="/resources/proimg/previcon.png">
				<img
				class="cttIcon prev" id="prev3" src="/resources/proimg/previcon.png">

		</div>

		<div class="main_bottom_content">

			<div class="best_menu">
				<div class="best_text">
					<img src="/resources/proimg/recipe_book.png" class="main_icon"><div
						class="icon_text"><img class="text_img" src="/resources/proimg/best_menu.png"></div>
						<div class="text_guide">* 추천수가 높은 레시피 목록입니다.</div>
				</div>

				<div class="page-wrapper">
					<!--page slider -->
					<div class="post-slider">
						<div class="post-wrapper p_wrapper">

							<c:forEach var='bestR' items='${bestRecipe}'>
								<a href='recipe/get?rid=${bestR.rid }'>
									<div class="post">
										<img class="slider-image" src="${bestR.img}">
										<div class='post-info'>
											<div class="good_text">
												<img class="goodIcon" src="/resources/proimg/good_icon.png"><span
													class="goodCount">${bestR.likecount}</span>
											</div>
											<h4>
												<span class="list_name">${bestR.name }</span>
											</h4>
										</div>
									</div>
								</a>
							</c:forEach>

						</div>
					</div>
					<!--post slider-->
				</div>
			</div>
			
			
			<div class="situational_recommend">
				<div class="best_text">
					<img src="/resources/proimg/recipe_book.png" class="main_icon"> <div class="icon_text"><img class="text_img" src="/resources/proimg/all_recipe.png"></div>
				<div class="text_guide">* 등록 순서에 따른 레시피 목록입니다.</div>
				</div>

				<div class="page-wrapper">
					<!--page slider -->
					<div class="post-slider">
						<div class="post-wrapper2 p_wrapper">
							<c:forEach var='list' items='${list}'>
							<a href='recipe/get?rid=${list.rid }'>
								<div class="post">
									 <img
										class="slider-image" src="${list.img}">
									<div class='post-info'>
										<h4>
											${list.name }
										</h4>
									</div>
								</div></a>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
			
			
			<div class="min_ingre_recipes">
				<div class="best_text">
					<img src="/resources/proimg/recipe_book.png" class="main_icon">
					<div class="icon_text"><img class="text_img" src="/resources/proimg/easy_recipe.png"></div>
				<div class="text_guide">* 필요한 재료 수가 적은 레시피 목록입니다.</div>
				</div>
				<div class="page-wrapper">
					<div class="post-slider">
						<div class="post-wrapper3 p_wrapper">
							<c:forEach var='minRecipe' items='${minR}'>
							<a href='recipe/get?rid=${minRecipe.rid }'>
									<div class="post">
										<img class="slider-image" src="${minRecipe.img}">
										<div class='post-info'>
										<div class="good_text">
												<span
													class="goodCount">${minRecipe.ingcount}개</span>
											</div>
											<h4>
												<span class="list_name">${minRecipe.name }</span>
											</h4>
										</div>
									</div>
								</a>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
			
			<div id="user_recipe_and_board">
			
			<div class="main_board">
				<div class="best_text2">
					<img src="/resources/proimg/board_icon.png" class="main_icon"> <a
						href='/board/list'><div class="icon_text"><img class="text_img" src="/resources/proimg/free_board.png"></div></a>
				</div>
				<div class="free_board">
					<ul>
						<c:forEach var='board' items='${board }'>
							<li><a href='/board/get?bno=<c:out value="${board.bno }"/>'>
									<c:out value='${board.title }' />
							</a></li>

						</c:forEach>
					</ul>
				</div>

			</div>
			<div class="user_recipe">
			<div class="best_text2">
					<img src="/resources/proimg/recipe_book.png" class="main_icon"> <a
						href='urrecipe/list'><div class="icon_text"><img class="text_img" src="/resources/proimg/user_recipe.png"></div></a>
				<div class="text_guide">* 유저가 직접 등록한 레시피 목록입니다.</div>
				</div>
			</div>
			</div>
		</div>

		<div class="btn_wrapper2">
			<img class="cttIcon next" id="next1"
				src="/resources/proimg/nexticon.png"> <img
				class="cttIcon next" id="next2" src="/resources/proimg/nexticon.png">
				<img
				class="cttIcon next" id="next3" src="/resources/proimg/nexticon.png">

		</div>


		<div class="kakao_icon">
			<a id="channel-chat-button" href="#" onclick="void chatChannel();"><img
				src="/resources/proimg/kakao_icon.png" style="width: 66px;"></a>
		</div>
		<p id="token-result"></p>

	</div>



	<jsp:include page="include/footer.jsp" />
	<!-- <script src="/resources/projs/ex2.js"></script>
	<script src="/resources/projs/slick.js"></script> -->
	<script>
		$(document).ready(function() {
			$('.post-wrapper').slick({
				slidesToShow : 4,
				slidesToScroll : 2,
				autoplay : true,
				autoplaySpeed : 10000,
				nextArrow : $('#next1'),
				prevArrow : $('#prev1')
			});
			$('.post-wrapper2').slick({
				slidesToShow : 4,
				slidesToScroll : 2,
				autoplay : true,
				autoplaySpeed : 10000,
				nextArrow : $('#next2'),
				prevArrow : $('#prev2')
			});
			$('.post-wrapper3').slick({
				slidesToShow : 4,
				slidesToScroll : 2,
				autoplay : true,
				autoplaySpeed : 10000,
				nextArrow : $('#next3'),
				prevArrow : $('#prev3')
			});
			
			
		})
	</script>

</body>
</html>