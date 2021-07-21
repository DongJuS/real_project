<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">


<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!-- 버튼을 위해서 작성 -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>




<style>
/* div{
border:1px solid black;
} */
.btn_margin {
   left: 50px;
   position: relative;
   margin-left: 20px;
}

#img_st {
   margin-top: 50px;
   margin-bottom: 0px;
}

#basic_sty {
   border: 1px solid black;
   width: 100px;
}

#box {
   border: 1px solid black;
}

.search {
   left: 200px;
}

.head {
   margin-top: 25px;
   margin-right: 160px;
}
.line{
border-bottom: 0.5px solid;
}
.table_title {
   width: 100px;
}

#center {
   text-align: center;
}
.bot_container{
width:100%;
background:darkgray;
}
.board_container{
width:80%;
background:white;
margin:0 auto;
border: 1px solid #e2dede;
}
.big_text{
padding: 40px;
}
#board_icon{
height:41px;
}
.total_and_search{
display:inline-flex;
width:100%;
}
.hr_line{
margin:0 auto;
width:95%;
}
#total{
margin: auto 0 0 15px;
    padding: 10px;
}
#search{
margin:0 25px 0 auto;
    
}
.board_table{
    margin: 0 auto;
    width: 95%;
    text-align:center;
}
#board_thead{
    border-top: 1px solid #e2dede;
    border-bottom: 1px solid #e2dede;
}
.board_tr{
border-bottom:1px solid #e2dede;
}
td a:link{
text-decoration:none;
color:black;
}
.board_tr th{
padding:10px;
}
.board_tr td{
padding:10px;
}
.board_b{
color:darkgray;
}
</style>

<!-- jQuery -->
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>



<jsp:include page="../project/include/header.jsp"></jsp:include>

<script type="text/javascript">
   $(document)
         .ready(
               function() {
                  var result = '<c:out value="${result}"/>';
                  checkModal(result);
                  history.replaceState({}, null, null)
                  function checkModal(result) {
                     if (result === "" || history.state) {
                        return;
                     }
                     if (parseInt(result) > 0) {
                        $(".modal-body").html(
                              "게시글" + parseInt(result) + " 번이 등록됨")
                     }
                     $("#myModal").modal("show")

                  }

                  $("#regBtn").on("click", function() {
                     self.location = "/board/register"
                  })

                  var actionForm = $("#actionForm");
                  $(".paginate_button a").on(
                        "click",
                        function(e) {
                           e.preventDefault()
                           console.log('click')
                           actionForm.find('input[name="pageNum"]')
                                 .val($(this).attr("href"))
                           actionForm.submit()
                        })

                  

                  $(".move")
                        .on(
                              "click",
                              function(e) {
                                 e.preventDefault()
                                 actionForm
                                       .append("<input type='hidden' name='bno' value='"
                                             + $(this).attr(
                                                   "href")
                                             + "'/>")
                                 actionForm.attr("action",
                                       "/board/get")
                                 actionForm.submit()
                              })

                  var searchForm = $("#searchForm")
                  $("#searchForm button").on(
                        "click",
                        function(e) {
                           if (!searchForm.find("option:selected")
                                 .val()) {
                              alert("검색종류를 선택하세요")
                              return false;
                           }
                           if (!searchForm.find(
                                 "input[name='keyword']").val()) {
                              alert("키워드를 입력하세요")
                              return false;
                           }
                           searchForm.find("input[name='pageNum']")
                                 .val("1")
                           e.preventDefault();
                           searchForm.submit();
                        })

               })
</script>

<!--       ------------------------------------------------------------------------------- -->
<div class="bot_container">
<div class="board_container">

<div class="big_text"><img id="board_icon" src="/resources/proimg/board_icon.png"><img src="/resources/proimg/free_board.png"></div>
<div class="total_and_search">
<div id="total">총 ${pageMaker.total }건</div>
<div id="search"><form id='searchForm' action='/board/list' method='get'>
                  <select name='type'>
                     <option value=""
                        <c:out value="${pageMaker.cri.type==null?'selected': ''}"/>>----</option>
                     <option value="T"
                        <c:out value="${pageMaker.cri.type eq'T'?'selected':''}"/>>제목</option>
                     <option value="C"
                        <c:out value="${pageMaker.cri.type eq'C'?'selected': ''}"/>>내용</option>
                     <option value="W"
                        <c:out value="${pageMaker.cri.type eq'W'?'selected': ''}"/>>작성자</option>

                  </select> <input type='text' name='keyword'
                     value='<c:out value="${pageMaker.cri.keyword }"/>' /> <input
                     type='hidden' name='pageNum' value='${pageMaker.cri.pageNum }' />
                  <input type='hidden' name='amount'
                     value='${pageMaker.cri.amount }' />
                  <button class='btn btn-info'>검색</button>
               </form></div>


</div>

<!-- 게시판 테이블 -->
<div>
<table class="board_table">

            <thead id="board_thead">
               <tr class="board_tr">
                  <th>조회수</th>
                  <th>제목</th>
                  <!-- <th scope="col">파일</th> -->
                  <th></th>
                  <th>작성자</th>
                  <th>작성날짜</th>
               </tr>
            </thead>
            <tbody>
               <c:forEach var="board" items="${list }">
                  <tr class="board_tr">
                     <td>${board.hits }</td>
                     <td><a
                        class='move' href='${board.bno }'>${board.title }
                           <b class="board_b">(${board.replyCnt })
                        </b>
                     </a></td>
                     <td></td>
                     <td>${board.writer }</td>
                     <td><fmt:formatDate pattern="yyyy/MM/dd" value="${board.regdate }" /></td>
                  </tr>
               </c:forEach>
            </tbody>

         </table>

</div>
<!--   -->



<<<<<<< HEAD
<!-- 		------------------------------------------------------------------------------- -->
<div class="bot_container">
<div class="board_container">
<div class="big_text"><img id="board_icon" src="/resources/proimg/board_icon.png"><img src="/resources/proimg/free_board.png"></div>
<div class="total_and_search">
<div id="total">총 17건</div>
<div id="search"><input type="text"></div>
<hr class="hr_line">

</div>
</div>

</div>


<div class="container">
 <div class="big_text"></div>
=======

</div>
>>>>>>> origin/master
</div>
















<div class="container">
   <div class="row">
      <div class="col-lg-12">
         <h1 class="page-header">게시판</h1>
      </div>
      <!-- col 12 -->
   </div>
   <!-- row -->
   <div class="row">
      <div class="col-lg-12 line">
         <div class="row justify-content-between">
            <div class="col-4 head">
               Total
               <c:out value='}' />
               건

            </div>


            <div class="col-6 search">
               


            </div>
         </div>
      </div>
   </div>
   <!-- row -->





   <div class="row">
      <div class="col-lg-12">

         
      </div>
      <!-- col 12 -->
   </div>
   <!-- row -->
   <button id='regBtn' type='button'>글쓰기</button>


   <div class='pull-right'>
      <ul class='pagination'>
         <c:if test="${pageMaker.prev }">
            <li class='paginate_button previous'><a
               href="${pageMaker.startPage-1 }">Previous</a></li>
         </c:if>
         <c:forEach var='num' begin='${pageMaker.startPage }'
            end='${pageMaker.endPage }'>
            <li class="paginate_button ${pageMaker.cri.pageNum==num?'active":""}">
               <a href="${num }">${num }</a>
            </li>
         </c:forEach>
         <c:if test="${pageMaker.next }">
            <li class='paginate_button next'><a
               href="${pageMaker.endPage+1 }">Next</a></li>
         </c:if>
      </ul>
   </div>
   <form id='actionForm' action='/board/list' method='get'>
      <input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum }'>
      <input type='hidden' name='amount' value='${pageMaker.cri.amount }'>
      <input type='hidden' name='type' value="${pageMaker.cri.type }">
      <input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">

   </form>
   <div class='modal fade' id='myModal' tabindex='-1' role='dialog'
      aria-labelledby='myModallabel' aria-hidden='true'>
      <div class='modal-dialog'>
         <div class='modal-content'>
            <div class='modal-header'>
               <button type='button' class='close' data-dismiss='modal'
                  aria-hidden='true'>&times;</button>
               <h4 class='modal-title' id='myModalLable'>Modal title</h4>
            </div>
            <div class='modal-body'>처리가 완료되었습니다.</div>
            <div class='modal-footer'>
               <button type='button' class='btn btn-info' data-dismiss='modal'>Close</button>
               <button type='button' class='btn btn-primary'>Save Changes</button>
            </div>
         </div>
      </div>
   </div>
   <!-- /.table-responsive -->




</div>
<!-- container -->
<script type="text/javascript">
   $(document)
         .ready(
               function() {
                  var result = '<c:out value="${result}"/>';
                  checkModal(result);
                  history.replaceState({}, null, null)
                  function checkModal(result) {
                     if (result === "" || history.state) {
                        return;
                     }
                     if (parseInt(result) > 0) {
                        $(".modal-body").html(
                              "게시글" + parseInt(result) + " 번이 등록됨")
                     }
                     $("#myModal").modal("show")

                  }

                  $("#regBtn").on("click", function() {
                     self.location = "/board/register"
                  })

                  var actionForm = $("#actionForm");
                  $(".paginate_button a").on(
                        "click",
                        function(e) {
                           e.preventDefault()
                           console.log('click')
                           actionForm.find('input[name="pageNum"]')
                                 .val($(this).attr("href"))
                           actionForm.submit()
                        })

                  $(".move")
                        .on(
                              "click",
                              function(e) {
                                 e.preventDefault()
                                 actionForm
                                       .append("<input type='hidden' name='bno' value='"
                                             + $(this).attr(
                                                   "href")
                                             + "'/>")
                                 actionForm.attr("action",
                                       "/board/get")
                                 actionForm.submit()
                              })

                  var searchForm = $("#searchForm")
                  $("#searchForm button").on(
                        "click",
                        function(e) {
                           if (!searchForm.find("option:selected")
                                 .val()) {
                              alert("검색종류를 선택하세요")
                              return false;
                           }
                           if (!searchForm.find(
                                 "input[name='keyword']").val()) {
                              alert("키워드를 입력하세요")
                              return false;
                           }
                           searchForm.find("input[name='pageNum']")
                                 .val("1")
                           e.preventDefault();
                           searchForm.submit();
                        })

               })
</script>


<!--    footer 시작      -------------------------------------------------------------- -->
<jsp:include page="../project/include/footer.jsp"></jsp:include>