<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../includes/header.jsp"%>


<style>
.orderList {
	margin-top: 0;
	margin-bottom: 1rem;
}

.orderList {
	display: block;
	list-style-type: disc;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	padding-inline-start: 40px;
}

.table-responsive {
	font-size: 14px;
	font-family: '맑은 고딕', 'Malgun Gothic', 'Dotum', '돋움', 'arial', 'verdana',
		sans-serif;
	color: #2e3039;
	word-spacing: -1px;
	margin: 0 0 30px;
	padding: 30px 20px;
	border-radius: 2px;
	border: 1px solid #ddd;
	background: #fff;
	box-shadow: 0px 2px 1px 0px rgba(205, 211, 222, 1);
}

.table-responsive {
	display: block;
	width: 100%;
	overflow-x: auto;
	font-weight: 900;
}

.table-responsive p {
	margin-top: 0;
	margin-bottom: 1rem;
	
}

.sub_top_ban {
	width: 100%;
	clear: both;
	height: 250px;
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


.inputArea {
    margin: 10px 0;
}

.inputArea span {
    display: inline-block;
    width: 120px;
    margin-right: 10px;
}

.table-responsive p, .infoWrite th {
    padding: 20px 0 20px;
}
.table-responsive a{
	padding: 50px;
}



</style>



<div class="sub_top_ban"></div>

<section id="content">
	<div class="contai">
		<ul class="orderList">
			<c:forEach items="${orderList}" var="orderList">
				<li>
					<div>
						<div class="table-responsive">
							<p class="inputArea">
								<span>주문번호</span><a
									href="/shop/orderView?n=${orderList.orderId}">${orderList.orderId}</a>
							</p>
							<p class="inputArea">
								<span>수령인</span><a>${orderList.orderRec}</a></p>
							<p class="inputArea">
								<span>주소</span><a>(${orderList.userAddr1}) ${orderList.userAddr2}
								${orderList.userAddr3}</a>
							</p>
							<p class="inputArea">
								<span>가격</span><a>
								<fmt:formatNumber pattern="###,###,###"
									value="${orderList.amount}" />
								원</a>
							</p>
							<p class="inputArea">
								<span>상태</span><a>${orderList.delivery}</a></p>
						</div>
					</div>
				</li>
			</c:forEach>
		</ul>
	</div>
</section>

<%@ include file="../includes/footer2.jsp"%>