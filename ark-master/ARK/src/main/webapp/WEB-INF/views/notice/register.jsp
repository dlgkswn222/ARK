<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ include file="../includes/header.jsp"%>

<link rel="stylesheet" href="../resources/css/skel-noscript.css" />
<link rel="stylesheet" href="../resources/css/style.css" />
<link rel="stylesheet" href="../resources/css/style-desktop.css" />


<!-- 페이지 머리 -->


<style>
.sub_top_ban {
	width: 100%;
	clear: both;
	height: 240px;
	margin-bottom: 30px;
	background-color: #222;
	background-image: url(/resources/images/sub_top_bg.jpg);
	background-position-x: center;
	background-repeat: no-repeat;
	background-position-y: 0px;
	background-attachment: fixed;
	background-size: cover;
	background-origin: padding-box;
}

.contai6 {
	display: table;
	table-layout: fixed;
	position: relative;
	width: 1000px;
	min-height: 100%;
	margin: 0 auto;
}

.contents2 {
	margin: 20px 0 auto;
}

.contents2 .title {
	min-height: 30px;
	margin: 10px 0 20px;
	border-bottom: 1px solid #e8e8e8;
}

.xans-board-product {
	position: relative;
	min-height: 130px;
	margin: 0 0 20px;
	padding: 30px 20px 70px;
	border: 5px solid #e8e8e8;
}

.xans-board-product .prdThumb {
	position: absolute;
}

.xans-board-product .prdThumb img {
	width: 90px;
	height: 130px;
	border: 1px solid #d5d5d5;
}

.xans-board-product .prdInfo {
	padding: 0 0 0 255px;
}

.xans-board-product .prdInfo h3 {
	margin: 17px 0 5px;
	font-size: 14px;
	color: #2e2e2e;
}

.xans-board-product .prdInfo .price {
	font-size: 14px;
	font-weight: bold;
	color: #008bcc;
}

.xans-board-product .prdInfo .button {
	margin: 19px 0 0 0;
	padding: 13px 0 0 0;
	border-top: 1px solid #e8e8e8;
}

.contai6 .title p {
	display: inline-block;
	margin: 0 0 0 6px;
	padding: 0 0 0 10px;
	color: #939393;
	vertical-align: bottom;
	background: url(//pics.auction.co.kr/customer/bl_two_tab.gif) no-repeat
		0 2px;
}

.contai6 .title h2 {
	display: inline-block;
	padding: 0 0 0 12px;
	color: #2e2e2e;
	font-size: x-large;
}

.boardView table {
	table-layout: fixed;
	border: 1px solid #d7d5d5;
	color: #353535;
	line-height: 180%;
	width: -webkit-fill-available;
}

.boardView table th {
	width: 110px;
	padding: 10px 0 8px 20px;
	border-top: 1px solid #e8e8e8;
	border-right: 1px solid #e8e8e8;
	background-color: #fbfafa;
	text-align: left;
	font-weight: normal;
}

.boardView table td input {
	width: -webkit-fill-available;
	padding: 10px 0 8px 10px;
	border-top: 1px solid #e8e8e8;
}

.boardView table tr.view td {
	padding: 0;
	border: 0;
	line-height: 140%;
}

.boardView table tr.view td .detali {
	position: relative;
	z-index: 2;
	margin: -1px 0 0;
	padding: 17px 0 15px 20px;
	border-top: 1px solid #d7d5d5;
	word-break: break-all;
	line-height: 16px;
	letter-spacing: 0px;
}

.main-search-btn {
	width: 80px;
	height: 40px;
	border: 1px #3399dd solid;
	margin: 15px auto;
	background-color: #f7f7f7;
	text-align: center;
	font-size: 18px;
	cursor: pointer;
	color: #333;
	border-radius: .25rem;
}

.input_area1 {
	width: 105px;
	border: 1px #3399dd solid;
	margin: 15px;
	background-color: #f7f7f7;
	text-align: center;
	font-size: 18px;
	cursor: pointer;
	color: #333;
	border-radius: .25rem;
}

#reply {
	margin: 30px 0 0;
	padding: 20px 20px 20px;
	border: 1px solid #e9e9e9;
	background-color: #fbfafa;
	color: #353535;
}

.input_area {
	border: 1px solid #b3b3b3;
}

#repCon {
	display: block;
	overflow-x: hidden;
	overflow-y: auto;
	position: relative;
	z-index: 1;
	width: 100%;
	height: 56px;
	padding: 15px 0 0;
	margin: 0;
	padding-right: 16px;
	border: none;
	color: #333;
	background-color: transparent;
	background-color: rgba(255, 255, 255, .001);
	font-size: 20px;
	-webkit-appearance: none;
	vertical-align: top;
	resize: none;
	box-sizing: border-box;
}

.card-button {
	text-align: end;
	padding: .75rem 1.25rem;
	margin-bottom: 0;
	background-color: rgba(0, 0, 0, .03);
	border-bottom: 1px solid rgba(0, 0, 0, .125);
}

.u_cbox_text {
	display: block;
	overflow-x: hidden;
	overflow-y: auto;
	position: relative;
	z-index: 1;
	width: 100%;
	height: 56px;
	padding: 6px 0 0;
	margin: 0;
	padding-right: 16px;
	border: none;
	color: #333;
	background-color: transparent;
	background-color: rgba(255, 255, 255, .001);
	font-size: 20px;
	-webkit-appearance: none;
	vertical-align: top;
	resize: none;
	box-sizing: border-box;
}
</style>

<div class="sub_top_ban"></div>


<div class="contents2">
	<div class="contai6">
		<div class="title">
			<h2>
				<font>공지사항 글작성</font>
			</h2>
		</div>

		<form role="form" action="/notice/register" method="post">

			<input type="hidden" name="${_csrf.parameterName }"
				value="${_csrf.token}" />

			<div class="boardView">

				<table>
					<tbody>
						<tr>
							<th scope="row">제목</th>
							<td><input class="detali" name="nttitle"></td>
						</tr>

						<tr>
							<th scope="row">파일 첨부</th>
							<td><input type="file" name="uploadFile" multiple>
								<div class="uploadResult">
									<ul></ul>
								</div></td>
						<tr class="view">
							<td colspan="2">
							<div><textarea id="ntcontent" name="ntcontent"></textarea></div>
							</td>
						</tr>



					</tbody>
				</table>
			</div>
			<div class="card-button">
				<button type="submit" class="btn btn-default">등록</button>
				<button type="reset" class="btn btn-default">취소</button>
			</div>
		</form>
	</div>

</div>



<script>
	//스마트 에딧
	var ckeditor_config = {
		resize_enaleb : false,
		enterMode : CKEDITOR.ENTER_BR,
		shiftEnterMode : CKEDITOR.ENTER_P,
		filebrowserUploadUrl : "/reivew/goods/ckUpload"
	};

	CKEDITOR.replace("ntcontent", ckeditor_config);
</script>

<script>
	$(document)
			.ready(
					function(e) {
						var formObj = $("form[role='form']");
						$("button[type='submit']")
								.on(
										"click",
										function(e) {
											e.preventDefault();
											console.log("submit clicked");

											var str = "";
											$(".uploadResult ul li")
													.each(
															function(i, obj) {
																var jobj = $(obj);
																console
																		.dir(jobj);
																console
																		.log("----------------절취선----------------------");
																console
																		.log(jobj
																				.data("filename"));

																str += "<input type='hidden' name='upload[";
																str += i
																		+ "].fileName' value='"
																		+ jobj
																				.data("filename");
																str += "'>";

																str += "<input type='hidden' name='upload[";
																str += i
																		+ "].uuid' value='"
																		+ jobj
																				.data("uuid");
																str += "'>";

																str += "<input type='hidden' name='upload[";
																str += i
																		+ "].uploadPath' value='"
																		+ jobj
																				.data("path");
																str += "'>";

																str += "<input type='hidden' name='upload[";
																str += i
																		+ "].fileType' value='"
																		+ jobj
																				.data("type");
																str += "'>";
															});
											formObj.append(str).submit();

										});

						var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");

						var maxSize = 5242880;

						function checkExtension(fileName, fileSize) {
							if (fileSize >= maxSize) {
								alert("파일 크기가 초과하였습니다.");
								return false;
							}
							if (regex.test(fileName)) {
								alert("해당 종류의 파일은 업로드가 불가합니다.");
								return false;
							}
							return true;
						}
						var csrfHeaderName = "${_csrf.headerName}";
						var csrfTokenValue = "${_csrf.token}";

						$("input[type='file']")
								.change(
										function(e) {
											var formData = new FormData();
											var inputFile = $("input[name='uploadFile']");
											var files = inputFile[0].files;

											for (var i = 0; i < files.length; i++) {
												if (!checkExtension(
														files[i].name,
														files[i].size)) {
													return false;
												}
												formData.append("uploadFile",
														files[i]);
											}

											$.ajax({
												url : '/uploadAjaxAction',
												processData : false,
												contentType : false,
												beforeSend : function(xhr) {
													xhr.setRequestHeader(
															csrfHeaderName,
															csrfTokenValue);
												},
												data : formData,
												type : 'POST',
												dataType : 'json',
												success : function(result) {
													console.log(result);
													showUploadResult(result);
												}
											});// ajax
										});// change

						function showUploadResult(uploadResultArr) {
							if (!uploadResultArr || uploadResultArr.length == 0) {
								return;
							}

							var uploadUL = $(".uploadResult ul");
							var str = "";

							$(uploadResultArr)
									.each(
											function(i, obj) {
												var fileCallPath = encodeURIComponent(obj.uploadPath
														+ "/"
														+ obj.uuid
														+ "_"
														+ obj.fileName);

												var fileLink = fileCallPath
														.replace(new RegExp(
																/\\/g), "/");

												str += "<li data-path='";
	str+=obj.uploadPath+"' data-uuid='";
	str+=obj.uuid+"' data-filename='";
	str+=obj.fileName+"' data-type='";
	str+=obj.image+"'><div>";
												str += "<img src='/resources/images/file.jpg'>";
												str += "<span>" + obj.fileName
														+ "</span>";
												str += "<b data-file='"+fileCallPath;
	str+="' data-type='file'>[취소]</b>";
												str += "</div></li>";
											});
							uploadUL.append(str);
						}

						$(".uploadResult").on(
								"click",
								"b",
								function(e) {
									console.log("delete file");

									var targetFile = $(this).data("file");
									var type = $(this).data("type");
									var targetLi = $(this).closest("li");

									$.ajax({
										url : '/deleteFile',
										data : {
											fileName : targetFile,
											type : type
										},
										beforeSend : function(xhr) {
											xhr.setRequestHeader(
													csrfHeaderName,
													csrfTokenValue);
										},
										dataType : 'text',
										type : 'POST',
										success : function(result) {
											alert("취소되었습니다.");
											targetLi.remove();
										}
									})
								});

					});// end
</script>
<%@ include file="../includes/footer2.jsp"%>
