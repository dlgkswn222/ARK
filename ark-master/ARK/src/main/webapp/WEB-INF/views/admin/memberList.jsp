<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><!-- jstl core 쓸때 태그에 c 로 표시. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../includes/adminHeader.jsp" %>

	

<style>
.table-responsive{
font-size: 14px;
font-family: '맑은 고딕', 'Malgun Gothic', 'Dotum', '돋움', 'arial', 'verdana', sans-serif;
color: #2e3039;
word-spacing: -1px;
margin: 0 0 30px;
padding: 30px 20px;
border-radius: 2px;
border: 1px solid #ddd;
background: #fff;
box-shadow: 0px 2px 1px 0px rgba(205,211,222,1);
}

.a{
font-family: '맑은 고딕', 'Malgun Gothic', 'Dotum', '돋움', 'arial', 'verdana', sans-serif;
color: #2e3039;
word-spacing: -1px;
border-spacing: 0;
border-collapse: collapse;
text-align: center;
margin: 0;
word-wrap: break-word;
vertical-align: top;
border: 1px solid #dedede;
border-top-width: 0;
height: 31px;
font-size: 13px;
line-height: 26px;
padding: 5px 4px 4px;
border-right-width: 0;
}
.b{
font-size: 14px;
font-family: '맑은 고딕', 'Malgun Gothic', 'Dotum', '돋움', 'arial', 'verdana', sans-serif;
color: #2e3039;
word-spacing: -1px;
border-spacing: 0;
border-collapse: collapse;
line-height: 1.5;
text-align: center;
}
</style>


<!-- DataTables Example -->
        <div class="card mb-3">
          <div class="card-body">
            <div class="table-responsive">
             <table class="table table-bordered" id="dataTable" width="100%"
				cellspacing="0">
				<thead class="a">
					<tr>
						<th>#회원번호</th>
						<th>ID</th>
						<th> 이름 </th>
						<th>전화번호</th>
						<th>이메일</th>
						<th>가입날짜</th>
						<th>회원등급</th>
						<th>우편번호</th>
						<th>도로명주소</th>
						<th>지번</th>
						
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
				<tbody class="">
					<c:forEach var="mem" items="${mem }">
						<tr>
							<td><c:out value="${mem.mb }" /></td>
				<td><a href="/admin/memberAuth?id=${mem.id}"><c:out value="${mem.id }" /></a></td>
							<td><c:out value="${mem.name }" /></td>
							<td><c:out value="${mem.phonenum }" /></td>
							<td><c:out value="${mem.useremail }" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${mem.userday }" /></td>
							<td><c:out value="${mem.authList[0].auth}" /></td>
							<td><c:out value="${mem.uoop }" /></td>
							<td><c:out value="${mem.doro }" /></td>
							<td><c:out value="${mem.jibun }" /></td>
							
						</tr>
					</c:forEach>
					
					
				</tbody>
			</table>
		</div>
	</div>
</div>
<!--검색 기능 -->
<div>
				<div class="col-lg-12">
					<form id="searchForm" action="/admin/memberList" method="get">
						&nbsp;&nbsp;&nbsp;<select name="type">
							<option value="" ${pageMaker.cri.type==null?"selected":"" }>
								--</option>
							<option value="T" ${pageMaker.cri.type eq "T"?"selected":"" }>
								ID</option>
							<option value="C" ${pageMaker.cri.type eq "C"?"selected":"" }>
								이메일</option>
							<option value="W" ${pageMaker.cri.type eq "W"?"selected":"" }>
								이름</option>
							<option value="TC" ${pageMaker.cri.type eq "TC"?"selected":"" }>
								ID+이메일</option>
							<option value="TW" ${pageMaker.cri.type eq "TW"?"selected":"" }>
								ID+이름</option>
							<option value="WC" ${pageMaker.cri.type eq "WC"?"selected":"" }>
								이메일+이름</option>
							<option value="TWC" ${pageMaker.cri.type eq "TWC"?"selected":"" }>
								ID+이메일+이름</option>
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


			<form id="actionForm" action="/admin/memberList" method="get">
				<input type="hidden" name="pageNum"
					value="${pageMaker.cri.pageNum }"> <input type="hidden"
					name="amount" value="${pageMaker.cri.amount }">
					<input type="hidden" name="type" 
					value="${pageMaker.cri.type }">
					<input type="hidden" name="keyword" 
					value="${pageMaker.cri.keyword }">
			</form>
			
			
			<script>
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
			</script>
			
<!-- 검색 기능 +페이징 엔드 -->			
			
			
			
			
			
			


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



<%@ include file="../includes/adminFooter.jsp" %>


            