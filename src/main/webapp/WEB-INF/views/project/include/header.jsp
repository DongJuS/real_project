<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib  prefix="sec" uri="http://www.springframework.org/security/tags"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요들넷 - 요리 알려주는 네 남자들</title>
<!-- 검색창에 필요한 스크립트 시작 -->
	
	<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<!-- 메인화면 폰트 -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">

<!-- 캐러셀 작동시키는 팝 모션 js -->
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="/resources/slick/slick.min.js"></script>





<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="/resources/vendor/metisMenu/metisMenu.min.js"></script>

	<!-- DataTables JavaScript -->
	<script src="/resources/vendor/datatables/js/jquery.dataTables.min.js"></script>
	<script src="/resources/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
	<script src="/resources/vendor/datatables-responsive/dataTables.responsive.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="/resources/dist/js/sb-admin-2.js"></script>

	<!-- Page-Level Demo Scripts - Tables - Use for reference -->
	<script>
		$(document).ready(function() {
			$('#dataTables-example').DataTable({
				responsive : true
			});
		});
	</script>
	
	<!-- 검색창 필요한 스크립트 끝 -->
<style>
.logo_image {
   width: 100px;
   margin: 10px 0 0 15px;
}

.logo_text {
   margin: 0 auto;
}

.logotext {
   width: 300px;
   top: 18px;
   position: relative;
}

.main_top_container {
	width: 100%;
	height: 250px;
	background: orange;
	min-width: 900px;
	border-bottom: 1px solid #e2dede;
}

.top_top {
   width: 100%;
   height: 80px;
   display: inline-flex;
}

.top_bottom {
   width: 100%;
   height: 170px;
   text-align: center;
   position: relative;
}

.logo {
	display: inline;
	
}

.nav_bar {
	
	color: white;
	
	font-size: 14px;
	margin: 5px 5px 0 0;
}

.nav_bar a {
   color: white;
}

.nav_bar a:link {
   text-decoration: none;
}

#search_bar {
   width: 70%;
   height: 45px;
   padding-right: 45px;
   border-radius: 100px;
   border-style: solid;
}

.fa-search:before {
   content: "\f002";
   position: relative;
   right: 30px;
   cursor: pointer;
}

#autoMaker {
   position: relative;
   width: 50%;
   height: auto;
   background: white;
   cursor: pointer;
   margin: 0 auto;
   border-radius: 10px;
   z-index: 100;
}

#autoMaker>div {
   border: 1px solid #a09c9c;
   margin: 3px 3px;
   border-radius: 15px;
}

#autoMaker>div:hover {
   background: #a09c9c;
}

#search_area>div {
   background-color: white;
   width: auto;
   border: 1px solid black;
   border-radius: 100px;
   padding: 5px;
   display: inline-block;
   margin: 3px;
}

.icon1 {
   border-radius: 100px;
   width: 20px;
}
</style>
</head>
<body>
	<div class="main_top_container">
		<div class="top_top">
			<div class="logo">
				<a href="/project/main"><img class="logo_image"
					src="/resources/proimg/logo.png"></a>
			</div>

			<div class="nav_bar">

					  <sec:authorize access="isAuthenticated()"><a href="../customLogout">
					  로그아웃
					  </a></sec:authorize>  <sec:authorize access="isAnonymous()">
					  <a href="/customLogin">로그인</a></sec:authorize> | <a href="#">마이페이지</a>
					   | <a href="/join">회원가입</a>

				
			</div>
			<div class="logo_text">
				<a href="/project/main"><img class="logotext"
					src="/resources/proimg/logotext2.png"></a>
			</div>
			<div class="nav_bar">
				<c:if test="${member == null }">

					<a href="/login">로그인</a> | <a href="/join">회원가입</a> | <a href="#">마이페이지</a>

				</c:if>
				<c:if test="${member !=null}">
					${member.id}님  | <a href="/update">마이페이지</a> |<a href="/logout">로그아웃</a>
				</c:if>
			</div>
			
		</div>
		<div class="top_bottom">

			<input id="search_bar" type="text" name="search"
				placeholder=" 가지고 계신 식재료를 입력해 주세요!"><span class="icon"><i
				class="fa fa-search"></i></span>
			<div id="autoMaker"></div>
			<div id="search_area"></div>
		</div>
	</div>
	<div id="target"></div>
	
	<script>
   var searchList = [];
   $(document).ready(function() {
      var newForm = document.createElement('form');
      newForm.name = 'newForm';
      newForm.method = 'post';
      newForm.action = 'index';
      newForm.enctype='application/x-www-form-urlencoded';
      var count=0
      var cookings= [];
      
      
         
      
      
      /* var path = window.location.pathname;
      console.log(path); */
       $.getJSON('/resources/projson/recipe_all.json',function(data){
         
         $.each(data, function(i,item){
            
            for(var key in item.ingre){
               cookings.push(item.ingre[key].ingre_name)
            }
         
         });
      
         cookings.sort();
          cookings = cookings.filter((element,index)=>{
         return cookings.indexOf(element)===index;
      }); 
       /* $('#target').html(cookings.join(' '));  */
      }); 
      
      
      var i = 0;
      var isComplete = false;    //autoMaker 자식이 선택되었는지 여부
      $('#search_bar').keyup(function(){
          var txt = $(this).val();
          if(txt != ''){  //빈줄이 들어오면
              $('#autoMaker').children().remove();
          

              cookings.forEach(function(arg){
                  if(arg.indexOf(txt) > -1 ){
                      $('#autoMaker').append(
                          $('<div>').text(arg)
                      );
                  }
              });
               
               document.getElementById('autoMaker').style.border = "2px solid #dad9d9";
              $('#autoMaker').children().each(function(){   //재료를 선택해서 클릭할 때 마다
                  $(this).click(function(){
                     /* $('#search_area').val($(this).text()); */
                     ++i;
                     if(searchList==''){
                        $('#search_area').append(
                               $('<div id="allIngre">전체삭제<img class ="icon1" onclick="removetAllIngre()" src="/resources/proimg/x.jpg">')
                               );
                     }
                      $('#search_area').append(
                         $('<div id="divNo'+i+'">').text($(this).text()).append('<img class ="icon1" onclick="removetd('+i+')" src="/resources/proimg/x.jpg">')
                         
                           
                      );
                      searchList.push($(this).text());
                      
                      
                      $('#search_bar').val('');
                      $('#autoMaker').children().remove();
                      $('#autoMaker').css({'border' : ''});
                      isComplete = true;
                      
                      
                      /* console.log(cookings); */
                      
                  });
              });         
          } else {
              $('#autoMaker').children().remove();
              $('#autoMaker').css({'border' : ''});
          }  
      });
      
      $('#search_bar').keydown(function(event){
          if(isComplete) {  //autoMaker 자식이 선택 되었으면 초기화
              $('#search_bar').val('')   
          }
      });
      var objParams = {
          "cookings" : cookings, 
         "searchList" : searchList
      };
      
      /* var realurlp = location.protocol + location.host + "/project/index"; */
      $(".fa-search").click(function(e){
         e.preventDefault();
         var input1 = document.createElement('input');
            input1.setAttribute("type","hidden");
            input1.setAttribute("name","data1");
            input1.setAttribute("value",searchList);
            newForm.appendChild(input1);
         document.body.appendChild(newForm);
         newForm.submit();
         
         
         
         /* localStorage.setItem('searchList',searchList);
         location.href='index'; */
         
         /*  $.ajax({
            url : "/project/index",
            dataType : "json",
            type : "POST",
            data : objParams,
            contentType :  "application/x-www-form-urlencoded; charset=UTF-8",
            success : function(retVal){
               if(retVal.code =="OK"){
                  alert(retVal.message);
                  localStorage.setItem('searchList',searchList);
                  location.href='index';
               }else{
                  alert(retVal.message);
               }
               
            },
            error : function(request, status, error){
               console.log("AJAX_ERROR");
               alert(request.responseText);
               console.log(status);
               console.log(error);
            }
            
         });  */
         
         
         
      });
      
      
   });
   function removetd(i){
      
      
      var ingName = $('#divNo'+i).text();
      var ingNo = searchList.indexOf(ingName);
      searchList.splice(ingNo,1);
      
      $('#divNo'+i).remove();
   }
   function removetAllIngre(){
      
      $('#search_area').children().remove();
      /* console.log(searchList); */
      searchList=[];
      /* console.log(searchList); */
      
   }
   </script>
</body>
</html>