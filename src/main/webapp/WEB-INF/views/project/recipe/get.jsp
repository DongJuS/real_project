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

tr {
	text-align: center;
}

#view1 {
	text-align: center;
}

li {
	display: none;
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
        operForm.attr("action", "/project/recipe/list");
        operForm.submit();
     });
})
</script>
</head>
<body>
<jsp:include page="../include/header.jsp" flush="false" />
	<div><p></p></div>
	<div class='container'>
		<div id='view1'>
			<img src='<c:out value="${recipe.img }"/>' width='600px'>
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
						<td><c:out value='${ingre.ingre_count }' /></td>
						<td><c:out value='${ingre.ingre_unit }' /></td>
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
	</div>

	<form id='operForm' action='/recipe/modify' method='get'>
		<input type='hidden' id='rid' name='rid' value='<c:out value="${recipe.rid }" />'> 
		<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum }"/>'>
		<input type='hidden' name='amount'	value='<c:out value="${cri.amount }"/>'> 
		<%-- <input type="hidden" name="type" value="${cri.type }"> 
		<input type="hidden" name="keyword" value="${cri.keyword }"> --%>
	</form>
	<!-- 컨테이너 끝 -->
	<br>

		<jsp:include page="../include/footer.jsp" />
</body>
</html>