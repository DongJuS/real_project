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
<link href="/resources/procss/ind_get.css" rel="stylesheet" type="text/css">

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
        operForm.find("#urrid").remove();
        operForm.attr("action", "/project/urrecipe/list");
        operForm.submit();
     });
      
     var urrid='<c:out value="${recipe.urrid}"/>'
     $.getJSON("/project/urrecipe/uploadFile",{urrid:urrid},function(arr){
    	 console.log(arr)
    	 
    	 var str=''
    	 var str2='' 
    	
    	var atr=[]
    	 console.log(atr[0])
    	
    	 for(var i =0; i<arr.length; i++){
		    //console.log(arr[i].num)   		 
    		 if(arr[i].num==0){
    	 		var fileCallPath = encodeURIComponent(arr[i].uploadPath+ arr[i].uuid+ "_"+ arr[i].filename);
    	 		var originPath = arr[i].uploadPath+ "/"+ arr[i].uuid+ "_"+ arr[i].filename
    	 		originPath = originPath.replace(new RegExp(/\\/g),"/")
    			str ="<img class='main_image' src='/display?filename="+originPath+"'>"
    			//debugger;
    			$('.uploadFile').html(str)
    		 }else if(arr[i].num==i){
				 //debugger;
    			 var fileCallPath = encodeURIComponent(arr[i].uploadPath+ arr[i].uuid+ "_"+ arr[i].filename);
    	    	 var originPath = arr[i].uploadPath+ "/"+ arr[i].uuid+ "_"+ arr[i].filename
    	    	 originPath = originPath.replace(new RegExp(/\\/g),"/")
    			 str2 ="<img class='main_image' src='/display?filename="+originPath+"'>"
    			atr.push(str2)
		    	 //console.log(atr[i-1])
		    	 var txt='.proce_img'+i
		    	 //console.log(txt)
    			$(txt).html(atr[i-1])  
    			
    		
    		 }
    	 
    	 //console.log(atr[0])
    	 }
    	 
    	
     })
     var csrfHeaderName="${_csrf.headerName}";
     var csrfTokenValue="${_csrf.token}";

     $(document).ajaxSend(function(e, xhr, options){
     	xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);  
       });
     
     
   
     })//document
     function likeClick(){		//좋아요 눌렀을 때 스크립트
     var csrfHeaderName="${_csrf.headerName}";
     var csrfTokenValue="${_csrf.token}";
  		//alert("클릭됨") 
  		var mem = '<sec:authorize access="isAuthenticated()"><sec:authentication property="principal.username"/></sec:authorize>'
  		if(mem!=''){
  			console.log("ajax작동")
  			  $.ajax({
  					url:"/project/urrecipe/getLike",
  					type:"get",
  					 beforeSend:function(xhr){
 		            	xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
 		            },
  					data: {uid : mem , rid : ${recipe.urrid} },
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
</script>

</head>
<body>

	<jsp:include page="../include/header.jsp" flush="false" />
	<div class="back_container">
		<div class="result_container">
			<p id="recipe_name">${recipe.urname}</p>
			<hr class="line1">
			<div class="cont">
				<p class="user_text">
					<img class="user_icon_img img" src="/resources/proimg/user_icon.png"> ${recipe.userid }
				</p>
				<div class='uploadFile'>
				
				</div>
				 
				<br>
				<p class="summary_text">${recipe.ursummary}<br>
					<br>
				</p>
			</div>
			<hr class="line1">
			<div class="cont">
				<p class="content_menutext">
					<strong style="font-size: 30px;">재료</strong>(4 / 5)
				</p>
				<div class="ings">
					<c:forEach var='ingre' items='${ingre}'>
						<div class="ing">
							<div class="ing_text">
								<strong>${ingre.urIngre_name}</strong><span class="ing_unitCount">/${ingre.urIngre_count}
									${ingre.urIngre_unit}</span>
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
							
					
							<span> ${proce.urtxt}</span>
							<div class='proce_img<c:out value='${i.count }'/>'>
							</div>
						</div>
						<%-- <img class="main_image img proceImg" src="${proce.pimg}"> --%>
					</c:forEach>
				</div>
			</div>
			
			<!-- 좋아요 부분 -->
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
									<img id="heart_icon" src="/resources/proimg/em_heart.png" onclick="likeClick()">
								</c:when>
								<c:when test="${yesOrNo==0}">
									<img id="heart_icon" src="/resources/proimg/em_heart.png" onclick="likeClick()">
								</c:when>
								<c:when test="${yesOrNo==1}">
									<img id="heart_icon" src="/resources/proimg/f_heart.png" onclick="likeClick()">
								</c:when>
							</c:choose>

						</div>
						<div class="like_right likeHR">
							<hr id="likeHRR" class="likehrs">
						</div>
					</div>
					
					

			
			
			<button data-oper='list'>List</button>
			<sec:authentication property="principal" var="pinfo"/>
			<sec:authorize access="isAuthenticated()">
      		<c:if test="${pinfo.username eq recipe.userid}">
			<button data-oper='modify'>수정</button>
			<button data-oper='delete'>삭제</button>
			</c:if>
      		</sec:authorize>
			 
			<!-- 컨테이너 끝 -->
			<br>


		</div>
		
		<!-- 댓글 -->
		
		<%-- 			<div class="reply_zone">

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
					</div>	 --%>	
	</div>



	<form id='operForm' action='/recipe/modify' method='get'>
		<input type='hidden' id='urrid' name='urrid' value='<c:out value="${recipe.urrid }" />'> 
		<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum }"/>'>
		<input type='hidden' name='amount' value='<c:out value="${cri.amount }"/>'>
		<%-- <input type="hidden" name="type" value="${cri.type }"> 
      <input type="hidden" name="keyword" value="${cri.keyword }"> --%>
	</form>

	<jsp:include page="../include/footer.jsp" />


</body>
</html>