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
				    	 console.log(arr)
				    	
				    	 var str=''
				    	 var str2='' 
				    	
				    	var atr=[]
				    	 //console.log(atr[0])
				    	 for(var i =0; i<arr.length; i++){
						    //console.log(arr[i].num)
				    		 //console.log(arr[i].urrid)
				    		 //var iurrid=arr[i].urrid
				    		// if(urrid==iurrid){
				    		 if(arr[i].num==0){
				    	 		var fileCallPath = encodeURIComponent(arr[i].uploadPath+ arr[i].uuid+ "_"+ arr[i].filename);
				    	 		var originPath = arr[i].uploadPath+ "/"+ arr[i].uuid+ "_"+ arr[i].filename
				    	 		originPath = originPath.replace(new RegExp(/\\/g),"/")
				    			str ="<img class='main_image' src='/display?filename="+originPath+"'>"
				    			atr.push(str)
				    		 }
				    		 
				    			var txt='.list_img'+i
				    			//console.log(txt)
				    			//console.log(atr[4])
				    			$(txt).html(atr[i])
				    			
				    		
				    	 
				    	 }
				    	 //console.log(atr[1])
				     })
		 
		
		
		
		
		
	})//document 끝
</script>
</head>
<body>
<jsp:include page="../include/header.jsp" flush="false" />
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
					<div class='list_img<c:out value='${i.count }'/>'>dd</div>
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