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

.contai {
	display: table;
	table-layout: fixed;
	position: relative;
	width: 1000px;
	min-height: 100%;
	margin: 0 auto;
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



</style>

<div class="sub_top_ban"></div>

<div class="Thumb1">
	<h2>
		<span>공지사항</span>
	</h2>
</div>


<div class="section_module-wrap">

	<div class="contai">
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<div class="card-header py-3" align="right">
				<button id="regBtn" class="main-search-btn">글 작성</button>
			</div>
		</sec:authorize>
		<div class="card-body">
			<div class="table-responsive">

				<table class="table table-bordered" id="dataTable" width="100%"
					border="1" cellspacing="0">
					<thead>
						<tr>
							<th width="10%">NO.</th>
							<th width="50%">제목</th>
							<th width="20%">작성일</th>
							<th width="20%">조회수</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach var="notice" items="${list }" varStatus="i">
							<tr>
								<td>${pageMaker.cri.pageNum -1}${i.index}</td>
								<td><a href="${notice.ntnum }" class="move"> <c:out
											value="${notice.nttitle }" />
								</a></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${notice.ntdate }" /></td>
								<td>${notice.viewct }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<div>
					<ul class="pagination justify-content-center">
						<c:if test="${pageMaker.prev }">
							<li class="page-item previous">
							
							<a
								href="${pageMaker.startPage-1 }" class="page-link">&#60;&#60;</a></li>
						</c:if>
						<c:forEach var="num" begin="${pageMaker.startPage }"
							end="${pageMaker.endPage }">
							<li class='page-item ${pageMaker.cri.pageNum==num?"active":"" }'><a
								href="${num }" class="page-link"> ${num }</a></li>
						</c:forEach>
						<c:if test="${pageMaker.next }">
							<li class="page-item next"><a href="${pageMaker.endPage+1 }"
								class="page-link">&#62;&#62;</a></li>
						</c:if>
					</ul>
				</div>

				<form id="pag" action="/notice/list" method="get">
					<input type="hidden" name="pageNum"
						value="${pageMaker.cri.pageNum }"> <input type="hidden"
						name="amount" value="${pageMaker.cri.amount }">
				</form>


				<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						var result = '<c:out value="${result}"/>';
						console.log("history.state : " + history.state);
						console.log("result : " + result);
						checkModal(result);
						history.replaceState({}, null, null);
						// 스택구조에 누적된 히스토리 객체를 지워라
						// 3개의 인자는 state객체, 제목, url
						function checkModal(result) {
							if (result === '' || history.state != null) {/* 결과가 없거나
																	히스토리가 있다면 */
								// 값과 타입도 검사. 형태도 맞고 값도 맞는다면
								// 넘겨 받은 값이 있다면,
								// 스택구조로 쌓인 정보가 있다면
								return;
							}
							if (parseInt(result) > 0) {
								alert("게시글이 등록되었습니다.");
								// 모달 바디에 주어진 문장으로 대체
							}
							$("#myModal").modal("show");// 모달 표시.
						}
						$("#regBtn").on("click", function() {
							self.location = "/notice/register";
							/* 아이디 regBtn 을 클릭한다면
							 현재창의 위치를 쓰기로 변경 */
						});

						var actionForm = $("#pag");
						$(".page-item a").on(
								"click",
								function(e) {
									e.preventDefault();
									console.log("이동");
									actionForm.find("input[name='pageNum']")
											.val($(this).attr("href"));
									actionForm.submit();
								});
						$(".move")
								.on(
										"click",
										function(e) {
											e.preventDefault();
											actionForm
													.append("<input type='hidden' name='ntnum' "
															+ "value='"
															+ $(this).attr(
																	"href")
															+ "'>");
											actionForm.attr("action",
													"/notice/get");
											actionForm.submit();
										});

					});
</script>

<%@ include file="../includes/footer2.jsp"%>
