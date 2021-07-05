<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>
header,footer{
text-align: center;
line-height: 100px;
}
header{
background-color: orange;
}
section{
line-height: 20px;}
nav{float:left; width:200px; height:300px; background-color:#ffffff;}

section{float:left; width:980px;  background-color:gray;}
#id{
display: none;}
</style>
<meta charset="UTF-8">
<title>정보수정</title>
</head>
<body>
<header id="header"style="text-align: center;">헤더부분</header>
<nav>
<c:if test = "${member!=null}">
<table style="border: 1px solid black;">
<tr><th>
내 정보
</th></tr>
<tr>
<td>아이디 : ${member.id} </td>
</tr>
<tr>
<td>이메일 : ${member.email} </td>
</tr>
</table>
</c:if>
</nav>
<c:if test="${member == null}"> <!-- 로그인하지 않았을시 메인페이지로 -->
<script>
alert("로그인을 해주세요")
window.location.href = '/main'
</script>
</c:if>
<c:if test="${member!=null}"> <!-- 로그인 성공! -->
<form action="/UpdateProc" method="post">
<section>
<article>
<table>
<tr>
<th style="text-align: center;">마이페이지</th>
</tr>
<tr>
<td><input type="text" name="id" value="${member.id}" readonly="readonly" id="id"></td>
</tr>
<tr>
<td>비밀번호와 이메일 변경하기</td>
</tr>
<tr>
<td><input type ="text" name="pwd" placeholder="비밀번호를 입력해주세요"></td>
</tr>
<tr>
<td><input type="email" name="email" placeholder="이메일을 입력해주세요"></td>
</tr>
<tr>
<td><input type="submit" value="수정하기"></td>
</tr>
</table>
</article>
<article>
<h3>내가 쓴 레시피 목록</h3>
<input type="button" value="전부보기" style="float: right;">
</article>
<article>
<h3>내가 쓴 게시글 목록</h3>
<input type="button" value="전부보기" style="float: right;">
</article>
</section>
</form>
</c:if>
</body>
</html>