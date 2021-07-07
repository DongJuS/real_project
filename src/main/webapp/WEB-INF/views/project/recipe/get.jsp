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
	min-width: 150px; border-radius : 8px; margin : 2px 1px;
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
.proce_num{
    border-radius: 50px;
    min-width: 27px;
    width: 27px;
    color: white;
    background-color: orange;
    font-size: 18px;
    font-weight: 600;
    display: inline-block;
}
.ing_unitCount{
font-size: 13px;
    color: #908d8d;
}
.proceImg{
    margin: 30px;
}
.content_menutext{
margin:10px;
}
.summary_text{
    width: 90%;
    margin: 0 auto;
}
</style>
<meta charset="UTF-8">
<title>요들넷</title>
<script>
<<<<<<< HEAD
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
=======
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
>>>>>>> dd11fdb156ac572c586e425654cd028653fc4376
</script>

</head>
<body>
	<jsp:include page="../include/header.jsp" flush="false" />
	<div class="back_container">
		<div class="result_container">
			<p id="recipe_name">${recipe.name}</p>
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
					<strong style="font-size: 30px;">재료</strong>(4 / 5)
				</p>
				<div class="ings">
				<c:forEach var='ingre' items='${ingre}'>
				<div class="ing">
						<div class="ing_text">
							<strong>${ingre.ingre_name}</strong><span class="ing_unitCount">/${ingre.ingre_count} ${ingre.ingre_unit}</span>
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
			</div>
			
			
			
			
			
			<!-- 컨테이너 끝 -->
	<br>
	<!-- 댓글 시작 -->

	<div class='container'>
		<div class='veiw_reply'>
			<div>
				<div class='media_reply_list'>
					<div>
						<h4>
							<strong>여기에 아이디</strong> 댓글단 시간
						</h4>
						<span>댓글 내용 내용 내용내용내용</span>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="panel-heading">
			<i class="fa fa-comments fa-fw"></i>Reply

			<button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>New
				Reply</button>

		</div>
		<div class="panel-body">
			<ul class="chat">
				<li class="left clearfix" data-rno="12">
					<div>
						<div class="header">
							<!-- <strong class="primary-font"> user00</strong> <small
									class="pull-right text-muted">2021-05-18-13:13</small> -->
						</div>
						<!-- <p>Good job</p> -->
					</div>
				</li>
			</ul>
		</div>
	</div>
	
	
	
	

		</div>
	</div>
	<%-- <div class='main_container'>
		<div id='view1'>
		
			<img src='<c:out value="${recipe.img }"/>' width='600px'>
		</div>
		<div id='view1'>
			<img src='/resources/img/장미.jpg' class="rounded-circle" width='100px'
				height='100px'><br> <span>유저 닉네임(유저 아이디)</span>
		</div>
		<div id='view1'>
			<h3>
				<c:out value="${recipe.name }" />
			</h3>
			<p>
				<c:out value="${recipe.summary }" />
			</p>

			<table class="table">
				<tr>
					<th colspan='3'><b>[재료]</b></th>
				</tr>
				<c:forEach var='ingre' items='${ingre}'>
					<tr>
						<td><c:out value='${ingre.ingre_name }' /></td>
						<td><c:out value='${ingre.ingre_count }${ingre.ingre_unit }' /></td>
						
					</tr>
				</c:forEach>
			</table>
		</div>
		<div id='detail_step'>
			<div>
				<b>[조리과정]</b> <span>steps</span>
			</div>
			<div class='row'>
				<c:forEach var='proce' items='${proce }'>
					<div class="col-xs-12 col-sm-6 col-md-8">
						<p><img src="<c:out value='${proce.pimg }'/>" width='300px'>
					</div>
					<div class="col-xs-6 col-md-4">
							<c:out value="${proce.txt }" />
					</div>
				</c:forEach>
			</div>

		</div>
		<button data-oper='list'>List</button>
		<br>
		<div class='row'>
			<div>
				<form>
					<button type="button" class="btn btn-primary">맛있어</button>
					<button type="button" class="btn btn-danger">난별로</button>
				</form>
			</div>
		</div>
	</div> --%>

	<%-- <form id='operForm' action='/recipe/modify' method='get'>
		<input type='hidden' id='rid' name='rid' value='<c:out value="${recipe.rid }" />'> 
		<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum }"/>'>
		<input type='hidden' name='amount'	value='<c:out value="${cri.amount }"/>'> 
<<<<<<< HEAD
		<input type="hidden" name="type" value="${cri.type }"> 
		<input type="hidden" name="keyword" value="${cri.keyword }">
	</form> --%>
	
	<jsp:include page="../include/footer.jsp" />
=======
		<%-- <input type="hidden" name="type" value="${cri.type }"> 
		<input type="hidden" name="keyword" value="${cri.keyword }"> --%>
	</form>
	<!-- 컨테이너 끝 -->
	<br>

		<jsp:include page="../include/footer.jsp" />
>>>>>>> dd11fdb156ac572c586e425654cd028653fc4376
</body>
</html>