<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요들넷</title>
<style>
.foodImg {
   width: 300px;
   margin: 10px;
   height: 200px;
}

.result_container {
   width: 80%;
   margin: 0 auto;
   min-width: 600px;
}

.result_div {
   display: flex;
}

.recip_name {
   font-size: 17px;
   font-weight: 550;
}

.recip_ingsCountText {
   font-size: 12px;
}

.recipe_text {
   margin: 10px;
       color: black;
}

.needIngs_list {
   font-size: 14px;
   color: #bfbfbf;
}

.haveIngs_list {
   font-size: 14px;
}

.summary {
   font-size: 15px;
}

.your_ings {
   
}

#guide_text1 {
   color: gray;
   font-size: 11px;
}
a:link{
text-decoration:none;
}

li{
list-style: none;
display: inline-block;
}
</style>
</head>
<body>
	<jsp:include page='../include/header.jsp'/>
	<div class='container'>
		<div>
			<div id='panel'>
				<div class='row' style="border: 1px solid black;">
					<div class="col-sm-1">
						<b>냉장고</b>
					</div>
					<div class='col-sm-11'>
						<ul class='check'>
							<li>돼지고기</li>
							<li id='삼겹살'><a href='#' role='button'>삼겹살</a></li>
							<li id='목살'><a href='#' role='button'>목살</a></li>
							<li id='등심'><a href='#' role='button'>등심</a></li>
							<li id='안심'><a href='#' role='button'>안심</a></li>
							<li id='앞다리살'><a href='#' role='button'>앞다리살</a></li>
							<li id='뒷다리살'><a href='#' role='button'>뒷다리살</a></li>
							<li id='등갈비'><a href='#' role='button'>등갈비</a></li>
							<!-- <li id='소고기'><a href='#' role='button'>소고기</a></li>
						<li id='돼지고기'><a href='#' role='button'><span>돼지고기</span></a></li>
						<li id='닭고기'><a href='#' role='button'><span>닭고기</span></a></li>
						<li id='달걀'><a href='#' role='button'><span>달걀</span></a></li>
						<li id='두부'><a href='#' role='button'><span>두부</span></a></li>
						<li id='고추장'><a href='#' role='button'><span>고추장</span></a></li>
						<li id='된장'><a href='#' role='button'><span>된장</span></a></li>
						<li id='간장'><a href='#' role='button'><span>간장</span></a></li>
						<li id='물엿'><a href='#' role='button'><span>물엿</span></a></li>
						<li id='설탕'><a href='#' role='button'><span>설탕</span></a></li>
						<li id='소금'><a href='#' role='button'><span>소금</span></a></li>
						<li id='후추'><a href='#' role='button'><span>후추</span></a></li> -->
						</ul>
						<ul class='check'>
							<li>소고기</li>
							<li id='등심'><a href='#' role='button'>등심</a></li>
							<li id='안심'><a href='#' role='button'>안심</a></li>
							<li id='갈비'><a href='#' role='button'>갈비</a></li>
							<li id='양지'><a href='#' role='button'>양지</a></li>
							<li id='사태'><a href='#' role='button'>사태</a></li>
							<li id='홍두깨살'><a href='#' role='button'>홍두깨살</a></li>
						</ul>
						<ul class='check'>
							<li>해물류</li>
							<li id='고등어'><a href='#' role='button'>고등어</a></li>
							<li id='꽁치'><a href='#' role='button'>꽁치</a></li>
							<li id='새우'><a href='#' role='button'>새우</a></li>
							<li id='연어'><a href='#' role='button'>연어</a></li>
							<li id='조개'><a href='#' role='button'>조개</a></li>
							<li id='오징어'><a href='#' role='button'>오징어</a></li>
						</ul>
						<ul class='check'>
							<li>이외 육류</li>
							<li id='닭'><a href='#' role='button'>닭</a></li>
							<li id='오리'><a href='#' role='button'>오리</a></li>
							<li id='양'><a href='#' role='button'>양</a></li>
						</ul>
						<ul class='check'>
							<li>야채류</li>
							<li id='양파'><a href='#' role='button'>양파</a></li>
							<li id='마늘'><a href='#' role='button'>마늘</a></li>
							<li id='파'><a href='#' role='button'>파</a></li>
							<li id='버섯'><a href='#' role='button'>버섯</a></li>
							<li id='당근'><a href='#' role='button'>당근</a></li>
							<li id='고추'><a href='#' role='button'>고추</a></li>
							<li id='피망'><a href='#' role='button'>피망</a></li>
							<li id='호박'><a href='#' role='button'>호박</a></li>
							<li id='감자'><a href='#' role='button'>감자</a></li>
							<li id='고구마'><a href='#' role='button'>고구마</a></li>
						</ul>
						<ul class='check'>
							<li>조미료</li>
							<li id='소금'><a href='#' role='button'>소금</a></li>
							<li id='후추'><a href='#' role='button'>후추</a></li>
							<li id='설탕'><a href='#' role='button'>설탕</a></li>
							<li id='다시다'><a href='#' role='button'>다시다</a></li>
							<li id='고추가루'><a href='#' role='button'>고추가루</a></li>
						</ul>
						<ul class='check'>
							<li>소스류</li>
							<li id='고추장'><a href='#' role='button'>고추장</a></li>
							<li id='된장'><a href='#' role='button'>된장</a></li>
							<li id='간장'><a href='#' role='button'>간장</a></li>
							<li id='참기름'><a href='#' role='button'>참기름</a></li>
							<li id='식용유'><a href='#' role='button'>식용유</a></li>
							<li id='굴소스'><a href='#' role='button'>굴소스</a></li>
							<li id='스리라차'><a href='#' role='button'>스리라차</a></li>
							<li id='칠리'><a href='#' role='button'>칠리</a></li>
						</ul>
					</div>
				</div>


				<div class='row' id='choice'>
					<div class="col-sm-2">
						<button class='remove'>
							<span>전체삭제</span>
						</button>
					</div>
					<div class='col-sm-10' id='sc_show'>
						<ul class='checked'>

						</ul>
						<button class='searchingre'>검색</button>
					</div>
					<form id='search' action='/project/urrecipe/searching'
						method='post'></form>
				</div>
			</div>
			<div>
				<span class='up'>[접기]</span><span class='down'>[펼치기]</span>
			</div>
		</div>
	</div>

	<!-- 검색 결과 -->
	<div class='result_container'>
		<div style="margin: 10px;">
			총 <strong style='font-size: 19px;'>${usrv.size() }</strong>개의 레시피가 검색
			되었습니다.
			<span class="your_ings">입력하신 재료 목록 : ${yourIngs}</span>
			<span id="guide_text1">&nbsp;&nbsp; *부족한 재료는 회색으로 표시됩니다!</span>
		</div>
	
	
	<hr>
	<c:forEach var ='i' begin='0' end='${max }'>
		<c:forEach var ='recipe' items='${usrv }' begin='0' end='${usrv.size() }'>
			<c:if test='${i eq recipe.needIngs.size() }'>
				<a href='/project/urrecipe/get?urrid=${recipe.urrid }'> 
				<%-- <a class='move' href="'${recipe.urrid }'" > --%>
				<div class='result_div'>
					<div class='list_img<c:out value='${recipe.urrid}'/>'>대표사진이 없네요</div>
					<div class='recipe_txt'>
						<span class='recip_name'>${recipe.urname }</span>
						<span class='haveIngs_list'>필요한 재료 : <c:if test='${not empty recipe.haveIngs }'>${recipe.needIngs }</c:if></span>
						<span class="needIngs_list"> <c:if test="${not empty recipe.needIngs}">${recipe.needIngs}</c:if></span>
						<c:choose>
							<c:when test='${recipe.needIngs.size() eq 0 }'>
								<br>
								<span class="recip_ingsCountText">*보유중인 재료들로 요리가 가능한 레시피 입니다 ! (${recipe.haveIngs.size()} / ${recipe.ingsList.size()})</span>
							</c:when>
							<c:otherwise>
                          	 	<br>
                           		<span class="recip_ingsCountText">*${recipe.needIngs.size()} 개의 재료가 부족해요 !
                              (${recipe.haveIngs.size()} / ${recipe.ingsList.size()})</span>
                        </c:otherwise>
						</c:choose>
						 <br>
                     <span class="summary">${recipe.ursummary}</span>			
					</div>
				</div>
				</a>
			</c:if>
		</c:forEach>
	</c:forEach>
	</div>
	
	<div class='pull-right'>
		<ul class='pagination'>
			<c:if test="${pageMaker.prev }">
				<li class='paginate_button previous'>
				<a href="${pageMaker.startPage-1 }">Previous</a></li>
			</c:if>
			<c:forEach var='num' begin='${pageMaker.startPage }'
				end='${pageMaker.endPage }'>
				<li class="paginate_button ${pageMaker.cri.pageNum==num?"active":""}">
					<a href="${num }">${num }</a>
				</li>
			</c:forEach>
			<c:if test="${pageMaker.next }">
				<li class='paginate_button next'><a
					href="${pageMaker.endPage+1 }">Next</a></li>
			</c:if>
		</ul>
	</div>
	<form id='actionForm' action='/urrecipe/list' method='get'>
		<input type='hidden' name='pageNum'	value='${pageMaker.cri.pageNum }'> 
		<input type='hidden' name='amount' value='${pageMaker.cri.amount }'> 
	</form>
	
	
	
	
	<jsp:include page="../include/footer.jsp"/>
	

</body>
<script>
$(document).ready(function() {
   var searchList = localStorage.getItem('search');
   console.log(searchList);

   $(".move").on("click",function(e) {
			e.preventDefault()
			actionForm.append("<input type='hidden' name='urrid' value='"	+ $(this).attr("href")+ "'/>")
			actionForm.attr("action","/project/urrecipe/get")
			actionForm.submit() 
		})
   
		//사진 가져오기
			$.getJSON("/project/urrecipe/allImg",function(arr){
		//console.log(arr) 
		var str='' 
		var j =0
		var atr=[]
		for(var i =0; i<arr.length; i++){
			//console.log(arr[i].urrid)
			if(arr[i].num==0){
				console.log(arr[i].urrid)
				var fileCallPath = encodeURIComponent(arr[i].uploadPath+ arr[i].uuid+ "_"+ arr[i].filename);
				var originPath = arr[i].uploadPath+ "/"+ arr[i].uuid+ "_"+ arr[i].filename
				originPath = originPath.replace(new RegExp(/\\/g),"/")
				str ="<img class='main_image' src='/display?filename="+originPath+"' width='360px' height=='300px'>"
				atr.push(str)
				var txt='.list_img'+arr[i].urrid
				$(txt).html(atr[j])
	   			j++	
				}
		
			 
			}
	  })
	  
		$('.check').on('click', 'li', function() {
			/* $(".checked").append("<li id=\'"+$(this).attr('id')+"\'>" + $(this).attr('id') + "</li>") */
			var tagid = $(this).attr('id')

			var rmtag = $('.checked>#' + tagid).attr('id')
			if (tagid===rmtag) {
				$('.checked>#' + rmtag).remove()
				$('#search>#'+rmtag).remove()
			}else{
			$(".checked").append("<li id=\'"+tagid+"\'>" + tagid + "</li>")
			$('#search').append("<input type='hidden' value='"+tagid+"' name='data1' id='"+tagid+"'>")
			}
		})

		$('.remove').on('click', function() {
			$('.checked>li').remove()
		})

		$('.checked').on('click', 'li', function() {
			$(this).remove()
		})
		
		
		//재료 선택 안하면 응 안돼~
		var searchform=$('#search')
		$('.searchingre').on('click',function(e){
			if($('.checked>li').length>0){
				searchform.submit()
			}else{
				alert('재료를 선택해주세요')
			}
		})
		
		$('.down').hide()
		$('.up').on('click',function(){
			$('#panel').slideUp()
			$('.up').hide()
			$('.down').show()
		})
		$('.down').on('click',function(){
			$('#panel').slideDown()
			$('.up').show()	
			$('.down').hide()
		})
		
   });
</script>
</html>