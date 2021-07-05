<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
프로세스페이지<br>
<br>넘어온 데이터 : <%=request.getParameter("data1") %>
<br>검색결과 리스트는 :
<br><%
String[] bbb =request.getParameter("data1").split(",");

for(int i=0; i<bbb.length;i++){
	out.println(i+"번째 재료는"+bbb[i]);
}%>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
</body>
</html>