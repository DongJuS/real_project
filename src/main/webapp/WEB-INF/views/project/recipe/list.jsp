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
			actionForm.append("<input type='hidden' name='rid' value='"	+ $(this).attr("href")+ "'/>")
			actionForm.attr("action","get")
			actionForm.submit() 
		})
		
		$(".paginate_button a").on("click",	function(e) {
			e.preventDefault()
			console.log('click')
			actionForm.find('input[name="pageNum"]').val($(this).attr("href"))
			actionForm.submit()
		})
		
		$("#regBtn").on("click", function() {
			self.location = "/project/recipe/register"
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
			<div class='row'>
			<p><c:out value='${pageMaker.total }'/>개의 결과가 검색됨</p>
			<!-- <button id='regBtn' type='button' >글쓰기</button> -->
	<table>
		<c:forEach var='list' items='${list }'>
				<tr>
				
					<td><a class='move' href="<c:out value='${list.rid }'/>" ><img src="<c:out value='${list.img }'/>" width='300px'></a></td> 
					<td><a class='move' href="<c:out value='${list.rid }'/>" ><c:out value='${list.name }' /></a></td>
					<td><c:out value='${list.summary }' /></td>
				</tr>
		</c:forEach>
</table>				
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
		<form id='actionForm' action='list' method='get'>
		<input type='hidden' name='pageNum'	value='${pageMaker.cri.pageNum }'> 
		<input type='hidden' name='amount' value='${pageMaker.cri.amount }'> 
		<%-- <input type='hidden' name='type' value="${pageMaker.cri.type }">
		<input type="hidden" name="keyword"	value="${pageMaker.cri.keyword }"> --%>
	</form>
		<jsp:include page="../include/footer.jsp" />
</body>
</html>