<<<<<<< HEAD
<%@page import="org.conan.domain.IngreVO"%>
<%@page import="org.conan.mapper.RecipeMapper"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


	<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css" rel="stylesheet">

<style>
	    body {
	        background: #f8f8f8;
	        padding: 60px 0;
	    }
	    
	    #login-form > div {
	        margin: 15px 0;
	    }
	
	</style>
	<title>Home</title>
</head>
<div class="container">
    <div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
        <div class="panel panel-success">
            <div class="panel-heading">
                <div class="panel-title">환영합니다!</div>
            </div>
            <div class="panel-body">
                <form id="login-form" method="post" action="/loginProcess.do">
                    <div>
                        <input type="text"  name="id"	class="form-control" name="아이디 입력" placeholder="Username" autofocus>
                    </div>
                    <div>
                        <button type="submit" class="form-control btn btn-primary">로그인</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</html>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
.login{
padding: 15px;
float: center;
}
header{
margin-top : 0px;
background-color: orange;
height: 200px;
}
/* td{
border: 1px solid black;
border-radius: 0.5em;
} */
tr{
border: 1px solid black;
text-align: center;
}
th{
border-radius : 1em;
background-color : orange;
border: 1px solid #ff9800;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="login">
<form action="/loginProc" method="post">
<table style="border: 1px  solid black; margin-left: auto; margin-right: auto; border-radius: 1em; width: 500px; height: 300px; ">
<tr><th>로그인</th>
</tr>
<tr>
 <td>아이디 :<input type="text" name="id"></td>
</tr>
<tr>
<td> 비밀번호:<input type="password" name="pwd"></td>
</tr>
<tr>
<td><input type="submit" value="로그인" style="width: 100px; height: 50px;"></td>
</tr>
</table>
</form>
</div>
</body>
</html>
>>>>>>> origin/정배
