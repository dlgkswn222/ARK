<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp"%>


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

.Thumb1 {
	margin: 0 0 17px;
}

.Thumb1 h2 {
	width: 1000px;
	height: 20px;
	margin: 0 30px 0 450px;
	padding: 10px 0 35px 0;
	font-weight: bold;
	font-size: 30px;
	font-family: "맑은고딕", "Malgun Gothic", Arial, "돋움", Dotum, sans-serif;
	color: #9f9f9f;
	text-align: center;
	font-weight: 900;
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

.section_module-wrap {
	background: #fff;
	margin-bottom: 0;
	border-radius: 6px;
}

.contai1 {
	display: table;
	table-layout: fixed;
	position: relative;
	width: 1200px;
	min-height: 100%;
	margin: 0 auto;
}
</style>

<div class="sub_top_ban"></div>

<div class="Thumb1">
	<h2>
		<span>커뮤니티</span>
	</h2>
</div>

<div class="section_module-wrap">
	<div class="contai1">
		<div class="card-header py-3" align="right">
			<button id="regBtn" class="main-search-btn">글 작성</button>
		</div>
		<table class="table table-bordered" id="dataTable" width="100%"
			border="1" cellspacing="0">
			<thead>
				<tr style="text-align: center; border: 1px solid #444444;">
					<th width="10%">NO.</th>
					<th width="20%">상품정보</th>
					<th width="40%">제목</th>
					<th width="10%">작성자</th>
					<th width="10%">작성일</th>
					<th width="10%">조회</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach var="review" items="${list }" varStatus="i">
					<tr style="text-align: center; border: 1px solid #444444;">
						<td><c:out value="${pageMaker.cri.pageNum -1}${i.index}" /></td>
						<td><img style="width: 50px; height: 30px;"
							src="/resources/images/upload${review.gdsthumbimg}"></td>
						<td><a href="${review.num }" class="move"> <c:out
									value="${review.title}" /></a></td>
						<td><c:out value="${review.writer }" /></td>
						<td><fmt:formatDate pattern="yyyy-MM-dd"
								value="${review.ttdate }" /></td>
						<td>${review.count }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<div>
			<ul class="pagination justify-content-center">
				<c:if test="${pageMaker.prev }">
					<li class="page-item previous"><a
						href="${pageMaker.startPage-1 }" class="page-link">&#60;&#60;</a></li>
				</c:if>
				<c:forEach var="num" begin="${pageMaker.startPage }"
					end="${pageMaker.endPage }">
					<li class='page-item
${pageMaker.cri.pageNum==num?"active":"" }'>
						<a href="${num }" class="page-link"> ${num }</a>
					</li>
				</c:forEach>
				<c:if test="${pageMaker.next }">
					<li class="page-item next"><a href="${pageMaker.endPage+1 }"
						class="page-link">&#62;&#62;</a></li>
				</c:if>
			</ul>
		</div>
	</div>
</div>
<form id="pag" action="/review/list" method="get">
	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
	<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
</form>



<script>
	$("#regBtn").on("click", function() {
		self.location = "/review/register"
	});

	var actionForm = $("#pag");
	$(".page-item a").on("click", function(e) {
		e.preventDefault();
		console.log("click");
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});

	$(".move").on(
			"click",
			function(e) {
				e.preventDefault();
				actionForm.append("<input type='hidden' name='num' "
						+ "value='" + $(this).attr("href") + "'>");
				actionForm.attr("action", "/review/get");
				actionForm.submit();
			});
</script>

<%@ include file="../includes/footer2.jsp"%>