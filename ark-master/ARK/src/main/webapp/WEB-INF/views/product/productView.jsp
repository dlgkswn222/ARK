<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><!-- jstl core 쓸때 태그에 c 로 표시. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jstl fmt 쓸때 위와 같음.
fmt : formatter 형식 맞춰서 표시 -->
<style>

</style>

<%@ include file="../includes/header.jsp"%>

<div id="page">
	<%@ include file="../includes/aside.jsp"%>
	
	<article id="article">
			<form class="pro-register-form" role="form" method="post" autocomplete="off">
		
			<input type="hidden" name="pronum" value="${product.pronum }">
			
			<input type="hidden" name="id" name="id" value="<sec:authentication property="principal.username"/>" >
			
			<div class="inputArea">
			 <label>1차 분류</label>
			 <span class="category1"></span>        
 			 <label>2차 분류</label>
 			 <span class="category2">${product.catename}</span>
			</div>

			<div class="inputArea">
				<label for="proname">상품명</label><span>${product.proname}</span>
			</div>

			<div class="inputArea">
				<label for="proprice">상품가격</label><span><span><fmt:formatNumber value="${product.proprice}" pattern="###,###,###"/></span></span>
			</div>

			<div class="inputArea">
				<label for="prostrock">상품수량</label><span>${product.prostock}</span>
			</div>

			<div class="inputArea">
				<label for="proinfo">상품소개</label>
				<span>${product.proinfo}</span>
			</div>

			<div class="inputArea">
				<button type="button" id="modify_Btn" class="btn btn-warning">수정</button>
				<button type="button" id="delete_Btn" class="btn btn-danger">삭제</button>
				<button type="button" id="back-Btn" class="btn btn-info">목록</button>
			</div>
			
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
			<input id="jang" name="jang" type="submit" value="장바구니">
		</form>
			
	</article>
</div>
<%@ include file="../includes/footer.jsp"%>


<script type="text/javascript">
var formObj = $("form[role='form']");

	$("#modify_Btn").click(function() {
		var con = confirm("상품 수정 페이지로 이동하겠습니까?")
		
		if(con){
		formObj.attr("action", "/board/productModify");
		formObj.attr("method", "get")
		formObj.submit();
		}
	});

	$("#delete_Btn").click(function() {
		
		var con = confirm("해당 상품을 삭제 하시겠습니까?")
		
		if(con) {	
		formObj.attr("action", "/board/productDelete");
		formObj.submit();
		}
	});
	
	$("#back_Btn").click(function(){
	  self.location="/board/productList";
	}); 
	
	$("#jang").click(function(){
		
		formObj.attr("action","insert.do");
		formObj.attr("method","post");
		formObj.submit();
	});
</script>
