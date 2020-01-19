<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../includes/header.jsp"%>


<style>
.cart_header {
	padding: 20px 0 20px;
	border-bottom: 1px solid #eee;
}

.inner_cont {
	width: 1200px;
	margin: 0 auto;
}

.cart_header .title {
	font-size: 38px;
	line-height: 56px;
	color: #363636;
	font-weight: bold;
	letter-spacing: -1px;
	padding-left: 14px;
}

.inputArea {
	margin: 10px 0;
}

.inputArea span {
	display: inline-block;
	width: 120px;
	margin-right: 10px;
}

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

.orderInfo {
	border: 5px solid #eee;
	padding: 10px 20px;
	margin: 20px 0;
	outline-style: auto;
}

.contai {
	display: table;
	table-layout: fixed;
	position: relative;
	width: 1000px;
	min-height: 100%;
	margin: 0 auto;
}

.orderView li {
	margin-bottom: 40px;
	padding-bottom: 40px;
	border-bottom: 1px solid #999;
}

.thumb img {
	width: 200px;
	height: 200px;
}

.gdsInfo {
	float: right;
	width: calc(100% - 220px);
	line-height: 2;
	outline-style: auto;
}

.gdsInfo span {
	font-size: 20px;
	font-weight: bold;
	display: inline-block;
	width: 100px;
	margin-right: 10px;
}
</style>

<div class="sub_top_ban"></div>

<section id="content">
	<div class="cart_header">
		<div class="inner_cont">
			<h3 class="title">주문/배송상세정보</h3>
		</div>
	</div>
	<div class="contai">
		<div class="orderInfo">
			<c:forEach items="${orderView}" var="orderView" varStatus="status">

				<c:if test="${status.first}">
					<p class="inputArea">
						<span>수령인</span>${orderView.orderRec}</p>
					<p class="inputArea">
						<span>주소</span>(${orderView.userAddr1}) ${orderView.userAddr2}
						${orderView.userAddr3}
					</p>
					<p class="inputArea">
						<span>가격</span>
						<fmt:formatNumber pattern="###,###,###"
							value="${orderView.amount}" />
						원
					</p>
				</c:if>

			</c:forEach>
		</div>

		<ul class="orderView">
			<c:forEach items="${orderView}" var="orderView">
				<li>
					<div class="thumb">
						<img src="/resources/images/upload${orderView.gdsThumbImg}" />

						<div class="gdsInfo">
							<p>
								<span>상품명</span>${orderView.gdsName}<br /> <span>개당 가격</span>
								<fmt:formatNumber pattern="###,###,###"
									value="${orderView.gdsPrice}" />
								원<br /> <span>구입 수량</span>${orderView.cartStock} 개<br /> <span>최종
									가격</span>
								<fmt:formatNumber pattern="###,###,###"
									value="${orderView.gdsPrice * orderView.cartStock}" />
								원
							</p>
						</div>
					</div>
				</li>
			</c:forEach>
		</ul>
	</div>
</section>

<%@ include file="../includes/footer2.jsp"%>