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
<style>
header {
	background-color: #FF4500;
}
li{
list-style: none;
display: inline-block;
}
</style>
<meta charset="UTF-8">
<title>요들넷</title>
<script>
	$(document).ready(function() {
		var actionForm = $("#actionForm");
		$(".move").on("click",function(e) {
			e.preventDefault()
			actionForm.append("<input type='hidden' name='urrid' value='"	+ $(this).attr("href")+ "'/>")
			actionForm.attr("action","/project/urrecipe/get")
			actionForm.submit() 
		})
		
		$(".paginate_button a").on("click",	function(e) {
			e.preventDefault()
			console.log('click')
			actionForm.find('input[name="pageNum"]').val($(this).attr("href"))
			actionForm.submit()
		})
		
		$("#regBtn").on("click", function() {
			self.location = "/project/urrecipe/register"
		})
		 


	$.getJSON("/project/urrecipe/allImg",function(arr){
		//console.log(arr) 
		var str='' 
		var j =0
		var atr=[]
		for(var i =0; i<arr.length; i++){
			//console.log(arr[i].urrid)
			if(arr[i].num==0){
				console.log(arr[i].urrid)
				var fileCallPath = encodeURIComponent(arr[i].uploadPath+ arr[i].uuid+ "_"+ arr[i].filename);
				var originPath = arr[i].uploadPath+ "/"+ arr[i].uuid+ "_"+ arr[i].filename
				originPath = originPath.replace(new RegExp(/\\/g),"/")
				str ="<img class='main_image' src='/display?filename="+originPath+"' width='360px' height=='300px'>"
				atr.push(str)
				var txt='.list_img'+arr[i].urrid
				$(txt).html(atr[j])
	   			j++	
				}
		
			 
			}
	  })
	  
	   /*  $('.check').on('click', 'li', function() {
         // $(".checked").append("<li id=\'"+$(this).attr('id')+"\'>" + $(this).attr('id') + "</li>") 
         var tagid = $(this).attr('id')

         var rmtag = $('.checked>#' + tagid).attr('id')
         if (tagid===rmtag) {
            $('.checked>#' + rmtag).remove()
         }else{
         $(".checked").append("<li id=\'"+tagid+"\'>" + tagid + "</li>")
         }
      }) */
		$('.check').on('click',function(e){
			e.preventDefault()
			$('.checked').append("<button class='"+$(this).attr('class')+"'>"+$(this).attr('value')+"</button>")
			
		})
		
		
		
	})//document 끝
</script>
</head>
<body>
<jsp:include page="../include/header.jsp" flush="false" />
<!-- 태그해보자 -->
	<div class=container>
		<button class='check' value='이거'>이거</button>
		<button class='check' value='이거'>이거</button>
		<button class='check' value='이거'>이거</button>
		<button class='check' value='이거'>이거</button>
		<button class='check' value='이거'>이거</button>
		<button class='check' value='이거'>이거</button>	
	</div>
	<div class='container'>
		<div class='checked'>
			
		</div>
	</div>


<!-- 레시피 리스트 보여주는곳 -->
	<div>
		<p></p>
	</div>
	<div class='container'>
			<div >
			<p><c:out value='${pageMaker.total }'/>개의 결과가 검색됨</p>
			<button id='regBtn' type='button' >글쓰기</button>
			<div >
	<table>
		<c:forEach var='list' items='${list }' varStatus="i">
				<tr>
					<td>
					<a class='move' href="<c:out value='${list.urrid }'/>" >
					<div class='list_img<c:out value='${list.urrid}'/>'>대표사진이 없네요</div>
					</a>
					</td> 
					<td><a class='move' href="<c:out value='${list.urrid }'/>" ><c:out value='${list.urname }' /></a></td>
					<td><c:out value='${list.ursummary }' /></td>
				</tr>
		</c:forEach>
</table>	
</div>			
			</div>
	</div>

	<div class='pull-right'>
		<ul class='pagination'>
			<c:if test="${pageMaker.prev }">
				<li class='paginate_button previous'>
				<a href="${pageMaker.startPage-1 }">Previous</a></li>
			</c:if>
			<c:forEach var='num' begin='${pageMaker.startPage }'
				end='${pageMaker.endPage }'>
				<li class="paginate_button ${pageMaker.cri.pageNum==num?"active":""}">
					<a href="${num }">${num }</a>
				</li>
			</c:forEach>
			<c:if test="${pageMaker.next }">
				<li class='paginate_button next'><a
					href="${pageMaker.endPage+1 }">Next</a></li>
			</c:if>
		</ul>
	</div>
		<form id='actionForm' action='/recipe/list' method='get'>
		<input type='hidden' name='pageNum'	value='${pageMaker.cri.pageNum }'> 
		<input type='hidden' name='amount' value='${pageMaker.cri.amount }'> 
		<%-- <input type='hidden' name='type' value="${pageMaker.cri.type }">
		<input type="hidden" name="keyword"	value="${pageMaker.cri.keyword }"> --%>
	</form>
		<jsp:include page="../include/footer.jsp" />
</body>
</html>