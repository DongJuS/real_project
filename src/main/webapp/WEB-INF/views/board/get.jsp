<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

 <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
 <!-- bootstrap -->
 <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
 <!-- 버튼을 위해서 작성 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- jquery -->


<div class="bigPictureWrapper">
<div class="bigPicture">
</div>
</div>
<style>


/* .modal-backdrop.in {
    opacity: 0.9;
} */

.uploadResult {
   width: 100%;
   background-color: #ddd;
}

.uploadResult ul {
   display: flex;
   flex-flow: row;
   justify-content: center;
   align-items: center;
}

.uploadResult ul li {
   list-style: none;
   padding: 5px;
}

.uploadResult ul li img {
   width: 20px;
}

.uploadResult ul li span {
   color: white;
}

.bigPictureWrapper {
   position: absolute;
   display: none;
   justify-content: center;
   align-items: center;
   top: 0%;
   height: 100%;
   width: 100%;
   background-color: gray;
   z-index: 100;
   background: rgba(255, 255, 255, 0.5);
}

.bigPicture {
   position: relative;
   display: flex;
   justify-content: center;
   align-items: center;
}

.bigPicture img {
   width: 400px;
}
.bold{
font-weight: bold 
}
.fade{
opacity: 0.9;
}
/* 추가 헤더부분 시작*/
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
	min-width: 600px;
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
	width: 0px;
}

.nav_bar {
	    display: inline;
    color: white;
    right: 15px;
    position: absolute;
    font-size: 14px;
    top: 10px;
}

.nav_bar a{
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
.icon1{
    border-radius: 100px;
    width: 20px;
}
/* 추가 끝 */

</style><%-- 
 <%-- <jsp:include page="../board/header.jsp"></jsp:include> --%>
  

<!-- Bootstrap Core CSS -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
 
<!-- MetisMenu CSS -->
<link href="/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

<!-- DataTables CSS -->
<link href="/resources/vendor/datatables-plugins/dataTables.bootstrap.css"
	rel="stylesheet">

<!-- DataTables Responsive CSS -->
<link href="/resources/vendor/datatables-responsive/dataTables.responsive.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="/resources/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
     <!-- jQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  

<script type="text/javascript" src="/resources/js/reply.js"></script>
<script>
   $(document).ready(function() {
           
      var operForm = $("#operForm");
      $('button[data-oper="modify"]').on("click",function(e) {
       operForm.attr("action", "/project/board/modify").submit();
        });
      $('button[data-oper="list"]').on("click", function(e) {
          operForm.find("#bno").remove();
          operForm.attr("action", "/board/list");
          operForm.submit();
       });
       console.log(replyService);

                  /* 리플라이 */

        var bnoValue = '<c:out value="${board.bno}"/>'
              /*          replyService.add({
                          reply : "JS TEST",
                          replyer : "js tester",
                          bno : bnoValue
                       }, function(result) {
                          alert("RESULT : " + result);
                       });  */

                  /*       replyService.getList(
                           {bno:bnoValue,page:1}
                        ,function(list){
                           for(var i =0, len=list.length||0; i<len; i++){
                              console.log(list[i]);
                           }
                        }); */

                  /* replyService.remove(32
                   ,function(count){
                   console.log(count);
                   if(count==="success"){
                   alert("REMOVED");}
                   },function(err){
                   alert('error occurred...');
                   }); */

                  /*  replyService.update({
                       rno:22,
                       bno:bnoValue,
                       reply:"modify reply...."
                    }, function(result){
                       alert("수정완료")
                    }); */

                  /* replyService.get(23, function(data) {
                     console.log(data);
                  }); */

           var replyUL = $(".chat");
           showList(1);
           function showList(page) {
              replyService.getList({bno : bnoValue,page : page || 1 },
                                 function(replyCnt,list) {
                                   console.log("replyCnt : "+ replyCnt)
                                   console.log("list: "+list)
                                    if(page==-1) {
                                       pageNum=Math.ceil(replyCnt/10.0)
                                       showList(pageNum)
                                       return
                                    }
                                    var str = "";
                                    if (list == null|| list.length == 0) {
                                       
                                       return;
                                    }
                                    for (var i = 0, len = list.length || 0; i < len; i++) {
                                       str += "<li class='letf clearfix' data-rno='"+list[i].rno+"'>";
                                       str += "<div><div class='header'><strong class='primary-font'>"
                                             + list[i].replyer
                                             + "</strong>";
                                       str += "<small class='pull-right text-muted'>"
                                             + replyService
                                                   .displayTime(list[i].replyDate)
                                             + "</small><div>";
                                       str += "<p>"
                                             + list[i].reply
                                             + "</p><div></li>";
                                    }
                                    replyUL.html(str);
                                    showReplyPage(replyCnt);
                                 });
                  } //end  showList
                  
                  
                  
                  var modal =$(".modal");
                  var modalInputReply =modal.find("input[name='reply']");
                  var modalInputReplyer =  modal.find("input[name='replyer']");
                  var modalInputReplyDate =  modal.find("input[name='replyDate']");
                  
                  var modalModBtn = $("#modalModBtn");
                  var modalRemoveBtn = $("#modalRemoveBtn");
                  var modalRegisterBtn = $("#modalRegisterBtn");
                  
                  
                  var replyer = null;
					  var csrfHeaderName="${_csrf.headerName}";
				      var csrfTokenValue="${_csrf.token}";
                  $("#addReplyBtn").on("click",function(e){
                     modal.find("input").val("");
                     modal.find("input[name='replyer']").val(replyer);
                     modalInputReplyDate.closest("div").hide();
                     modal.find("button[id !='modalCloseBtn']").hide();
                     
                     modalRegisterBtn.show();
                     $(".modal").modal("show");
                     showList(1);
                  });
                  //ajax spring security header CSRF 토큰을 기본적으로 전송하도록 설정
                  $(document).ajaxSend(function(e, xhr, options){
                	xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);  
                  });
                  
                  modalRegisterBtn.on("click",function(e){
                           var reply ={
                                 reply:modalInputReply.val(),
                                 replyer:modalInputReplyer.val(),
                                 bno:bnoValue
                           };
                           replyService.add(reply,function(result){
                              alert(result);
                              modal.find("input").val("");//댓글등록이 정상적으로 이뤄지면, 내용을 지움
                              modal.modal("hide");//모달창 닫음
                              
                              showList(-1);
                           });
                        });
                  
                  $(".chat").on("click","li",function(e){
                     var rno = $(this).data("rno");
                     replyService.get(rno,function(reply){
                        modalInputReply.val(reply.reply)
                        modalInputReplyer.val(reply.replyer)
                        modalInputReplyDate.val(replyService.displayTime(reply.replyDate)).attr("readonly","readonly")
                        modal.data("rno",reply.rno)
                        
                        modal.find("button[id!='modalCloseBtn']").hide()
                        modalModBtn.show()
                        modalRemoveBtn.show()
                        $(".modal").modal("show")
                     })
                     console.log(rno);
                  });
                  
                  modalModBtn.on("click",function(e){
                	
                	  var originalReplyer = modalInputReplyer.val();
                
                	 if(replyer !=originalReplyer){
                		 alert("자신이 작성한 댓글만 수정 가능");
                		 modla.modal("hide");
                		 return;
                	 }
                     var reply={rno:modal.data("rno"), 
                    		 reply:modalInputReply.val(),
                    		 replyer: originalReplyer};
                     
               	  if(!replyer){
            		  alert("로그인후 수정이 가능합니다.");
            		  modal.modal("hide");
            		  return;
            	  }
            	 console.log("Original Replyer:"+ originalReplyer);
            	 
                     
                     replyService.update(reply,function(result){
                        alert(result)
                        modal.modal("hide")
                        showList(pageNum)
                     });
                  });
                  
                  
                  
                  modalRemoveBtn.on("click", function(e){
                     var rno=modal.data("rno")
                     
                     
                     replyService.remove(rno, originalReplyer, function(result){
                        alert(result)
                        modal.modal("hide")
                        showList(pageNum)
                     })
                     
                     console.log("REPLYER:" +replyer);
                     if(!replyer){
                    	 alert("로그인한 후 삭제가 가능");
                    	 modal.modal("hide"); return;
                     }
                     var originalReplyer = modalInputReplyer.val();
                     console.log("Original Replyer:" + originalReplyer); // 원 댓글 작성자
                     if(replyer != originalReplyer){
                    	 alert("자신이 작성한 댓글만 삭제 가능");
                    	 modal.modal("hide"); return;
                     }
                     
                  });
                  
                  
             
                   
                   
                  var pageNum=1
                  var replyPageFooter= $(".panel-footer")
                  function showReplyPage(replyCnt){
                     console.log("showReplyPage: " + replyCnt)
                     var endNum=Math.ceil(pageNum/10.0)*10
                     var startNum=endNum-9
                     var prev=startNum!=1
                     var next=false
                     if(endNum*10>replyCnt){endNum=Math.ceil(replyCnt/10.0)}
                     if(endNum*10<replyCnt){next=true}
                     var str="<ul class='pagination pull-right'>"
                     if(prev) {
                        str+="<li class='page-item'><a class='page-link' href='"+(startNum-1)+"'>Previous</a></li>"
                     }
                     for(var i=startNum; i<=endNum; i++) {
                        var active =pageNum ==i?"active":"";
                        str +="<li class='page-item "+active+"'><a class='page-link' href='"+i+"'>"+i+"</a></li>"
                        }
                     if(next){
                        str +="<li class='page-item'><a class='page-link' href='"+(endNum+1)+"'>NEXT</a></li>"
                     }
                     str +="</ul></div>"
                     console.log(str)
                     replyPageFooter.html(str)
                  }
                  
                  replyPageFooter.on("click","li a",function(e){
                      e.preventDefault();
                      console.log("page click");
                      var targetPageNum =$(this).attr("href");
                      console.log("targetPageNum:"+targetPageNum);
                      pageNum = targetPageNum;
                      showList(pageNum);
                   });
                
                  
                  var bno = '<c:out value="${board.bno}"/>'
                      $.getJSON("/board/getAttachList",{bno:bno}, function(arr){
                         console.log(arr)
                         var str=''
                         $(arr).each(function(i,obj){
                            if (!obj.fileType) {
                              var fileCallPath = encodeURIComponent(obj.uploadPath+ "/"+ obj.uuid+ "_"+ obj.fileName);
                              /* str += "<li><div><a href='/download?fileName="+ fileCallPath+ "'><img src='/resources/images/attach.png'>"+ obj.fileName
                                 + "</a><span data-file=\""+fileCallPath+"\" data-type='file'>X</span></div></li>" */
                                 str +="<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'><div>"
                                 str +="<img src='/resources/images/attach.png'>"
                                 str +="</div></li>"
                              } else {
                                 //str +="<li>" + obj.fileName + '</li>'
                                 var fileCallPath = encodeURIComponent(obj.uploadPath+ "/S_"+ obj.uuid+ "_"+ obj.fileName);
                                 var originPath = obj.uploadPath   + "/"+ obj.uuid+ "_"+ obj.fileName
                                 originPath = originPath.replace(new RegExp(/\\/g),"/")
                                 /* str += "<li><a href=\"javascript:showImage(\'"+ originPath+ "\')\"><img src='/display?fileName="+ fileCallPath
                                       + "'></a><span data-file=\""+fileCallPath+"\" data-type='image'>X</span></li>" */
                                 str +="<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'><div>"             
                                 str +="<img src='/display?fileName="+fileCallPath+"'>"
                                 str +="</div></li>"
                              }
                         })
                         $(".uploadResult ul").html(str);
                      })
                  
                     $(".uploadResult").on("click", "li", function(e){
                        console.log("view image")
                        var liObj=$(this)
                        var path=encodeURIComponent(liObj.data("path")+"/"+liObj.data("uuid")+"_"+liObj.data("filename"))
                        if(!liObj.data("type")){
                           self.location="/download?fileName="+path
                        }else{ showImage(path)}
                     })
                     
                     $(".bigPictureWrapper").on("click", function(e){
                        $(".bigPicture").animate({width:'0%', height:'0%'},1000)
                        setTimeout(function(){
                           $('.bigPictureWrapper').hide()
                        },1000)
                     })
                      
               });//document
               
               function showImage(fileCallPath){
                  //alert(fileCallPath)
                  $('.bigPictureWrapper').css('display','flex').show()
                  $('.bigPicture').html("<img src='/display?fileName="+fileCallPath+"'>").animate({width:'100%',height:'100%'},1000)
               }
               
  

</script>

<!--       ------------------------------------------------------------------------------- -->
<div class="main_top_container">
		<div class="top_top">
			<div class="logo">
				<a href="/project/main"><img class="logo_image"
					src="/resources/proimg/logo.png"></a>
			</div>

			<div class="nav_bar">
				<a href="#">로그인</a> | <a href="#">회원가입</a> | <a href="#">마이페이지</a>
			</div>
			<div class="logo_text">
				<a href='/project/main'><img class="logotext" src="/resources/proimg/logotext2.png"></a>
			</div>
		</div>
		<div class="top_bottom">
		
				<input id="search_bar" type="text" name="search"
					placeholder=" 가지고 계신 식재료를 입력해 주세요!"><span class="icon"><i class="fa fa-search"></i></span>
				<div id="autoMaker"></div>
				<div id="search_area"></div>
		</div>
	</div>
	
<div class="container">
<!-- /.row -->
<div class="row">
   <div class="col-lg-12">
      <div class="panel panel-default">
         <div class="panel-heading">게시글 등록</div>
         <!-- /.panel-heading -->
         <div class="panel-body">
            <div class="form-group">
               <label class="bold">번호</label><input class='form-control' name='bno'
                  value='<c:out value="${board.bno }"/>' readonly='readonly'>
            </div>
            <div class="form-group">
               <label class="bold">제목</label><input class='form-control' name='title'
                  value='<c:out value="${board.title }"/>' readonly='readonly'>
            </div>
            <div class='form-group'>
               <label class="bold">글 내용</label>
               <textarea class='form-control' rows='3' name='content'
                  readonly='readonly'><c:out value="${board.content }" /></textarea>
            </div>
            <div class='form-group'>
               <label class="bold">작성자</label><input class='form-control' name='writer'
                  value='<c:out value="${board.writer }"/>' readonly='readonly'>
            </div>
     
     
     
      
      <%--
		시큐리티 부분      
       <sec:authentication property="principal" var="pinfo"/>
      <sec:authorize access="isAuthenticated()">
      <c:if test="${pinfo.username eq board.writer }">
      <button data-oper='modify' class="btn btn-warning">Modify</button>
      </c:if>
      </sec:authorize> 
      --%>
            <button class='btn btn-primary' data-oper='list'>List</button>
            <form id='operForm' action='/project/board/modify' method='get'>
               <input type='hidden' id='bno' name='bno'
                  value='<c:out value="${board.bno }" />'> <input
                  type='hidden' name='pageNum'
                  value='<c:out value="${cri.pageNum }"/>'> <input
                  type='hidden' name='amount'
                  value='<c:out value="${cri.amount }"/>'> <input
                  type="hidden" name="type" value="${cri.type }"> <input
                  type="hidden" name="keyword" value="${cri.keyword }">
            </form>

            <!-- /.table-responsive -->
         </div>
         <!-- /.panel-body -->
      </div>
      <!-- /.panel -->
 

      <!-- /.panel-heading reply 영역시작 -->
      <div class="panel panel-default">
         <div class="panel-heading">
            <i class="fa fa-comments fa-fw"></i>Reply
      <button id='addReplyBtn' class="btn btn-primary btn-xs pull-right">New Reply</button>
         </div>
         <div class="panel-body">
            <ul class="chat">
               <li class="left clearfix" data-rno="12">
                  <div>
                     <div class="header">
                        <!-- <strong class="primary-font"> user00</strong> <small
                           class="pull-right text-muted">2021-05-18-13:13</small> -->
                     </div>
                     <!-- <p>Good job</p> -->
                  </div>
               </li>
            </ul>
         </div>
         <!-- FOOTER영역 -->
         <div class='panel-footer'></div>
      </div>
      
      <!-- reply 영역 -->
      <!-- 모달영역 -->
      <div class='modal fade' id='myModal' tabindex='-1' role='dialog'
         aria-labelledby='myModallabel' aria-hidden='true'>
         <div class='modal-dialog' role="document">
            <div class='modal-content' >
               <div class='modal-header'>
                  <button type='button' class='close' data-dismiss='modal'
                     aria-hidden='ture'>&times;</button>
                  <h4 class='modal-title' id='myModalLabel'>REPLY MODAL</h4>
               </div>
               <div class='modal-body'>
                  <div class='form-group'>
                     <label>Reply</label> <input class='form-control' name='reply'
                        value='New Reply'>
                  </div>
                  <div class='form-group'>
                     <label>Replyer</label> <input class='form-control' name='replyer'
                        value='New Replyer'>
                  </div>
                  <div class='form-group'>
                     <label>ReplyDate</label> <input class='form-control'
                        name='replyDate' value=''>
                  </div>
               </div>
               <div class='modal-footer'>
                  <button id='modalModBtn' type='button' class='btn btn-info'>Modify</button>
                  <button id='modalRemoveBtn' type='button' class='btn btn-info'>Remove</button>
                  <button id='modalRegisterBtn' type='button' class='btn btn-info'
                     data-dismiss='modal'>Register</button>
                  <button id='modalCloseBtn' type='button' class='btn btn-info'
                     data-dismiss='modal'>Close</button>
               </div>
            </div>
         </div>
      </div>
      <!-- 모달영역 -->
   </div>
   <!-- /.col-lg-12 -->
</div>
</div>
<!-- /.row -->




<!-- /.row -->

<!-- /.row -->
<!--    footer 시작      -------------------------------------------------------------- -->
<jsp:include page="../project/include/footer.jsp"></jsp:include>