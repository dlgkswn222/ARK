<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><!-- jstl core 쓸때 태그에 c 로 표시. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jstl fmt 쓸때 위와 같음.
fmt : formatter 형식 맞춰서 표시 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://unpkg.com/purecss@1.0.1/build/pure-min.css" 
integrity="sha384-oAOxQR6DkCoMliIh8yFnu25d7Eq/PHS21PClpwjOTeU2jRSq11vu66rf90/cZr47" 
crossorigin="anonymous">

		

	<!-- Main -->
	

<div id="page">
<%@ include file="../includes/aside.jsp" %>

	<article id="article">
	
	<div id="contentWrapper">
   <div id="contentWrap">
      <div id="content">
         <div id="productClass">
            <div class="prd-list">
            
            <c:set var="i" value="1" /> 
            <c:set var="j" value="4" />
					<table class="pro-table" summary="상품이미지, 상품 설명, 가격">
						<caption class="pro-caption">전체 품종 목록</caption>
						<colgroup>
							<col width="20%">
							<col width="20%">
							<col width="20%">
							<col width="20%">
						</colgroup>
						<tbody>
							<c:forEach var="pro" items="${productList }" >
								<c:if test="${i%j==1 }">
									<tr>
								</c:if>
									<td>
										<div class="tb-center">
											<ul class="info">
												<li><div class="thumb">
														<a href="/product/productView?pronum=${pro.pronum }"> <img
															src="${pro.procontent }" class=""
															width="200px" height="200px" alt="이미지 준비"></a>
													</div></li>
												<li class="dsc"><span class="MK-product-icons"></span><a
													href="/product/productView?pronum=${pro.pronum }">${pro.proname }</a></li>
												<li class="price"><span>
													<fmt:formatNumber value="${pro.proprice }" pattern="###,###,###" /></span>
												</li>
											</ul>
										</div>
									</td>
								<c:if test="${i%j==0}">
									</tr>
								</c:if>
								  <c:set var="i" value="${i+1 }" /> 
						</c:forEach>
					</tbody>
					</table>
				</div>
         </div>
      </div>
   </div>
</div>

	</article>

</div>
	<!-- /Main -->
	
	

<script>

</script>
