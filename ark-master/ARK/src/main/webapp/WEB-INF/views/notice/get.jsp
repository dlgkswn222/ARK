<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp"%>

<link rel="stylesheet" href="../resources/css/skel-noscript.css" />
<link rel="stylesheet" href="../resources/css/style.css" />
<link rel="stylesheet" href="../resources/css/style-desktop.css" />

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
</style>

<div class="sub_top_ban"></div>


<form id="operForm" action="/notice/modify" method="get">
	<input type="hidden" id="ntnum" name="ntnum" value="${notice.ntnum }" />
	<input type="hidden" id="pageNum" name="pageNum"
		value="${cri.pageNum }" /> <input type="hidden" id="amount"
		name="amount" value="${cri.amount }" />
</form>


<div class="contents2">
	<div class="contai6">
		<div class="title">
			<h2>
				<font>공지 사항</font>
			</h2>
			<p>공지 사항 입니다</p>
		</div>

		<div class="boardView">

			<table>
				<tbody>
					<tr>
						<th scope="row">제목</th>
						<td><input class="content-box1" name="nttitle"
							value='<c:out
					value="${notice.nttitle }"/>'
							readonly="readonly"></td>
					</tr>

					<tr>
						<th scope="row">첨부 파일</th>
						<td>
							<div class="uploadResult">
								<ul></ul>
							</div>
						</td>
					<tr class="view">

						<td colspan="2"><div class="detali" name="ntcontent"
								readonly>

							${notice.ntcontent }
							</div></td>
					</tr>
				</tbody>
			</table>
<sec:authorize access="hasRole('ROLE_ADMIN')">
			<button data-oper="modify" class="main-search-btn">수정</button>
</sec:authorize>
			<button data-oper="list" class="main-search-btn">목록</button>


		</div>
	</div>
</div>



<script>
	$(document).ready(function() {
		var operForm = $("#operForm");
		$("button[data-oper='modify']").on("click", function(e) {
			operForm.attr("action", "/notice/modify").submit();
		});
		$("button[data-oper='list']").on("click", function(e) {
			operForm.find("#ntnum").remove();
			operForm.attr("action", "/notice/list");
			operForm.submit();
		});
	});
</script>

<script>
	$(document)
			.ready(
					function() {
						(function() {
							var ntnum = '<c:out value="${notice.ntnum}"/>';

							$
									.getJSON(
											"/notice/getUpload",
											{
												ntnum : ntnum
											},
											function(arr) {
												console.log(arr);

												var str = "";
												$(arr)
														.each(
																function(i,
																		upload) {
																	str += "<li data-path='";
				str+=upload.uploadPath+"' data-uuid='";
				
				str+=upload.uuid+"' data-filename='";
				str+=upload.fileName+"' data-type='";
				str+=upload.fileType+"'><div>";
																	str += "<img src='/resources/images/file.jpg'>";

																	str += "<span>"
																			+ upload.fileName
																			+ "</span><br/>";
																	str += "</div></li>";
																});
												$(".uploadResult ul").html(str);

											});
						})();

						$(".uploadResult").on(
								"click",
								"li",
								function(e) {
									console.log("donwload file");
									var liObj = $(this);
									var path = encodeURIComponent(liObj
											.data("path")
											+ "/"
											+ liObj.data("uuid")
											+ "_"
											+ liObj.data("filename"));
									self.location = "/download?fileName="
											+ path;
								});
					});
</script>

<%@ include file="../includes/footer2.jsp"%>