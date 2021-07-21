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
body {
	margin: 8px;
}

header {
	background-color: #FF4500;
}

#insertform {
	padding: 30px;
}

table tr th {
	background: #f1f2f2;
	min-width: 200px;
	text-align: center;
	border: 1px solid #e2dede;
	border-right-style: none;
}

table tr {
	
}

table td {
	padding: 20px;
	background: white;
	border: solid 1px #e2dede;
	border-left-style: none;
	text-align: center;
}

.proce_div {
	margin: 10px;
}

.ingre_div {
	margin: 10px;
}

.plus_button {
	BORDER: SOLID 1PX #E2DEDE;
	BACKGROUND: #f1f2f2;
	COLOR: BLACK;
	BORDER-RADIUS: 100PX;
	WIDTH: 30PX;
	HEIGHT: 30PX;
}

.guide_text {
	font-size: 10px;
	margin-left: 10px;
	color: darkgray;
}

.input_long {
	width: 80%;
	font-size: 15px;
}

.input_short {
	margin: 10px;
}

.input_ingre {
	text-align: center;
}
#submit_buttons{
display: inline-flex;
padding: 25px;
width: 100%;
}
#button_left{
margin-left: 11%;
}
#button_middle{
margin-left: 52%;
}
#button_right{
margin-left: 10px;
}
.submit_icon{
display: inline-block;
  outline: none;
  cursor: pointer;
  text-align: center;
  text-decoration: none;
  font: 14px/100% Arial, Helvetica, sans-serif;
  padding: .5em 1em .55em;
  text-shadow: 0 1px 1px rgba(0,0,0,.3);
  -webkit-border-radius: .5em;
  -moz-border-radius: .5em;
  border-radius: .5em;
  -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.2);
  -moz-box-shadow: 0 1px 2px rgba(0,0,0,.2);
  box-shadow: 0 1px 2px rgba(0,0,0,.2);
}
.submit_icon:hover {
  text-decoration: none;
}
.submit_icon:active {
  position: relative;
  top: 1px;
}

.orange {
  color: #fef4e9;
  border: solid 1px #da7c0c;
  background: #f78d1d;
  background: -webkit-gradient(linear, left top, left bottom, from(#faa51a), to(#f47a20));
  background: -moz-linear-gradient(top,  #faa51a,  #f47a20);
  filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#faa51a', endColorstr='#f47a20');
}
.orange:hover {
  background: #f47c20;
  background: -webkit-gradient(linear, left top, left bottom, from(#f88e11), to(#f06015));
  background: -moz-linear-gradient(top,  #f88e11,  #f06015);
  filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#f88e11', endColorstr='#f06015');
}
.orange:active {
  color: #fcd3a5;
  background: -webkit-gradient(linear, left top, left bottom, from(#f47a20), to(#faa51a));
  background: -moz-linear-gradient(top,  #f47a20,  #faa51a);
  filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#f47a20', endColorstr='#faa51a');
}
.main_text{
    width: 100%;
    text-align: center;
    margin-top: 25px;
}
</style>
<script>
	$(document)
			.ready(
					function() {
						var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$")
						function checkExtension(fileName) {
							if (regex.test(fileName)) {
								alert("이미지 파일만 넣어주세요")
								return false
							}
							return true;
						}

						$('#ingreplus')
								.on(
										'click',
										function(e) {
											e.preventDefault()
											var str = ''

											str += "<div class='ingre_div'><input class='input_ingre' type='text' placeholder='재료명' name='urIngre_name'>"
											str += " <input class='input_ingre' type='text' placeholder='재료 수' name='urIngre_count'>"
											str += " <input class='input_ingre' type='text' placeholder='재료 단위' name='urIngre_unit'></div>"

											$(".ingre").append(str)
										})

						$('#proceplus')
								.on(
										'click',
										function(e) {
											e.preventDefault()
											var str = ''

											str += "<input class='input_long' type='text' placeholder='요리순서에 맞는 설명을 입력해주세요'name='urtxt'><br>"
											str += " <input class='input_short' type='file' value='참고 이미지 첨부' id='uploadFile1'  accept='image/*'>"

											$('.proce').append(str)
										})

						$('#back').on("click", function(e) {
							e.preventDefault()
							history.back()
						})

						//파일업로드
						$('input[id="uploadFile"]').change(
								function(e) {
									e.preventDefault()
									var formData = new FormData()

									var inputFile = $('input[id="uploadFile"]')

									var files = inputFile[0].files

									console.log(files);
									for (var i = 0; i < files.length; i++) {
										if (!checkExtension(files[i].name,
												files[i].size)) {
											return false;
										}
										formData.append("uploadFile", files[i])

									}
									$.ajax({
										type : 'post',
										url : '/uploadAjaxAction',
										processData : false,
										contentType : false,
										data : formData,
										dataType : 'json',
										error : function(xhr, status, error) {
											/* 	alert(error) */
										},
										success : function(result) {
											showUploadedFile(result)

											/* 	alert(json) */
										}
									})

								})
						$('#store')
								.on(
										'click',
										function(e) {
											e.preventDefault()
											var formData = new FormData()
											var inputFile1 = $('input[id="uploadFile1"]')
											for (var j = 0; j < inputFile1.length; j++) {
												var files = inputFile1[j].files
												for (var i = 0; i < files.length; i++) {
													if (!checkExtension(
															files[i].name,
															files[i].size)) {
														return false;
													}
													formData.append(
															"uploadFile",
															files[i])

													console.log(files);
												}
											}
											$.ajax({
												type : 'post',
												url : '/uploadAjaxAction',
												processData : false,
												contentType : false,
												data : formData,
												dataType : 'json',
												error : function(xhr, status,
														error) {
													/* alert(error) */
												},
												success : function(result) {
													showUploadedFile(result)
													/* alert(json) */
												}
											})
											/*   $("#insertform").submit()     */
										})

						var formObj = $('form[role="form"]')
						$('input[type="submit"]')
								.on(
										'click',
										function(e) {
											e.preventDefault()
											var str = ''
											$(".uploadResult ul li")
													.each(
															function(i, obj) {
																var jobj = $(obj)
																str += "<input type='hidden' name='uploadFile["
																		+ i
																		+ "].filename' value='"
																		+ jobj
																				.data('filename')
																		+ "'>"
																str += "<input type='hidden' name='uploadFile["
																		+ i
																		+ "].uuid' value='"
																		+ jobj
																				.data('uuid')
																		+ "'>"
																str += "<input type='hidden' name='uploadFile["
																		+ i
																		+ "].uploadPath' value='"
																		+ jobj
																				.data('path')
																		+ "'>"
																str += "<input type='hidden' name='uploadFile["
																		+ i
																		+ "].filetype' value='"
																		+ jobj
																				.data('type')
																		+ "'>"
																str += "<input type='hidden' name='uploadFile["+i+"].num' value='"+i+"'>"

															})
											formObj.append(str).submit()
										})

						function showUploadedFile(uploadResultArr) {
							if (!uploadResultArr || uploadResultArr.length == 0) {
								return
							}
							var uploadUL = $(".uploadResult ul")
							var str = ''
							$(uploadResultArr)
									.each(
											function(i, obj) {

												if (obj.filetype) {
													var fileCallPath = encodeURIComponent(obj.uploadPath
															+ "/"
															+ obj.uuid
															+ "_"
															+ obj.filename);
													str += "<li style='display: none;' data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.filename+"' data-type='"+obj.filetype+"'><div>"
													str += "<span>"
															+ obj.filename
															+ "</span>"
													str += "<button type='button' data-file=\""+fileCallPath+"\" data-type='file' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>"
													str += "<img src='/display?fileName="
															+ fileCallPath
															+ "'>"
													str += "</div></li>"
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
	<div class="main_text"><img src="/resources/proimg/register.png"></div>
		<form role='form' action='/project/urrecipe/register' method='post'
			id='insertform'>
			<table style="margin: 0 auto;">
				<tr>
					<th>레시피 이름</th>
					<td><input class="input_long" type='text'
						placeholder='ex)10분이면 충분한 제육볶음!' name='urname'></td>
				</tr>
				<tr>
					<th>레시피 한 줄 설명</th>
					<td><input class="input_long" type='text'
						placeholder='ex)자취생 손 머리위로 올려~! 간단하고 맛난 제육볶음 레시피' name='ursummary'></td>
				</tr>
				<tr>
					<th>음식사진
						<p style="font-size: 10px; margin-bottom: 3px;">* 한 장의 사진만 선택해
							주세요!</p>
					</th>
					<td><div class='uploadResult'>
							<ul style="list-style-type: none;"></ul>
						</div> <input type='file' id='uploadFile' accept="image/*"></td>
				</tr>

				<tr>
					<th>재료</th>

					<td><div class='ingre'>
							<div class='ingre_div'>
								<input class="input_ingre" type='text' placeholder='예)참기름'
									name='urIngre_name'> <input class="input_ingre"
									type='text' placeholder='2' name='urIngre_count'> <input
									class="input_ingre" type='text' placeholder='숟가락'
									name='urIngre_unit'>
							</div>
						</div>
						<button class="plus_button" value='+' id='ingreplus'>+</button>
						<span class="guide_text">*재료를 추가하시려면 버튼을 눌러주세요</span></td>


				</tr>

				<tr>
					<th>요리순서</th>

					<td><div class='proce'>
							<input type='text' class="input_long"
								placeholder='프라이팬에 식용유를 두른 후, 볶아주세요.' name='txt'><br>
							<input type='file' class="input_short" id='uploadFile1'
								accept="image/*">
						</div>
						<button class="plus_button" value='추가' id='proceplus'>+</button>
						<span class="guide_text">*요리 순서를 추가하시려면 버튼을 눌러주세요</span></td>


				</tr>




			</table>
			<div id="submit_buttons">
			<div id="button_left" style="display:inline-flex;">
				<input class="submit_icon orange" type='button' value='뒤로' id='back'></div> 
				<div id="button_middle"><input class="submit_icon orange" 
					type='button' value='저장' id='store'></div> 
					<div id="button_right"><input class="submit_icon orange"  type='submit'
					value='저장 후 목록으로'></div>
			</div>
		</form>
	</div>

	<jsp:include page="../include/footer.jsp" />
</body>
</html>