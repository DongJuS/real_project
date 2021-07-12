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
			
			str += "<input type='text' placeholder='재료재료이름' name='urIngre_name'>"
			str += " <input type='text' placeholder='이정도' name='urIngre_count'>"
			str += " <input type='text' placeholder='넣으셈' name='urIngre_unit'><br>"
			
			$(".ingre").append(str)
		})
	
		$('#proceplus').on('click', function(e) {
			e.preventDefault()
			var str = ''
			
			str += "<input type='text' placeholder='요래요래하시라' name='urtxt'>"
			str += " <input type='file'  id='uploadFile1'  accept='image/*'><br>"
			
			$('.proce').append(str)
		})
		
		$('#back').on("click",function(e){
			e.preventDefault()
			history.back()
		})
		
		
		
		//파일업로드
		$('input[id="uploadFile"]').change(function(e){
			e.preventDefault()
			var formData = new FormData()
		
			var inputFile = $('input[id="uploadFile"]')
			
			var files = inputFile[0].files	
		
			console.log(files);
			for (var i = 0; i < files.length; i++) {
				if (!checkExtension(files[i].name,	files[i].size)) {
					return false;}
			formData.append("uploadFile",files[i])
		
			}
			$.ajax({
				type:'post',
				url:'/uploadAjaxAction',
				processData: false,
				contentType: false,
				data:formData,
				dataType:'json',
				error:function(xhr,status,error){
				/* 	alert(error) */
				},
				success:function(result){
					showUploadedFile(result)

				/* 	alert(json) */
				}
			})
		
			
		}) 
 		$('#store').on('click',function(e){
 			e.preventDefault()
			var formData = new FormData()
			var inputFile1 = $('input[id="uploadFile1"]')
			for(var j=0; j<inputFile1.length; j++){
				var files = inputFile1[j].files	
				for (var i = 0; i < files.length; i++) {
					if (!checkExtension(files[i].name,	files[i].size)) {
						return false;}
					formData.append("uploadFile",files[i])
			
 			console.log(files);
				}
			}
			$.ajax({
				type:'post',
				url:'/uploadAjaxAction',
				processData: false,
				contentType: false,
				data:formData,
				dataType: 'json',
				error:function(xhr,status,error){
					/* alert(error) */
				},
				success:function(result){
					showUploadedFile(result)
					/* alert(json) */
				}
			})
 			/*   $("#insertform").submit()     */
			}) 
		
		
	    var formObj=$('form[role="form"]')
		$('input[type="submit"]').on('click', function(e){
			e.preventDefault()
			var str=''
			$(".uploadResult ul li").each(function(i, obj){
				var jobj=$(obj)
				str += "<input type='hidden' name='uploadFile["+i+"].filename' value='"+jobj.data('filename')+"'>"
				str += "<input type='hidden' name='uploadFile["+i+"].uuid' value='"+jobj.data('uuid')+"'>"
				str += "<input type='hidden' name='uploadFile["+i+"].uploadPath' value='"+jobj.data('path')+"'>"
				str += "<input type='hidden' name='uploadFile["+i+"].filetype' value='"+jobj.data('type')+"'>" 
				str += "<input type='hidden' name='uploadFile["+i+"].num' value='"+i+"'>"
				
				
				
			}) 
			  formObj.append(str).submit() 
		}) 
		
		 	function showUploadedFile(uploadResultArr) {
			if(!uploadResultArr||uploadResultArr.length==0){return}
			var uploadUL=$(".uploadResult ul")
			var str = ''
			$(uploadResultArr).each(function(i, obj) {
			
				if (obj.filetype) {
				var fileCallPath = encodeURIComponent(obj.uploadPath+ "/"+ obj.uuid+ "_"+ obj.filename);
					str +="<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.filename+"' data-type='"+obj.filetype+"'><div>"
					str +="<span>" + obj.filename + "</span>"
					str +="<button type='button' data-file=\""+fileCallPath+"\" data-type='file' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>"
					str +="<img src='/display?fileName="+fileCallPath+"'>"
					str +="</div></li>"
				} 
			})
			uploadUL.append(str)
		}   
   
	})
</script>
</head>
<body>
<jsp:include page="../include/header.jsp" flush="false" />
	<div class='container'>
		<form role='form' action='/project/urrecipe/register' method='post'  id='insertform' >
		<table>
			<tr>
				<td>주제</td>
				<td><input type='text' placeholder='요리주제' name='urname' ></td>
			</tr>
			<tr>
				<td>소개</td>
				<td><input type='text' placeholder='우짜다 이걸 만들엇댜?' name='ursummary'></td>
			</tr>
			<tr>
				<td>대표사진</td>
				 <td> <input type='file'  id='uploadFile' accept="image/*"></td> 
			</tr>
		</table>
			
		
		<table>
			<tr>
				<td>재료</td>
			</tr>
			<tr>
				<td><div class='ingre'>
				<input type='text' placeholder='예) 후추를 후춧후춧' name='urIngre_name'> 
				<input type='text' placeholder='2' name='urIngre_count'> 
				<input type='text' placeholder='티수푼' name='urIngre_unit'><br> 
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
	<!-- 			<input type='text' placeholder='요래요래 하시라' name='txt'> --> 
<!-- 				<input type='file'   id='uploadFile1' accept="image/*"><br>
 -->				</div></td>
			</tr>
			<tr>
				<td><button value='추가' id='proceplus'>추가하고싶으면 눌러</button></td>
			</tr>
			<tr>
				<td><input type='button' value='저장' id='store'></td>
				<td><input type='submit' value='저장하고 리스트페이지로'></td>
				<td><input type='button' value='뒤로' id='back'></td>
			</tr>
		</table>
		</form>
	</div>
	<div class='uploadResult'>
					<ul></ul>
				</div>
		<jsp:include page="../include/footer.jsp" />
</body>
</html>