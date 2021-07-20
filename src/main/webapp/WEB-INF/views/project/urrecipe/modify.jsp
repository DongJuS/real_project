<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
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
	width: 50%;
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
</style>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="/resources/procss/ind_get.css" rel="stylesheet" type="text/css">

<title>요들넷</title>
<script>
$(document).ready(function(){
	 var operForm = $("#operForm");
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
 
 	$('#ingreplus').on('click', function(e) {
			e.preventDefault()
			var str = ''
			str +="<div class='ing'>"
			str +="<div class='ing_text'>"
			str += "<input type='text' placeholder='재료재료이름' name='urIngre_name'>"
			str += " <input type='text' placeholder='이정도' name='urIngre_count'>"
			str += " <input type='text' placeholder='넣으셈' name='urIngre_unit'><br>"
			str += "</div>"
			str +="</div>"
			$(".ing1").append(str)
		})
 
		$('#proceplus').on('click', function(e) {
			e.preventDefault()
			var str = ''	
			str += "<input type='text' placeholder='요래요래하시라' name='urtxt'>"
			str += " <input type='file'  id='uploadFile1'  accept='image/*'><br>"			
			$('.proceplus').append(str)
		})
		
		
})//document
 
</script>

</head>
<body>
<jsp:include page="../include/header.jsp" flush="false" />
	<div class="back_container">
	<form action='/project/urrecipe/modify' method='post'>
		<div class="result_container">
			<hr class="line1">
			<div class="cont">
				<p class="user_text">
					<img class="user_icon_img img" src="/resources/proimg/user_icon.png"> 유저 닉네임
				</p>
				<div class='uploadFile'>
				</div>
				대표 사진<input type='file' id='uploadFile' accept='image/*'/>
				<br>
				요리 제목 <input type='text' id="recipe_name" placeholder='${recipe.urname}'>
				<br>
				소개 <input type='text' id="summary_text" placeholder='${recipe.ursummary}'><br>
					<br>
				
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
								<input type='text' value="${ingre.urIngre_name}">
								<input type='text' value="${ingre.urIngre_count}">
								<input type='text' value="${ingre.urIngre_unit}">
							</div>
						</div>
					</c:forEach>	
						<div class='ing1'>
						
						</div>		
					<button id='ingreplus'>재료추가</button>
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
							<input type='text' value=' ${proce.urtxt}'>
							<div class='proce_img<c:out value='${i.count }'/>'>
							</div>
						</div>
					</c:forEach>
					<div class='proceplus'>
					</div>
					<button id='proceplus'>추가</button>
				</div>
			</div>




			<button data-oper='list'>List</button>
			<button data-oper='modify'>수정</button>
			<!-- 컨테이너 끝 -->
			<br>

		<input type='hidden' id='urrid' name='urrid' value='<c:out value="${urrecipe.urrid }" />'> 
		<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum }"/>'>
		<input type='hidden' name='amount' value='<c:out value="${cri.amount }"/>'>

		</div>
		</form>
	</div>


	

	<jsp:include page="../include/footer.jsp" />
</body>
</html>