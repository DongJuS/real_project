<%@page import="org.springframework.ui.Model"%>
<%@page import="java.util.Arrays"%>
<%@page import="org.conan.domain.SearchResultVO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요들넷-검색결과</title>
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
</style>
</head>
<body>
   <jsp:include page="include/header.jsp" />
   <%-- <% ArrayList<SearchResultVO> srvo = (ArrayList<SearchResultVO>)request.getAttribute("srvo");%> --%>
   <div class="result_container">
      <jsp:useBean id="srvo" scope="request" class="java.util.ArrayList"
         type="java.util.ArrayList<SearchResultVO>" />


      <div style="margin: 10px;">
         총 <strong style="font-size: 19px;">${srvo.size()}</strong>개의 레시피가
         검색되었습니다. <br>
         <span class="your_ings">입력하신 재료 목록 : ${yourIngs}</span> <span
            id="guide_text1">&nbsp;&nbsp; *부족한 재료는 회색으로 표시됩니다!</span>
      </div>

      <hr>
      <c:forEach var="i" begin="0" end="${max}">
         <c:forEach var="recip" items="${srvo}" begin="0" end="${srvo.size()}">

            <c:if test="${i eq recip.needIngs.size()}">

               <a href="recipe/get?rid=${recip.rid}"><div class="result_div">
                  <img class="foodImg" src="${recip.img}">
                  <div class="recipe_text">
                     <span class="recip_name">${recip.name}</span> <br>
                     <span class="haveIngs_list">필요한 재료 : <c:if
                           test="${not empty recip.haveIngs}">${recip.haveIngs}</c:if></span>&nbsp;<span
                        class="needIngs_list"> <c:if
                           test="${not empty recip.needIngs}">${recip.needIngs}</c:if></span>

                     <c:choose>
                        <c:when test="${recip.needIngs.size() eq 0}">
                           <br>
                           <span class="recip_ingsCountText">*보유중인 재료들로 요리가 가능한 레시피
                              입니다 ! (${recip.haveIngs.size()} / ${recip.ingsList.size()})</span>
                        </c:when>
                        <c:otherwise>
                           <br>
                           <span class="recip_ingsCountText">*
                              ${recip.needIngs.size()} 개의 재료가 부족해요 !
                              (${recip.haveIngs.size()} / ${recip.ingsList.size()})</span>
                        </c:otherwise>
                     </c:choose>

                     <br>
                     <span class="summary">${recip.summary}</span>


                     <%-- 레시피에 필요한 재료의 총 갯수는 ${recip.ingsList.size()}개 입니다.
<br>레시피에 필요한 재료 리스트 입니다.
<br>${recip.ingsList}
<br>추가 구매가 필요한 재료 리스트 입니다.
<br>${recip.needIngs}
<br>현재 고객님께서 보유중인 재료 리스트 입니다.
<br>${recip.haveIngs} --%>
                     <%-- <c:forEach var="needs" items="${recip.needIngs}" begin="1" end="${recip.needIngs.length}">
필요한 재료는 ${needs}
</c:forEach> --%>


                  </div>
               </div></a>
            </c:if>
         </c:forEach>
      </c:forEach>
      <%-- <%
for(int i=0;i<=2;i++){
   for(SearchResultVO a : srvo){
      if(i == a.getNeedIngsCount()){
         out.println("<div class=''>");
         out.println("<div class='recipe_text'>레시피 이름은" + a.getName());
         out.println(a.getSummary());
         out.println(a.getRid()+"번 레시피에 추가로 필요한 재료의 개수는"+i+"개 입니다"+"<br>");
         out.println("요리에 들어가는 재료의 총 갯수는"+a.getRIngsCount()+"개 이고,<br>");
         for(int j=0;j<a.getNeedIngs().length;j++){
            out.println("필요한 재료는 '"+a.getNeedIngs()[j]+"'<br>");   
         }   
         out.println("</div></div><hr>");
      }
   }
}

%> --%>


   </div>
   <jsp:include page="include/footer.jsp" />
</body>

<script>
$(document).ready(function() {
   var searchList = localStorage.getItem('searchList');
   console.log(searchList);
   console.log("<%=request.getParameter("data1")%>
   ");
      /* var cookings = localStorage.getItem('cookings')
      var searchList = localStorage.getItem('searchList')
      console.log(cookings[0]);
      console.log(cookings[1]);
      console.log(searchList);
      console.log(searchList[1]);
      console.log(typeof(searchList));
      console.log(typeof(cookings)); */

   });
</script>

</html>