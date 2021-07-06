<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>요들넷</title>
<style>
header {
	background-color: #FF4500;
}
</style>
<script>
	$(document).ready(function() {
		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$")
		function checkExtension(fileName){
			if (regex.test(fileName)) {
				alert("이미지 파일만 넣어주세요")
				return false
				}
			return true;
		}
		
		
		$('#ingreplus').on('click', function(e) {
			e.preventDefault()
			var str = ''
			str += "<input type='text' placeholder='재료재료이름' name='ingre_name'>"
			str += " <input type='text' placeholder='이정도' name='ingre_count'>"
			str += " <input type='text' placeholder='넣으셈' name='ingre_unit'><br>"
			$(".ingre").append(str)
		})
		$('#proceplus').on('click', function(e) {
			e.preventDefault()
			var str = ''
			str += "<input type='text' placeholder='요래요래하시라' name='txt'>"
			str += " <input type='file' multiple name='pimg'><br>"
			$('.proce').append(str)
		})
		
		$('#back').on("click",function(e){
			e.preventDefault()
			history.back()
		})

	})
</script>
</head>
<body>
<jsp:include page="../include/header.jsp" flush="false" />
	<div class='container'>
		<form role='form' action='/recipe/register' method='post' >
		<table>
			<tr>
				<td>주제</td>
				<td><input type='text' placeholder='요리주제' name='name' ></td>
			</tr>
			<tr>
				<td>소개</td>
				<td><input type='text' placeholder='우짜다 이걸 만들엇댜?' name='summary'></td>
			</tr>
			<tr>
				<td>대표사진</td>
				<td> <input type='file' name='img' ></td>
			</tr>
		</table>
			
		
		<table>
			<tr>
				<td>재료</td>
			</tr>
			<tr>
				<td><div class='ingre'>
				<input type='text' placeholder='예) 후추를 후춧후춧' name='ingre_name'> 
				<input type='text' placeholder='2' name='ingre_count'> 
				<input type='text' placeholder='티수푼' name='ingre_unit'><br> 
			</div></td>
			</tr>
			<tr>
				<td><button value='추가하고싶으면 넣어' id='ingreplus'>추가하고싶으면 눌러</button></td>
			</tr>
		</table>
		
		<table>
			<tr>
				<td>요리순서</td>
			</tr>
			<tr>
				<td><div class='proce'>
				<input type='text' placeholder='요래요래 하시라' name='txt'> 
				<input type='file'  name='pimg'><br>
				</div></td>
			</tr>
			<tr>
				<td><button value='추가' id='proceplus'>추가하고싶으면 눌러</button></td>
			</tr>
			<tr>
				<td><input type='submit' value='저장'></td>
				<td><input type='button' value='뒤로'></td>
			</tr>
		</table>
		</form>
	</div>
		<jsp:include page="../include/footer.jsp" />
</body>
</html>