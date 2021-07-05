<%@page import="org.conan.domain.IngreVO"%>
<%@page import="org.conan.mapper.RecipeMapper"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>




</head>
<body>
1



<!-- <div class="slide_wrapper">
<ul class="slides">
움직이는건 ul을 움직임
<li><img src="http://placehold.it/200x200" alt=""></li>
<li><img src="http://placehold.it/200x200" alt=""></li>
<li><img src="http://placehold.it/200x200" alt=""></li>
<li><img src="http://placehold.it/200x200" alt=""></li>
<li><img src="http://placehold.it/200x200" alt=""></li>
<li><img src="http://placehold.it/200x200" alt=""></li>
<li><img src="http://placehold.it/200x200" alt=""></li>
<li><img src="http://placehold.it/200x200" alt=""></li>
<li><img src="http://placehold.it/200x200" alt=""></li>

</ul> 
<div class="controls" >
  <span class="prev glyphicon glyphicon-chevron-left" aria-hidden="true"></span> 

  <span  class="next glyphicon glyphicon-chevron-right" aria-hidden="true"></span>

<script type="text/javascript">
$(function(){
  $('.prev').click(function(){
	  $(".prev").css("font-size",40 + "px");
  });
});
</script>

<li class="prev">prev</li>
<li class="next">next</li>
<button type="button" class="btn btn-default btn-lg">
  <span class="glyphicon glyphicon-star" aria-hidden="true"></span> prev
</button>

</div>


</div>
slider wrapper

</div>
container
<script>
var slides = document.querySelector('.slides'),
slide= document.querySelectorAll('.slides li'),
//만약 슬라이드가 넘칠 경우를 대비해 하는 방법>>>개수를 아는 방법
currentIdx=0,
//처음을 0으로 시작
slideCount = slide.length,
prevBtn = document.querySelector('.prev'),
slideWidth =300,
//변수 설정
slideMargin =30,
//변수 설정
nextBtn =document.querySelector('.next');
//순서가 지나면 다시 돌아오도록 하기

slides.style.width=(slideWidth+ slideMargin)*slideCount - slideMargin +'px';
//슬라이드 하나마다의 수식 이미지를 담는 div의 넓이 늘리기 공식	

function moveSlide(num){
	//슬라이드를 옮기기위함
	//바로 위에 있는 값 건들거임
	slides.style.left = -num * 330 +'px';
	currentIdx = num;
}
/* 
 
 nextBtn.bigger('click',function(){
	nextBtn.style.background-color=(black);
})
*/
nextBtn.addEventListener('click',function(){
	//클릭을 하면 moveSlide에게 넘겨줌
	moveSlide(currentIdx + 1);
	
});
prevBtn.addEventListener('click',function(){
	//클릭을 하면 moveSlide에게 넘겨줌
	moveSlide(currentIdx - 1);
});
</script> -->
</body>
</html>