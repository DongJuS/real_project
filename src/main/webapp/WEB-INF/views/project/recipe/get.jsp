<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


<style>
header {
	background-color: #FF4500;
}

tr {
	text-align: center;
}

#view1 {
	text-align: center;
}

li {
	display: none;
}

#recipe_name {
	text-align: center;
	font-size: 24px;
	margin: 10px;
}

.user_text {
	text-align: end;
	font-size: 11px;
	margin-right: 10px;
}

.user_icon_img {
	width: 30px;
}

.main_image {
	width: 70%;
	max-width: 700px;
}

.cont {
	text-align: center;
}

.ing {
	border: 1px solid #dddddd;
	min-width: 150px;
	border-radius: 8px;
	margin: 2px 1px;
	display: inline-block;
	text-align: center;
	border-radius: 8px;
	margin: 2px 1px;
}

.ings {
	margin: 30px;
}

.ing_text {
	margin: auto;
	padding: 7px 25px;
}

.proce_num {
	border-radius: 50px;
	min-width: 27px;
	width: 27px;
	color: white;
	background-color: orange;
	font-size: 18px;
	font-weight: 600;
	display: inline-block;
}

.ing_unitCount {
	font-size: 13px;
	color: #908d8d;
}

.proceImg {
	margin: 30px;
}

.content_menutext {
	margin: 10px;
}

.summary_text {
	width: 90%;
	margin: 0 auto;
}

#recipe_name {
	text-align: center;
	font-size: 24px;
	margin: 10px;
}

.user_text {
	text-align: end;
	font-size: 11px;
}

.user_icon_img {
	width: 30px;
}

.main_image {
	width: 70%;
}

.cont {
	text-align: center;
}

.ing {
	border: 1px solid #dddddd;
	min-width: 150px;
	border-radius: 8px;
	margin: 2px 1px;
	display: inline-block;
	text-align: center;
	border-radius: 8px;
	margin: 2px 1px;
}

.ings {
	margin: 30px;
}

.ing_text {
	margin: auto;
	padding: 7px 25px;
}

.proce_num {
	border-radius: 50px;
	min-width: 27px;
	width: 27px;
	color: white;
	background-color: orange;
	font-size: 18px;
	font-weight: 600;
	display: inline-block;
}

.ing_unitCount {
	font-size: 13px;
	color: #908d8d;
}

.proceImg {
	margin: 30px;
}

.content_menutext {
	margin: 10px;
}

.summary_text {
	width: 90%;
	margin: 0 auto;
}

.back_container {
	width: 80%;
	margin: -10px auto;
	background-color: white;
}

.recipe_name_wrapper {
	
}

.bottom_grayCont {
	background-color: #f1f1f2;
}

hr {
	width: 95%;
}

.result_container {
	border: 1px solid #e2dede;
}

#like_button {
	border: groove;
	width: 100px;
	height: 100px;
	margin: auto;
	border-radius: 20px;
}

#likeCount {
	font-size: 28px;
	padding: 2px;
}

#heart_icon {
	width: 35px;
	cursor: pointer;
}

.like_zone {
	display: inline-flex;
	width: 100%;
}

.likeHR {
	width: 45%;
	align-self: center;
}

.likehrs {
	border: solid 1px #e2dede;
}

#likeHRL {
	margin-left: unset;
}

#likeHRR {
	margin-right: unset;
}

.reply_zone {
	text-align: start;
}

.reply_hr {
	width: 100%;
}

.reply_timestamp {
	margin-left: auto;
}

.reply_userinfo {
	display: flex;
}

.user_reply {
	padding: 0 15px;
}

.reply_content {
	margin: 15px 5px;
}

.reply_top {
	margin-left: 20px;
}

#reply_count {
	color: gray;
	font-size: 14px;
}

#reply_textarea {
	width: 80%;
	margin-left: 10%;
	height: 80px;
	border-radius: 15px 0 0 15px;
	padding: 6px;
}

#reply_submit {
	margin-right: 10%;
	background: orange;
	color: white;
	border: darksalmon;
	border-radius: 0 15px 15px 0;
	text-shadow: 1px 1px black;
}

.write_area {
	display: flex;
}

.reply_write {
	margin: 30px 0;
}
.deleteText{
font-size: 12px;
    color: darkgray;
    cursor: pointer;
}
</style>
<meta charset="UTF-8">
<title>요들넷</title>
<script>
	$(document).ready(function() {
		var operForm = $("#operForm");
		/*   $('button[data-oper="modify"]').on("click",function(e) {
		   operForm.attr("action", "/board/modify").submit();
		    }); */
		$('button[data-oper="list"]').on("click", function(e) {
			operForm.find("#rid").remove();
			operForm.attr("action", "/recipe/list");
			operForm.submit();
		});
	})

	$(document).ready(function() {
		var operForm = $("#operForm");
		/*   $('button[data-oper="modify"]').on("click",function(e) {
		   operForm.attr("action", "/board/modify").submit();
		    }); */
		$('button[data-oper="list"]').on("click", function(e) {
			operForm.find("#rid").remove();
			operForm.attr("action", "/project/recipe/list");
			operForm.submit();
		});
	})

	$(document).ready(function() {
		var operForm = $("#operForm");
		/*   $('button[data-oper="modify"]').on("click",function(e) {
		   operForm.attr("action", "/board/modify").submit();
		    }); */
		$('button[data-oper="list"]').on("click", function(e) {
			operForm.find("#rid").remove();
			operForm.attr("action", "list");
			operForm.submit();
		});
	})

	
	function likeClick(){		//좋아요 눌렀을 때 스크립트
		/* alert("클릭됨") */
	
		 var mem='<sec:authorize access="isAuthenticated()"><sec:authentication property="principal.username"/></sec:authorize>'
		
		if(mem!=''){
			console.log("ajax작동")
			  $.ajax({
					url:"getLike",
					type:"get",
					data: {uid : mem , rid : ${recipe.rid} },
					success:function(toggleLike){
						var yn = toggleLike.yesNo;
						console.log(toggleLike.likeSum)
						$('#likeCount').html(toggleLike.likeSum);
						let img1 = document.getElementById('heart_icon');
						if(yn==0){
							img1.src = "/resources/proimg/em_heart.png";
						}
						else{
							img1.src = "/resources/proimg/f_heart.png";
						}
						
					}
				})  
		}
		else{
			var moveToLogin = confirm('로그인 후 이용이 가능한 서비스입니다.\n[확인]을 누르시면 로그인 페이지로 이동합니다.')
			if(moveToLogin){
				location.href="/customLogin"
			}
		}
		
		
	}
	
	
	function replyInsert(){		//댓글입력 눌렀을 때 스크립트
		var mem='<sec:authorize access="isAuthenticated()"><sec:authentication property="principal.username"/></sec:authorize>'

		
		//var mem ='' 
		
		var formData = $("#replyForm").serialize();
		/* console.log(formData)
		console.log(typeof(formData)) */
		
		if(mem!=''){
			 console.log("댓글작성ajax")
			$.ajax({
				cache: false,
				url:"replyInsert",
				type:"POST",
				data: formData,
				success:function(text11){
					window.location.reload()
				},
				error:function(error){
					alert('에러발생!'+error)
				}
				
			}); 
		}
		else{
			var moveToLogin = confirm('로그인 후 작성이 가능합니다.\n[확인]을 누르시면 로그인 페이지로 이동합니다.')
			if(moveToLogin){
				location.href="/customLogin"
			}
		}
		
	}
	
	function replyUpdateInput(rid,userId,replyNo){		//댓글 수정 후 입력 눌렀을 때 스크립트
		console.log('드러옴요'+replyNo)
		var formData = $("#replyForm"+replyNo).serialize();
	
		formData= formData+"&rid="+rid
		formData= formData+"&userId="+userId
		formData= formData+"&replyNo="+replyNo
		/* console.log(formData)
		console.log(typeof(formData)) */
		$.ajax({
			cache: false,
			url:"replyUpdate",
			type:"POST",
			data: formData,
			success:function(){
				window.location.reload() 
			},
			error:function(error){
				alert('에러발생!'+error)
			}
		})
	}
	
	function replyDelete(rid,userId,replyNo){		//댓글 삭제 기능
		var doDelete = confirm('해당 댓글을 삭제하시겠습니까?')
		if(doDelete){
			 /* alert('삭제됨')  */
			$.ajax({
				url:"replyDelete",
				type:"get",
				data:{rid: rid, userId:userId, replyNo:replyNo},
				success:function(){
					/* alert('삭제완료') */
					 window.location.reload()
				},
				error:function(){
					alert('에러발생!')
				}
			})
		}
		else if(!doDelete){
			/* alert('삭제 취소') */
			
		}
		/* alert("rid는 :"+rid+"userID는 : "+userId+"댓글번호는 : "+replyNo) */
		
		
	}
	
	function replyUpdate(rid,userId,replyNo,content){		//댓글 수정 기능
		/* alert(rid+'이랑'+userId+'이랑'+replyNo) */
		$('#updateBtn'+replyNo).html('수정취소')
		/* $('#updateBtn'+replyNo).setAttribute('id','updateCancelBtn'+replyNo) */
		/* document.getElementsById('updateBtn'+replyNo).id ='updateCancleBtn'+replyNo */
		/* $('#updateBtn'+replyNo).id('updateCancleBtn'+replyNo) */
		var btn = document.getElementById('updateBtn'+replyNo)
		btn.id = 'updateCancleBtn'+replyNo;
		btn.setAttribute("onclick","returnBefore("+rid+","+userId+","+replyNo+",'"+content+"')");
		
		
		/* onclick="replyUpdate(${rvo.rid},${rvo.userId},${rvo.replyNo},'${rvo.content}')" */
		
		$('#content'+replyNo).html(
				'<form id="replyForm'+replyNo+'" action="replyUpdate" method="post">'+
				'<div class="reply_write">'+
				'<div class="write_area">'+
				'<textarea id="reply_textarea" name="content">'+content+'</textarea>'+
				'<input id="reply_submit" type="button" onclick="replyUpdateInput('+rid+','+userId+','+replyNo+')" value="댓글입력">'+
				'</div></div></form>')
	}
	
	function returnBefore(rid,userId,replyNo,content){
		console.log(rid+userId+replyNo+content) 
		$('#content'+replyNo).html(content)
		$('#updateCancleBtn'+replyNo).html('수정')
		var btn = document.getElementById('updateCancleBtn'+replyNo)
		btn.id = 'updateBtn'+replyNo
		btn.setAttribute("onclick","replyUpdate("+rid+","+userId+","+replyNo+",'"+content+"')");
	}
	
	$('#reply_textarea').keyup(function(){
		var txt = (this).val();
		if(txt!=''){
			console.log('들어왔낭?ㅎ')
		}
		
		
	})
	/* $('#heart_icon').click(function(){
		
	}) */
</script>

</head>

<body>


	<jsp:include page="../include/header.jsp" flush="false" />
	<div class="bottom_grayCont">
		<div class="back_container">
			<div class="result_container">
				<div class="recipe_name_wrapper">
					<p id="recipe_name">
						<span style="color: lightgray; font-size: 15px;">No.${recipe.rid}</span>
					${recipe.name }</p>
				</div>
				<hr class="line1">
				<div class="cont">
					<p class="user_text">
						<img class="user_icon_img img"
							src="/resources/proimg/user_icon.png"><span>${recipe.userid }</span> 
					</p>
					<img class="main_image img proceImg" src="${recipe.img}" /><br>
					<br>
					<p class="summary_text">${recipe.summary}<br> <br>
					</p>
					



				</div>
				<hr class="line1">
				<div class="cont">
					<p class="content_menutext">

						<strong style="font-size: 30px;">재료 </strong>(4 / 5)
					</p>
					<div class="ings">
						<c:forEach var='ingre' items='${ingre}'>
							<div class="ing">
								<div class="ing_text">
									<strong>${ingre.ingre_name}</strong><span class="ing_unitCount">
										/ ${ingre.ingre_count} ${ingre.ingre_unit}</span>
								</div>
							</div>
						</c:forEach>
					</div>
					<br>
					<hr class="line1">
					<div class="cont">
						<p class="content_menutext">
							<strong style="font-size: 30px;">조리과정</strong>
						</p>


						<c:forEach var='proce' items='${proce}' varStatus="i">
							<div class="proce_numtxt">
								<div class="proce_num">${i.count}</div>
								<span> ${proce.txt}</span>
							</div>
							<img class="main_image img proceImg" src="${proce.pimg}">
						</c:forEach>
					</div>
					<div class="like_zone">
						<div class="like_left likeHR">
							<hr id="likeHRL" class="likehrs">
						</div>
						<div id="like_button">
							<div id="likeCount">
								<c:choose>
									<c:when test="${countLike==null}">0</c:when>
									<c:when test="${countLike!=null}">${countLike}</c:when>
								</c:choose>
							</div>
							<c:choose>
								<c:when test="${yesOrNo==null}">
									<img id="heart_icon" src="/resources/proimg/em_heart.png"
										onclick="likeClick()">
								</c:when>
								<c:when test="${yesOrNo==0}">
									<img id="heart_icon" src="/resources/proimg/em_heart.png"
										onclick="likeClick()">
								</c:when>
								<c:when test="${yesOrNo==1}">
									<img id="heart_icon" src="/resources/proimg/f_heart.png"
										onclick="likeClick()">
								</c:when>
							</c:choose>

						</div>
						<div class="like_right likeHR">
							<hr id="likeHRR" class="likehrs">
						</div>
					</div>

					<div class="reply_zone">

						<div>
							<hr class="reply_hr">
							<div class="reply_top">
								댓글<span id="reply_count">(12)</span>
							</div>
							<hr class="reply_hr">
						</div>
						<!-- 리플 한개 시작 -->
						<!-- <div class="user_reply">
							<div class="reply_userinfo">
								<div>
									<img class="user_icon_img img"
										src="/resources/proimg/user_icon.png"><span>뜨거운여름은</span>
								</div>
								<div class="reply_timestamp">2021.07.14 AM10:25</div>
							</div>
							<div class="reply_content">호박전 너무 맛있겠음! 언젠가 꼭 해먹을테당</div>
							<hr class="reply_hr">
						</div> -->
						<!-- 리플 한개 끝 -->
						
						
						<!-- 리플 반복문 시작 -->
						<c:forEach var='rvo' items='${rvoList}'>
						<div class="user_reply">
							<div class="reply_userinfo">
								<div>
									<img class="user_icon_img img" src="/resources/proimg/user_icon.png">
										<span>${rvo.userId}</span>
										<c:if test="${rvo.userId==member.id}">
										<span class="deleteText" id="updateBtn${rvo.replyNo}" onclick="replyUpdate(${rvo.rid},${rvo.userId},${rvo.replyNo},'${rvo.content}')">수정</span> 
										<span class="deleteText" onclick="replyDelete(${rvo.rid},${rvo.userId},${rvo.replyNo})">삭제</span>
										</c:if>
								</div>
								<div class="reply_timestamp">${rvo.regDate}</div>
							</div>
							<div class="reply_content" id="content${rvo.replyNo}">${rvo.content}</div>	
						</div>
						<hr class="reply_hr">
						</c:forEach>
						<!-- 리플 반복문 끝 -->
						

						<!-- 덧글작성창 시작 -->
						<form id="replyForm" action="replyInsert" method="post">
							<div class="reply_write">
								<div class="write_area">
								<c:choose>
								<c:when test="${empty member.id}"><textarea id="reply_textarea" name="content"
										placeholder="댓글 작성은 로그인 후 이용이 가능합니다." readonly></textarea></c:when>
								<c:otherwise><textarea id="reply_textarea" name="content"
										placeholder="댓글을 입력해 주세요."></textarea></c:otherwise>
								</c:choose>
									
									<input id="reply_submit" type="button" onclick="replyInsert()" value="댓글입력">
								</div>
							</div>
							<input type="hidden" name="userId" value="${member.id}">
							<input type="hidden" name="rid" value="${recipe.rid}">
						</form>
						<!-- 덧글작성창 끝 -->
					</div>
				</div>
			</div>


		</div>
	</div>





	<!-- 컨테이너 끝 -->
	<br>
	<!-- 댓글 시작 -->

	<form id='operForm' action='/recipe/modify' method='get'>
		<input type='hidden' id='rid' name='rid'
			value='<c:out value="${recipe.rid }" />'> <input
			type='hidden' name='pageNum' value='<c:out value="${cri.pageNum }"/>'>
		<input type='hidden' name='amount'
			value='<c:out value="${cri.amount }"/>'>
	</form>

	<jsp:include page="../include/footer.jsp" />


</body>
</html>