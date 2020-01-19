<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><!-- jstl core 쓸때 태그에 c 로 표시. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>장바구니 확인</h2>
<c:choose>
<c:when test="${map.cont==0 }">
장바구니가 비어있습니다
</c:when>
<c:otherwise>
<form action="/productlist/update">
<table border="1">
<tr>
<th>상품명</th>
<th>단가</th>
<th>수량</th>
<th>금액</th>
<th>취소</th>
</tr>
<c:forEach var="row" items="${map.list }" varStatus="i">
<tr>
<td>
${row.productName }
</td>
<td style="width: 80px" align="right">
<fmt:formatNumber pattern="###,###,###" value="row.productPrice"/>
<td>


<td>
<input type="number" style="width: 40px" name="amount" value="amount">
<input type="hidden" name="productId" value="${row.productId }">
</td>


<td style="width: 100px" align="right">
<fmt:formatNumber pattern="###,###,###" value="${row.money }"/>

</td>

<td>
<a href="/productlist/delete?cartId=${row.cartId }">삭제</a>
</td>


</tr>
</c:forEach>

<td colspan="5" align="right">
장바구니 금액 합계 : <fmt:formatNumber pattern="###,###,###" value="${map.sumMoney }"/><br>
배송료 : ${map.fee }<br>
전체 주문금액 : <fmt:formatNumber pattern="###,###,###" value="${map.allSum }"/>
</td>


</table>

</form>

</c:otherwise>


</c:choose>
<button type="button" id="btnList">상품목록</button>


</body>
</html>