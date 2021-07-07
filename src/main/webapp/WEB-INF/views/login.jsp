<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
.login {
	padding: 15px;
	float: center;
}

header {
	margin-top: 0px;
	background-color: orange;
	height: 200px;
}
/* td{
border: 1px solid black;
border-radius: 0.5em;
} */
tr {
	border: 1px solid black;
	text-align: center;
}

th {
	border-radius: 1em;
	background-color: orange;
	border: 1px solid #ff9800;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="login">
		<form action="/loginProc" method="post">
			<table
				style="border: 1px solid black; margin-left: auto; margin-right: auto; border-radius: 1em; width: 500px; height: 300px;">
				<tr>
					<th>로그인</th>
				</tr>
				<tr>
					<td>아이디 :<input type="text" name="id"></td>
				</tr>
				<tr>
					<td>비밀번호:<input type="password" name="pwd"></td>
				</tr>
				<tr>
					<td><input type="submit" value="로그인"
						style="width: 100px; height: 50px;"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>