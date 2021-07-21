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
ㅎㅇㅎㅇ
<br>댓글내용은 <%=request.getParameter("content") %>
<br>유저아이디는 <%=request.getParameter("userId") %>
<br>글번호는 <%=request.getParameter("rid") %>
<br>댓글출력테스트2
${rvoList }
<c:forEach var='rvo' items='${rvoList}'>
${rvo.rid}
</c:forEach>
</body>
</html>