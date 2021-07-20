<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@page import="java.util.*"%>
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>

<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="/resources/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="/resources/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="/resources/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/resources/css/util_join.css">
	<link rel="stylesheet" type="text/css" href="/resources/css/main_join.css">
<!--===============================================================================================-->

<style type="text/css">
.register{
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
.id_input_C1{
color: green;
display: none;
}
.id_input_C2{
color: red;
display: none;
}
.final_idc{
color:red;
display: none;
}
.final_pwdc{
color: red;
 display: none;
}
.final_pwdec{
color : red;
 display: none;
}
/* 비밀번호 유효성검사 */
.input_pwdec_1{
color: green;
display: none;
}
.input_pwdec_2{
color:red;
display: none;
}
.final_emailc{
color: red;
display: none;
}
</style>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>
<%-- <form name="form"  action="/join" id="myform" method="POST" accept-charset="UTF-8">
	<sec:csrfInput/>
	<input type="text" id="id" onchange='check_id()' name="userid" placeholder="아이디" /><!--  4~12자의 영문 대소문자와 숫자로만 입력 -->
	<input type="password" id="pwd" name="userpwd" placeholder="비밀번호" /><!--  똑같은지 확인 -->
	<!-- <input type="password" name="userpwd2" placeholder="비밀번호 확인" /> -->
<!-- 	<input type="password" name="confirmPassword" placeholder="비밀번호 확인" /> -->
	<input type="text" id="name" name="username" placeholder="이름" />
	
	<button id="sendbtn">회원가입</button>
	<!--   <input type="submit" value="전송" /> -->
	<a href="/customLogin">customLogin</a>
</form>
<section id="result" style="color:red;"></section><!-- 유효성 검사 결과 -->
<script>
function check_id(){
	   var id=document.getElementById('id').value;
	    var RegExp = /^[a-zA-Z0-9]{4,12}$/;
	      
	      if(!RegExp.test(id)){
	         alert("ID는 4~12자의 영문 대소문자와 숫자로만 입력하여 주세요.");
	         document.getElementById('id').value='';         
	         return false;
	      }
	   
	} 
</script>
 --%>
<script>
function check_id(){
	   var id=document.getElementById('id').value;
	    var RegExp = /^[a-zA-Z0-9]{4,12}$/;
	      
	      if(!RegExp.test(id)){
	         alert("ID는 4~12자의 영문 대소문자와 숫자로만 입력하여 주세요.");
	         document.getElementById('id').value='';         
	         return false;
	      }
	   
	} 
</script>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form action="/join" id="myform" method="POST" class="login100-form validate-form">
				<sec:csrfInput/>
					<span class="login100-form-title p-b-34">
						Account Login
					</span>
					
					<div  class="wrap-input100 rs1-wrap-input100 validate-input m-b-20" data-validate="Type user name">
						<input onchange='check_id()' id="id" id="first-name" class="input100" type="text" name="userid" placeholder="아이디">
						<span class="focus-input100"></span>
					</div>
					<div class="wrap-input100 rs2-wrap-input100 validate-input m-b-20" data-validate="Type password">
						<input class="input100" id="pwd" type="password"  name="userpwd" placeholder="비밀번호">
						<span class="focus-input100"></span>
					</div>
					<div style="margin-left:22%" class="wrap-input100 rs1-wrap-input100 validate-input m-b-20">
					<input class="input100"  type="text" name="username" placeholder="이름" />
					</div>
					<div class="container-login100-form-btn">
						<button id="sendbtn" class="login100-form-btn">
							회원가입
						</button>
					</div>

					<div class="w-full text-center p-t-27 p-b-239">
						<span class="txt1">
							Forgot
						</span>

						<a href="#" class="txt2">
							User name / password?
						</a>
					</div>

					<div class="w-full text-center">
						<a href="#"  class="txt3">
							Sign Up
						</a>
					</div>
				</form>

				<div class="login100-more" style="background-image: url('/resources/images/bg-01.jpg');"></div>
			</div>
		</div>
	</div>
	
	

	<div id="dropDownSelect1"></div>
	
<!--===============================================================================================-->
	<script src="/resources/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="/resources/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="/resources/vendor/bootstrap/js/popper.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="/resources/vendor/select2/select2.min.js"></script>
	<script>
		$(".selection-2").select2({
			minimumResultsForSearch: 20,
			dropdownParent: $('#dropDownSelect1')
		});
	</script>
<!--===============================================================================================-->
	<script src="/resources/vendor/daterangepicker/moment.min.js"></script>
	<script src="/resources/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="/resources/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="/resources/js/main.js"></script>


</body>
</html>