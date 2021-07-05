<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>getpage</h4>

	<table>
		<tr>
			<td><c:out value='${recipe.name }' /></td>
		</tr>
		<tr>
			<td><img src="<c:out value='${recipe.img }'/>"></td>
		</tr>
		<tr>
			<td><c:out value="${recipe.summary }" /></td>
		</tr>

	</table>

	
	<table>
		<c:forEach var='ingre' items='${ingre}'>
			<tr>				
				<td><c:out value='${ingre.ingre_name }' /></td>
				<td><c:out value='${ingre.ingre_count }'/></td>
				<td><c:out value='${ingre.ingre_unit }'/></td>
			</tr>
			</c:forEach>
	</table>
	
	<c:forEach var='proce' items='${proce }'>
	<table>
		<tr>
			<td><c:out value="${proce.txt }" /></td>
			<td><img src="<c:out value='${proce.pimg }'/>"></td>
		</tr>
	</table>
	</c:forEach>

</body>
</html>