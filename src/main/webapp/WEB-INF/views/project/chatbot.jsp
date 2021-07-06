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
	    div{
	    border:1px solid black;
	    }
	
	</style>
	<title>Home</title>
</head>

  <div id="kakaoT" class="container">
				<div class="col" style="width:20%;height:200px; text-align: center; ">
				
				<div id="first" class="col" >
				처음
				</div>
				<div id="second" class="col" >
				둘
				</div>
				<div id="third" class="col">
				셋
				</div>
				
				
				</div>  
			
   </div>
   
   <div id="showHide" style="width:100px;height:100px;">
   </div>
   <script> 
   $(document).ready(function() {

   $("#first").on('click',function(e){
		console.log("처음을 누르셨습니다.");
		alert('처음');
	})
    $("#second").on('click',function(e){
		console.log("둘을 누르셨습니다.");
		alert('둘');
	})
	 $("#third").on('click',function(e){
		console.log("셋을 누르셨습니다.");
		alert('셋');
	})
	
	
	$("#showHide").on('click',function(e){
	
		/* 		aJax형식
		var obj = document.getElementById("kakaoT");  */
		var obj=$("#kakaoT")
		
		alert('누르셨습니다.');
			if(obj.style.display =="none"){
			
				$("#kakaoT").show();
				alert('show됨.');
				/* show */
				
				kakao=kakao-1;
			}
			else{
				$("#kakaoT").hide();
				alert('hide됨.');
				/* hide */
				kakao=kakao-1;
			}
			alert(kakao);
	})/* show hide */
	
   });
	</script>
  <!-- 여기까지 자동 상담 부분 -->          
           
            
            
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
