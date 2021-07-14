<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="/resources/procss/ind_get.css" rel="stylesheet"
	type="text/css">

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
.back_container{
width: 80%;
    margin: -10px auto;
     background-color: white;
}
.recipe_name_wrapper{

}
.bottom_grayCont{
 background-color: #f1f1f2;
}
hr{
width: 95%;
}
.result_container{
    border: 1px solid #e2dede;
}
#like_button{
	border: 1px solid black;
	width: 100px;
    height: 100px;
    margin: auto;
    border-radius: 20px;
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
   
var like_button = document.getElementById("like_button");
	like_button.onclick= function(){changeHeart();}
	

   
</script>

</head>
<body>

	<jsp:include page="../include/header.jsp" flush="false" />
	<div class="bottom_grayCont">
	<div class="back_container">
		<div class="result_container">
		<div class="recipe_name_wrapper">
			<p id="recipe_name"><span style="
    color: lightgray;
        font-size: 15px;
			">No.${recipe.rid}</span> ${recipe.name}</p></div>
			<hr class="line1">
			<div class="cont">
				<p class="user_text">
					<img class="user_icon_img img" src="/resources/proimg/user_icon.png">
					유저 닉네임
				</p>
				<img class="main_image img proceImg" src="${recipe.img}" /><br> <br>
				<p class="summary_text">${recipe.summary}<br><br></p>


	

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
							<strong>${ingre.ingre_name}</strong><span class="ing_unitCount"> / ${ingre.ingre_count} ${ingre.ingre_unit}</span>
						</div>
					</div>
				</c:forEach>
				</div>
				<br><hr class="line1">
				<div class="cont">
				<p class="content_menutext">
					<strong style="font-size: 30px;">조리과정</strong>
				</p>
				
				
				<c:forEach var='proce' items='${proce}' varStatus="i">
				<div class="proce_numtxt"><div class="proce_num">${i.count}</div><span> ${proce.txt}</span></div>
				<img class="main_image img proceImg" src="${proce.pimg}">
				</c:forEach>
				</div>
				
				<div id="like_button">${countLike}</div>
			</div>
			</div>
			</div></div>
			
			
			
			
			
			<!-- 컨테이너 끝 -->
	<br>
	<!-- 댓글 시작 -->

   <form id='operForm' action='/recipe/modify' method='get'>
      <input type='hidden' id='rid' name='rid' value='<c:out value="${recipe.rid }" />'> 
      <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum }"/>'>
      <input type='hidden' name='amount'   value='<c:out value="${cri.amount }"/>'> 
	</form>

	<jsp:include page="../include/footer.jsp" />


</body>
</html>