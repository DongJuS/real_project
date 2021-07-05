<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<!-- <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
 -->
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
a {
   text-decoration: none;
}

header {
   background-color: #FF4500;
}

ul li {
   list-style-type: none;
   float: left;
   margin-left: 20px;
}
</style>
<script>
$(document).ready(function() {
   $('.check').on('click','li',function(){      
      $(".checked").append("<li>" + $(this).attr('id') + "</li>")
   })
   
   

   
      
})//document

</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <header class="pt-5">
    <%--   <jsp:include page="topLayout.jsp" flush="false" /> --%>
   </header>

   <div class='container'>
      <div>
         <p></p>
      </div>
      <div class="row" style="border: 1px solid black;">
         <div class="col-sm-1">
            <b>종류별</b>
         </div>
         <div class='col-sm-9'>
            <ul>
               <li><a href='#' role='button'><span>밑반찬</span></a></li>
               <li><a href='#' role='button'>메인반찬</a></li>
               <li><a href='#' role='button'>국/탕</a></li>
            </ul>
         </div>
      </div>
      <!-- 재료별 선택창 -->
      <div>
         <div class='row' style="border: 1px solid black;">
            <div class="col-sm-1">
               <b>재료별</b>
            </div>
            <div class='col-sm-11'>
               <ul class='check'>
                  <li id='소고기'><a href='#' role='button'>소고기</a></li>
                  <li id='돼지고기'><a href='#' role='button'><span>돼지고기</span></a></li>
                  <li id='닭고기'><a href='#' role='button'><span>닭고기</span></a></li>
                  <li id='소스류1'><a href='#' role='button'><span>소스류</span></a></li>
                  <li id='소스류2'><a href='#' role='button'><span>소스류</span></a></li>
                  <li id='소스류3'><a href='#' role='button'><span>소스류</span></a></li>
                  <li id='소스류4'><a href='#' role='button'><span>소스류</span></a></li>
                  <li id='소스류5'><a href='#' role='button'><span>소스류</span></a></li>
                  <li id='소스류6'><a href='#' role='button'><span>소스류</span></a></li>
                  <li id='소스류7'><a href='#' role='button'><span>소스류</span></a></li>
               </ul>
            </div>
         </div>
      </div>
      <!-- 재료별 선택된 것들 나오는 곳 -->
      <div class='row'>
         <div class="col-sm-2">
            <button class='remove'>
               <span>전체삭제</span>
            </button>
         </div>
         <div class='col-sm-10' id='sc_show'>
            <ul class='checked'></ul>
            
         </div>
      </div>
   </div>
   
   <!-- 이제 검색한 내용 나와야 하는 곳 -->
   <div class='container'>
      <div class='row'>
         <div class='row'>
            <p>몇개의 레시피</p>
            <ul>
               <li><a href='#'>정확도순</a></li>
               <li><a href='#'>최신순</a></li>
               <li><a href='#'>추천순</a></li>
            </ul>
         </div>
      </div>
      <ul>
         <li>
            <div>
               <a href='#'><img src='ig/장미.jpg' width='240px' height='240px'></a>
            </div>
            <div>
               <a href='#'>요리 제목이 나와야겟지?</a><br>그다음이 닉네임
            </div>
            <div>
               <span>좋아요와 싫어요 수</span>
            </div>
         </li>
         <li>
            <div>
               <a href='#'><img src='ig/장미.jpg' width='240px' height='240px'></a>
            </div>
            <div>
               <a href='#'>요리 제목이 나와야겟지?</a><br>그다음이 닉네임
            </div>
            <div>
               <span>좋아요와 싫어요 수</span>
            </div>
         </li>
         <li>
            <div>
               <a href='#'><img src='ig/장미.jpg' width='240px' height='240px'></a>
            </div>
            <div>
               <a href='#'>요리 제목이 나와야겟지?</a><br>그다음이 닉네임
            </div>
            <div>
               <span>좋아요와 싫어요 수</span>
            </div>
         </li>
         <li>
            <div>
               <a href='#'><img src='ig/장미.jpg' width='240px' height='240px'></a>
            </div>
            <div>
               <a href='#'>요리 제목이 나와야겟지?</a><br>그다음이 닉네임
            </div>
            <div>
               <span>좋아요와 싫어요 수</span>
            </div>
         </li>
         <li>
            <div>
               <a href='#'><img src='ig/장미.jpg' width='240px' height='240px'></a>
            </div>
            <div>
               <a href='#'>요리 제목이 나와야겟지?</a><br>그다음이 닉네임
            </div>
            <div>
               <span>좋아요와 싫어요 수</span>
            </div>
         </li>
         <li>
            <div>
               <a href='#'><img src='ig/장미.jpg' width='240px' height='240px'></a>
            </div>
            <div>
               <a href='#'>요리 제목이 나와야겟지?</a><br>그다음이 닉네임
            </div>
            <div>
               <span>좋아요와 싫어요 수</span>
            </div>
         </li>
      </ul>
   </div>




   <!-- 
      <div>
         <div class='row'>
            <div class='col'>
               <img src='ig/장미.jpg' width='200px' height='200px'>
               <div class='row'>
                  <div>좋아요</div>
                  <div>싫어요</div>
               </div>
            </div>
            <div class='col'>내용내용내용내용내용</div>
            <div class='col'>sdlfakjsdlfkjsadlfjk</div>
         </div>
      </div>
   </div> -->
   <!-- 컨테이너끝 -->
</body>
</html>