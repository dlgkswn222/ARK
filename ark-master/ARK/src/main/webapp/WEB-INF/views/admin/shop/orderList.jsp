<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../includes/adminHeader.jsp" %>




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




<section id="content">
 
 <ul class="orderList">

 <c:forEach items="${orderList}" var="orderList">
 <c:if test="${orderList.delivery ne '배송 완료'}">
 <li>
 <div>
 <div class="table-responsive">
  <p><span>주문번호:</span><a href="/admin/shop/orderView?n=${orderList.orderId}">${orderList.orderId}</a></p>
  <p><span>주문자:</span>${orderList.userId}</p>
  <p><span>수령인:</span>${orderList.orderRec}</p>
  <p><span>주소:</span>(${orderList.userAddr1}) ${orderList.userAddr2} ${orderList.userAddr3}</p>
  <p><span>가격:</span><fmt:formatNumber pattern="###,###,###" value="${orderList.amount}" /> 원</p> 
  <p><span>상태:</span>${orderList.delivery}</p>
 </div>
 </div>
 
 </li>
 </c:if>
 </c:forEach>
 
</ul>

	<form id="searchForm" action="/admin/shop/orderList" method="get">
				
						&nbsp;&nbsp;&nbsp;<select name="type">
							<option value="" ${pageMaker.cri.type==null?"selected":"" }>
								--</option>
							<option value="T" ${pageMaker.cri.type eq "T"?"selected":"" }>
								주문번호</option>
							<option value="C" ${pageMaker.cri.type eq "C"?"selected":"" }>
								주문자</option>
							<option value="W" ${pageMaker.cri.type eq "W"?"selected":"" }>
								수령인</option>
						</select> <input type="text" name="keyword" /> <input type="hidden"
							name="pageNum" value="${pageMaker.cri.pageNum }"> <input
							type="hidden" name="amount" value="${pageMaker.cri.amount }">
						
						<button class="btn btn-warning">Search</button>
					</form>
					
			




		
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
		



<form id="actionForm" action="/admin/shop/orderList"" method="get">
				
				<input type="hidden" name="c" value="${cateCode}">
				<input type="hidden" name="l" value="${level}">
				<input type="hidden" name="pageNum"
					value="${pageMaker.cri.pageNum }"> <input type="hidden"
					name="amount" value="${pageMaker.cri.amount }">
					
					
					<input type="hidden" name="type" 
					value="${pageMaker.cri.type }">
					<input type="hidden" name="keyword" 
					value="${pageMaker.cri.keyword }">
			</form>
<script> /* 페이징 */

$(document).ready(function() {
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
});
</script>

</section>

<%@ include file="../../includes/adminFooter.jsp" %>