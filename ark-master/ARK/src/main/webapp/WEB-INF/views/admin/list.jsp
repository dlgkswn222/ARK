<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><!-- jstl core 쓸때 태그에 c 로 표시. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../includes/adminHeader.jsp" %>

	

<!-- DataTables Example -->
        <div class="card mb-3">
          <div class="card-body">
            <div class="table-responsive">
             <table class="table table-bordered" id="dataTable" width="100%"
				cellspacing="0">
				<thead>
					<tr>
						<th>#번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>수정일</th>
						<!-- <th>Salary</th> -->
					</tr>
				</thead>
				<!-- <tfoot>
					<tr>
						<th>Name</th>
						<th>Position</th>
						<th>Office</th>
						<th>Age</th>
						<th>Start date</th>
						<th>Salary</th>
					</tr>
				</tfoot> -->
				<tbody>
					<c:forEach var="board" items="${list }">
						<tr>
							<td><c:out value="${board.bno }" /></td>
							<td><a href="${board.bno }" class="move"> 
							<c:out value="${board.title }" />
										<c:if test="${board.replyCnt ne 0 }">
										<span style="color: red;">[<c:out value="${board.replyCnt }"/>]</span>
							</c:if></a></td>
							<td><c:out value="${board.writer }" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${board.regdate }" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${board.updateDate }" /></td>
							<!-- <td>$320,800</td> -->
						</tr>
					</c:forEach>
					
					
				</tbody>
			</table>
              
              
            
            
			<div>
				<div class="col-lg-12">
					<form id="searchForm" action="/admin/list" method="get">
						&nbsp;&nbsp;&nbsp;<select name="type">
							<option value="" ${pageMaker.cri.type==null?"selected":"" }>
								--</option>
							<option value="T" ${pageMaker.cri.type eq "T"?"selected":"" }>
								제목</option>
							<option value="C" ${pageMaker.cri.type eq "C"?"selected":"" }>
								내용</option>
							<option value="W" ${pageMaker.cri.type eq "W"?"selected":"" }>
								작성자</option>
							<option value="TC" ${pageMaker.cri.type eq "TC"?"selected":"" }>
								제목+내용</option>
							<option value="TW" ${pageMaker.cri.type eq "TW"?"selected":"" }>
								제목+작성자</option>
							<option value="WC" ${pageMaker.cri.type eq "WC"?"selected":"" }>
								내용+작성자</option>
							<option value="TWC" ${pageMaker.cri.type eq "TWC"?"selected":"" }>
								제목+내용+작성자</option>
						</select> <input type="text" name="keyword" /> <input type="hidden"
							name="pageNum" value="${pageMaker.cri.pageNum }"> <input
							type="hidden" name="amount" value="${pageMaker.cri.amount }">
						<button class="btn btn-warning">Search</button>
					</form>
				</div>
			</div>


			<div>
				<ul class="pagination justify-content-center">
					<c:if test="${pageMaker.prev }">
						<li class="page-item previous"><a
							href="${pageMaker.startPage-1 }" class="page-link">prev</a></li>
					</c:if>

					<c:forEach var="num" begin="${pageMaker.startPage }"
						end="${pageMaker.endPage }">
						<li class='page-item ${pageMaker.cri.pageNum==num?"active":"" }'>
							<a href="${num }" class="page-link"> ${num }</a>
						</li>
					</c:forEach>

					<c:if test="${pageMaker.next }">
						<li class="page-item next"><a href="${pageMaker.endPage+1 }"
							class="page-link">next</a></li>
					</c:if>

				</ul>
			</div>


			<form id="actionForm" action="/admin/list" method="get">
				<input type="hidden" name="pageNum"
					value="${pageMaker.cri.pageNum }"> <input type="hidden"
					name="amount" value="${pageMaker.cri.amount }">
					<input type="hidden" name="type" 
					value="${pageMaker.cri.type }">
					<input type="hidden" name="keyword" 
					value="${pageMaker.cri.keyword }">
			</form>




			<!-- Modal 추가 -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
						</div>
						<div class="modal-body" align="center">처리 완료.</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary"
								data-dismiss="modal">close</button>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>
  						</div>
 			 	  </div>
        	</div>
      </div>
      <!-- /.container-fluid -->
             <!-- Sticky Footer -->
      <footer class="sticky-footer">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright © Your Website 2019</span>
          </div>
        </div>
      </footer>


    </div>
    <!-- /.content-wrapper -->

  </div>
  <!-- /#wrapper -->

<script type="text/javascript">
	$(document).ready(
			function() {
				var result = '<c:out value="${result}"/>';
				/* console.log("history.length : " + history.length);
				console.log("history.current : " + history.current);
				console.log("history.state : " + history.state);
				console.log("result : " + result); */
				checkModal(result);
				history.replaceState({}, null, null);
				// 스택구조에 누적된 히스토리 객체를 지워라
				// 3개의 인자는 state객체, 제목, url
				function checkModal(result) {
					if (result === '' || history.state != null) { /* 결과가 없거나 히스토리가 있다면 */
						// 값과 타입도 검사. 형태도 맞고 값도 맞는다면
						// 넘겨 받은 값이 있다면,
						// 스택구조로 쌓인 정보가 있다면
						/* if (result === '') { */
						return;
					}
					if (parseInt(result) > 0) {
						$(".modal-body").html(
								"게시글 " + parseInt(result) + "번이 등록");
						// 모달 바디에 주어진 문장으로 대체
					}
					$("#myModal").modal("show");// 모달 표시.
				}

				$("#regBtn").on("click", function() {
					self.location = "/admin/register";
					/* 아이디 regBtn 을 클릭한다면 
					현재창의 위치를 쓰기로 변경 */
				});

				var actionForm = $("#actionForm");
				// 클래스 page-item 에 a 링크가 클릭 된다면,
				$(".page-item a").on(
						"click",
						function(e) {
							e.preventDefault();
							// 기본 이벤트 동작을 막고,
							console.log("click");
							// 웹 브라우저 검사 창에 클릭을 표시
							actionForm.find("input[name='pageNum']").val(
									$(this).attr("href"));
							// 액션폼 인풋태그에 페이지넘 값을 찾아서,
							// href로 받은 값으로 대체함.
							actionForm.submit();
						});

				$(".move").on(
						"click",
						function(e) {
							e.preventDefault();
							actionForm
									.append("<input type='hidden' name='bno' "
											+ "value='" + $(this).attr("href")
											+ "'>");
							actionForm.attr("action", "/admin/get");
							actionForm.submit();
						});

				var searchForm = $("#searchForm");
				$("#searchForm button").on("click", function(e) {
					if(!searchForm.find("option:selected").val()){
						alert("검색 종류를 선택하세요.");
						return false;
					}
					if(!searchForm.find("input[name='keyword']").val()){
						alert("키워드를 입력하세요.");
						return false;
					}
					
					searchForm.find("input[name='pageNum']").val(1);
					e.preventDefault();
					searchForm.submit();
				
				});

			});// end
</script>

<script>
$(document).ready(function() {
		$('#dataTable').DataTable({
			"order" : [ [ 0, "desc" ] ], //정렬 0컬럼의 내림차순으로
			"paging" : false, // 페이징 표시 안함.
			"bFilter" : false, // 검색창 표시 안함.
			"info" : false
		// 안내창 표시 안함.
		});
	});
</script>

<%@ include file="../includes/adminFooter.jsp" %>


            