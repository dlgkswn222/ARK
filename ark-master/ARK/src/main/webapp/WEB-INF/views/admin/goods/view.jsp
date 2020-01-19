<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ include file="../../includes/adminHeader.jsp"%>

<style>
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

.xans-board-product {
	
	margin: 0 0 20px;
	outline-style: auto;
}

.xans-board-product .prdThumb img {
	width: 90px;
	height: 130px;
	border: 1px solid #d5d5d5;
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

.boardView table td {
	border-bottom: 1px solid #e8e8e8;
}

.contai6 {
	display: table;
	table-layout: fixed;
	position: relative;
	width: 1000px;
	min-height: 100%;
	margin: 0 auto;
}
</style>

<div class="boardView">
	<div class="contai6">
		
			<img
				src="/resources/images/upload${goods.gdsThumbImg}" class="thumbImg"
				style="width: 200px; height: 150px; outline-style: auto; "/>

		
		<form role="form" method="post" autocomplete="off">
			<input type="hidden" name="gdsNum" value="${goods.gdsNum}" />


			<table>
				<tbody>
					<tr>
						<th scope="row">1차 분류</th>
						<td><span class="category1">${goods.cateName }</span></td>
					</tr>
					<tr>
						<th scope="row">2차 분류</th>
						<td><span class="category2">${goods.cateCode}</span></td>
					<tr>
						<th scope="row">상품명</th>
						<td><span>${goods.gdsName}</span></td>
					</tr>

					<tr>
						<th scope="row">상품가격</th>
						<td><fmt:formatNumber value="${goods.gdsPrice}"
								pattern="###,###,###" /></td>
					</tr>

					<tr>
						<th scope="row">상품수량</th>
						<td>${goods.gdsStock}</td>
					<tr>
						<th scope="row">상품소개</th>
						<td>${goods.gdsDes}</td>
					</tr>
				</tbody>
			</table>


			<div class="inputArea">
				<button type="button" id="modify_Btn" class="main-search-btn">수정</button>
				<button type="button" id="delete_Btn" class="main-search-btn">삭제</button>
			</div>


			<input type="hidden" name="${_csrf.parameterName }"
				value="${_csrf.token }" />

		</form>
	</div>
</div>

<script>
	var formObj = $("form[role='form']");

	$("#modify_Btn").click(function() {
		formObj.attr("action", "/admin/goods/modify");
		formObj.attr("method", "get")
		formObj.submit();
	});

	$("#delete_Btn").click(function() {
		formObj.attr("action", "/admin/goods/delete");
		formObj.submit();
	});

	$("#delete_Btn").click(function() {

		var con = confirm("정말로 삭제하시겠습니까?");

		if (con) {
			formObj.attr("action", "/admin/goods/delete");
			formObj.submit();
		}
	});
</script>

<%@ include file="../../includes/adminFooter.jsp"%>
<%-- <img src = "/display?name= ${goods.gdsThumbImg}" />
  <img src = "/display?name= ${goods.gdsImg}" /> --%>