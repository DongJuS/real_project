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
<title>요들넷</title>
<script>


$(document).ready(function() {  
    var operForm = $("#operForm");
    $('button[data-oper="modify"]').on('click',function(e){
	 operForm.attr('action',"/project/urrecipe/modify").submit()
	 
   }) 
    $('button[data-oper="delete"]').on("click",function(e) {
     operForm.attr("action", "/project/urrecipe/remove").submit();
      }); 
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
    	 //console.log(atr[0])
    		var k =0
    	 for(var i =0; i<arr.length; i++){
    		 //debugger;
		   for(var j =1; j<arr.length; j++){   		 
    		 if(arr[i].num==0){
    	 		var fileCallPath = encodeURIComponent(arr[i].uploadPath+ arr[i].uuid+ "_"+ arr[i].filename);
    	 		var originPath = arr[i].uploadPath+ "/"+ arr[i].uuid+ "_"+ arr[i].filename
    	 		originPath = originPath.replace(new RegExp(/\\/g),"/")
    			str ="<img class='main_image' src='/display?filename="+originPath+"'>"
    			//debugger;
    			$('.uploadFile').html(str)
    		 }else if(arr[i].num==j){
				// debugger;
    			 var fileCallPath = encodeURIComponent(arr[i].uploadPath+ arr[i].uuid+ "_"+ arr[i].filename);
    	    	 var originPath = arr[i].uploadPath+ "/"+ arr[i].uuid+ "_"+ arr[i].filename
    	    	 originPath = originPath.replace(new RegExp(/\\/g),"/")
    			 str2 ="<img class='main_image' src='/display?filename="+originPath+"'>"
    			 atr.push(str2)
		    	 var txt='.proce_img'+j
		    	 //console.log(atr[i])
    			 $(txt).html(atr[k])
    			 k++
    		 }
    		}
    	 }  	
     })
     
     
     })//document

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
					<img class="user_icon_img img" src="/resources/proimg/user_icon.png"> 유저 닉네임
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




			<button data-oper='list'>List</button>
			<button data-oper='modify'>수정</button>
			<button data-oper='delete'>삭제</button>
			<!-- 컨테이너 끝 -->
			<br>


		</div>
	</div>



	<form id='operForm' action='/urrecipe/remove' method='get'>
		<input type='hidden' id='urrid' name='urrid' value='<c:out value="${recipe.urrid }" />'> 
	 	<%-- <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum }"/>'>
		<input type='hidden' name='amount' value='<c:out value="${cri.amount }"/>'> --%>  
		<%-- <input type="hidden" name="type" value="${cri.type }"> 
      <input type="hidden" name="keyword" value="${cri.keyword }"> --%>
	</form>


	<jsp:include page="../include/footer.jsp" />


</body>
</html>