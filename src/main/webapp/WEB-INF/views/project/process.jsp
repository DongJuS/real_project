<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
���μ���������<br>
<br>�Ѿ�� ������ : <%=request.getParameter("data1") %>
<br>�˻���� ����Ʈ�� :
<br><%
String[] bbb =request.getParameter("data1").split(",");

for(int i=0; i<bbb.length;i++){
	out.println(i+"��° ����"+bbb[i]);
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