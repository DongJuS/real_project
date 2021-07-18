<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>sample/all</h1>
<p>principal: <sec:authentication property="principal"/></p>
<p>MemberVO: <sec:authentication property="principal.member"/></p>
<p>사용자 이름: <sec:authentication property="principal.member.username"/></p>
<p>사용자 아이디: <sec:authentication property="principal.username"/></p>
<p>사용자권한 리스트: <sec:authentication property="principal.member.authList"/></p>

</body>
</html>