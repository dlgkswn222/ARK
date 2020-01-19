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
	width: 115px;
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

.u_cbox .u_cbox_write:after {
	display: block;
	clear: both;
	content: '';
}

.u_cbox .u_cbox_info_base:after {
	display: block;
	clear: both;
	content: '';
}

.u_cbox {
	font-size: 12px;
	line-height: 4em;
}

.u_cbox_comment_box {
	position: relative;
	border-bottom: 1px solid #e2e2e2;
}

.u_cbox_area {
	padding: 15px 0;
}

.u_cbox_info {
	padding-bottom: 1px;
	font-size: 15px;
	font-weight: 900;
}

.u_cbox_text_wrap {
	overflow: hidden;
	font-size: 20px;
	line-height: 18px;
	word-break: break-all;
	word-wrap: break-word;
	padding: 10px 0 0 0;
}

.u_cbox_info_base {
	display: inline-block;
	position: relative;
	margin-bottom: 7px;
	padding: 10px 0 0 0;
	font-size: 15px;
}

.u_cbox_tool {
	float: right;
}

</style>


<div class="sub_top_ban"></div>

<div class="contents2">
	<div class="contai6">
		<div class="title">
			<h2>
				<font>글 작성</font>
			</h2>
			<p>여기는 공유하는 곳입니다</p>
		</div>

			
			<img style="width: 200px; height: 150px; outline-style: auto; "
				src="/resources/images/upload${review.gdsthumbimg}">
			



		<div class="boardView">

			<table>
				<tbody>
					<tr>
						<th scope="row">게시물 번호</th>
						<td><input name="num"  value='<c:out value="${review.num }"/>'
							readonly></td>
					</tr>
					<tr>
						<th scope="row">제목</th>
						<td><input name="title"
							value='<c:out value="${review.title }"/>' readonly></td>
					</tr>
					<tr>
						<th scope="row">작성자</th>
						<td><input name="writer"
							value='<c:out value="${review.writer }"/>' readonly></td>
					</tr>

					<tr class="view">

						<td colspan="2"><div class="detali" readonly>
								<c:out value="${review.content }" />
							</div></td>
					</tr>

				</tbody>
			</table>
			
			<div class="card-header py-3" align="right">
				<sec:authentication property="principal" var="itsme" />
				<sec:authorize access="isAuthenticated()">
					<c:if test="${itsme.username eq review.writer}">
						<button data-oper="modify" class="main-search-btn">수정</button>
					</c:if>

				</sec:authorize>
				<button data-oper="list" class="main-search-btn">목록</button>
			</div>
		</div>





		<form id="operForm" action="/review/modify" method="get">
			<input type="hidden" id="num" name="num" value="${review.num }" /> <input
				type="hidden" name="pageNum" value="${cri.pageNum }" /> <input
				type="hidden" name="amount" value="${cri.amount }" />
		</form>

		<br> <br>
		<div id="reply">
			<sec:authorize access="isAnonymous()">
				<p>
					소감을 남기시려면 <a href="/customLogin">로그인</a>해주세요
				</p>
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
				<section class="replyForm">
					<form role="form" method="post" autocomplete="off">

						<input type="hidden" id="num" name="num" value="${review.num}">
						<input type="hidden" name="id"
							value="<sec:authentication property="principal.username"/>">

						<div class="btn">
							
							<a type="submit" id="reply_btn"
								class="skinbtn point2 gv-reviewwrite">소감 남기기</a>

						</div>

						<div class="input_area">
							<textarea name="repCon" id="repCon"></textarea>
						</div>

						<input type="hidden" name="${_csrf.parameterName }"
							value="${_csrf.token }" />
					</form>
				</section>
			</sec:authorize>
		</div>
		<!-- reply  -->

		<div class="u_cbox">
		<ul class="u_cbox_list">
			<c:forEach items="${reply}" var="reply">

				<li>
					<div class="u_cbox_comment_box">
						<div class="u_cbox_area">
							<div class="u_cbox_info">
								<span class="userId">${reply.userId} 님의덧글</span>
							</div>
							<div class="u_cbox_text_wrap">${reply.repCon}</div>

							<div class="u_cbox_info_base">
								<span class="date"><fmt:formatDate
										value="${reply.repDate}" pattern="yyyy-MM-dd" /></span>
							</div>

							<div class='u_cbox_tool'>

								<c:if test="${users eq reply.userId }">
									<button type='button' class='modify'
										data-repNum="${reply.repNum }">수정</button>
									<button type="button" id='delete' name='delete' class='delete'
										data-repNum="${reply.repNum }">삭제</button>
								</c:if>
							</div>

						</div>
					</div>
				</li>
			</c:forEach>
		</ul>
	</div>
		<!--replyList end -->

		<div class="replyModal" style="display: none;">
			<div>
				<textarea class="modal_repCon" name="modal_repCon"></textarea>
			</div>
			<div>

				<button type="button" class="modal_modify_btn">수정</button>

				<button type="button" class="modal_cancel">취소</button>
			</div>
		</div>
	</div>
</div>


<script>
	$(document).on(
			"click",
			".modify",
			function() {
				$(".replyModal").attr("style", "display:block;");
				$(".replyModal").fadeIn(200);

				var repNum = $(this).attr("data-repNum");
				var repCon = $(this).parent().parent()
						.children(".replyContent").text();

				$(".modal_repCon").val(repCon);
				$(".modal_modify_btn").attr("data-repNum", repNum);

			});
</script>

<script>
	$(".modal_modify_btn").click(function() {

		var modifyConfirm = confirm("정말로 수정하시겠습니까?");
		var num = $("#num").val();
		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";
		if (modifyConfirm) {
			var data = {
				repNum : $(this).attr("data-repNum"),
				repCon : $(".modal_repCon").val()
			};

			$.ajax({
				url : "/review/get/modifyReply",
				type : "POST",
				data : data,
				beforeSend : function(xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)
				},
				success : function(result) {
					location.reload(true);

				},
				error : function() {
					alert("로그인 안하시고 어떡해...너는..대체누구냐..")
				}
			});
		}

	});
</script>

<script>
	$("#reply_btn").click(function() {
		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";
		var formObj = $(".replyForm form[role='form']");
		var num = $("#num").val();
		var repCon = $("#repCon").val()
		var type = $(this).data("type");

		var data = {
			num : num,
			repCon : repCon
		}

		$.ajax({
			url : "/review/get/registReply",
			data : data,
			beforeSend : function(xhr) {
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)},
			type : "POST",
			success : function() {
				
				$("#repCon").val("");
				url = "/review/get?num=" + num;
				location.href = url;
			},error : function() {
				alert("내용을 적어주세요");
			}
		});
	});
</script>


<script>
	$(document).on("click", ".delete", function() {
		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";
		var data = {
			repNum : $(this).attr("data-repNum")
		};

		$.ajax({
			url : "/review/get/deleteReply",
			type : "POST",
			data : data,
			beforeSend : function(xhr) {
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)
			},
			success : function() {
				location.reload(true);
			}
		});
	});
</script>

<script>
	$(document).ready(function() {
		var operForm = $("#operForm");

		$("button[data-oper='modify']").on("click", function(e) {
			operForm.attr("action", "/review/modify").submit();
		});

		$("button[data-oper='list']").on("click", function(e) {
			operForm.find("#num").remove();
			operForm.attr("action", "/review/list");
			operForm.submit();
		});
	});
</script>



<%@ include file="../includes/footer2.jsp"%>
