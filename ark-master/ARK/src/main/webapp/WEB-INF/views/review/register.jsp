<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ include file="../includes/header.jsp"%>
<script src="/resources/ckeditor/ckeditor.js"></script>

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
				<font>글 작성</font>
			</h2>
		</div>

		<form role="form" action="/review/register" method="post"
			enctype="multipart/form-data">
			<input type="hidden" name="${_csrf.parameterName }"
				value="${_csrf.token}" />


			<div class="boardView">

				<table>
					<tbody>

						<tr>
							<th scope="row">작성자</th>
							<td><input name="writer"
								value='<sec:authentication 
property="principal.username"/>'
								readonly="readonly"></td>
						</tr>

						<tr>
							<th scope="row">제목</th>

							<td><input class=title name="title"></td>
						</tr>

						<tr>
							<th scope="row">파일 첨부</th>
							<td><input type="file" id="gdsImg" name="file" />
								<div class="select_img">
									<img src="" />
								</div></td>
						</tr>

						<tr class="view">
							<td colspan="2">
								<div>
									<textarea id="content" name="content"></textarea>
								</div>
							</td>
						</tr>

					</tbody>
				</table>
			</div>
		</form>
		<div class="card-button">
			<button type="submit" class="btn btn-default">등록</button>
			<button type="submit" class="btn btn-default">리셋</button>
		</div>
	</div>
</div>

<script>
	$("#gdsImg").change(
			function() {
				if (this.files && this.files[0]) {
					var reader = new FileReader;
					reader.onload = function(data) {
						$(".select_img img").attr("src", data.target.result)
								.width(500);
					}
					reader.readAsDataURL(this.files[0]);
				}
			});
</script>


<script>
	//스마트 에딧
	var ckeditor_config = {
		resize_enaleb : false,
		enterMode : CKEDITOR.ENTER_BR,
		shiftEnterMode : CKEDITOR.ENTER_P,
		filebrowserUploadUrl : "/admin/goods/ckUpload"
	};

	CKEDITOR.replace("content", ckeditor_config);

	/*  
	 var csrfHeaderName = "${_csrf.headerName}";
	 var csrfTokenValue = "${_csrf.token}";
	 $(document).ajaxSend(function(e,xhr,options) {
	 xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
	
	 });
	 */
</script>

<script>
	$(document).ready(function(e) {
		var formObj = $("form[role='form']");
		$("button[type='submit']").on("click", function(e) {
			e.preventDefault();
			console.log("등록하기를 눌렀습니다.");
			formObj.submit();
		});

	}); //ready 종료
</script>

<%@ include file="../includes/footer2.jsp"%>