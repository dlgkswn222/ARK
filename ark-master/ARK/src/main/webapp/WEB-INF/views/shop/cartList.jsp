<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../includes/header.jsp"%>

<style>
.container {
	width: 100%;
}

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

.cart_option {
	display: block;
	width: 100%;
	overflow: hidden;
	height: auto;
	background: #f3f3f3;
}

.cart_option {
	display: block;
	width: 100%;
	overflow: hidden;
	height: auto;
	background: #f3f3f3;
}

.cart_option_area {
	display: block;
	width: 824px;
	height: 60px;
}

.cart_option_box {
	width: auto;
	overflow: auto;
	height: auto;
	padding: 20px 0 20px 8px;
}

.select_all {
	height: 20px;
	line-height: 20px;
	margin-top: -1px;
}

.input_custom input[type="checkbox"] {
	position: absolute;
	left: 0%;
	z-index: 1;
	height: 15px;
	margin-top: 6px;
	width: 39%;
	font-size: large;
	font-weight: 900;
}

.input_custom label {
	white-space: nowrap;
	overflow: visible;
	padding-left: 25px;
	background-color: #f3f3f3;
	width: auto;
}

.cart_option_box li {
	float: left;
	line-height: 20px;
	margin-right: 14px;
	position: relative;
	margin-left: 14px;
	vertical-align: top;
	background-color: transparent;
}

.cart_option_box button {
	vertical-align: top;
	margin-top: 1px;
	display: inline-block;
	line-height: 20px;
	height: 20px;
}

.cart_option_box button span {
	position: relative;
	top: -1px;
	left: -1px;
}

.cart_list {
	position: static;
	display: inline-block;
	float: left;
	padding-right: 0;
	margin-right: 14px;
}

.cart-basket {
	width: 824px;
	margin-bottom: 16px;
	background: #fff;
	box-shadow: 0 1px 1px rgba(0, 0, 0, 0.18);
	overflow: hidden;
	height: auto;
	border-radius: 2px;
}

.cart_order {
	position: static;
	display: inline-block;
	margin-left: 0;
	top: unset;
	left: unset;
}

.order {
	width: 360px;
	background: #fff;
	border-radius: 2px;
	outline-style: auto;
	margin-top: 15px;
}

.order .order_title .text {
	font-size: 16px;
	color: #1e1e1e;
	letter-spacing: -0.4px;
}

.order .order_title {
	height: 60px;
	line-height: 60px;
	margin: 0 22px;
	border-bottom: 1px solid #333333;
	width: auto;
	position: relative;
}

.order .order_info {
	border-bottom: 1px solid #333333;
	margin: 0 22px;
	padding: 20px 0 0 0;
}

.order .order_info .receipt_list_box {
	overflow: auto;
}

.order .order_info .receipt_list_box .list {
	display: block;
	overflow: hidden;
	margin-bottom: 6px;
	height: 26px;
	position: relative;
}

.order .order_info .receipt_list_box .label {
	font-size: 14px;
	line-height: 20px;
	color: #7F8590;
	float: left;
}

.order .order_info .receipt_list_box .text_value {
	line-height: 20px;
	margin-bottom: 6px;
	color: #444444;
	font-weight: normal;
	font-size: 15px;
	float: right
}

.order .order_summary {
	margin: 0 22px;
	height: auto;
	display: block;
	padding: 20px 0 0 0;
	height: auto;
	margin-bottom: 12px;
	text-align: right;
	min-height: 40px;
}

.text_value {
	font-size: 30px;
	color: #000;
	letter-spacing: -0.7px;
	font-weight: bold;
	line-height: 41px;
}

.order .order_action {
	margin: 0 22px;
	padding: 22px 0;
}

.order .order_action .btn_submit {
	height: 64px;
	line-height: 64px;
	display: block;
	background: #2E8DE5;
	width: 100%;
	text-align: center;
	vertical-align: middle;
	border-radius: 2px;
}

.order .order_action .btn_submit .text {
	color: #fff;
	font-size: 22px;
	font-weight: bold;
	vertical-align: middle;
}

.basket_list_group {
	overflow: auto;
	height: auto;
	outline-style: auto;
	margin-top: 15px;
}

.cart-basket_header {
	position: relative;
	height: 60px;
	line-height: 24px;
	margin: 0 22px;
	width: auto;
	padding: 17px 0 19px;
	vertical-align: middle;
	border-bottom: 1px solid #333333;
}

.shop_name {
	font-size: 16px;
	color: #1e1e1e;
	letter-spacing: -0.4px;
	display: inline-block;
	float: left;
	line-height: 24px;
}

.cart-basket .cart-basket_body {
	width: auto;
	overflow: auto;
	height: auto;
	margin-bottom: -1px;
}

.order-list {
	display: block;
	padding: 0 22px;
}

.order-idx {
	border-bottom: 1px solid #dedede;
	overflow: auto;
	height: auto;
	min-height: 100px;
	padding-top: 20px;
	vertical-align: top;
}

.item_check {
	display: inline-block;
	float: left;
	padding-top: 5%;
}

.item_img {
	display: inline-block;
	position: relative;
	float: left;
	margin-left: 12px;
	margin-right: 100px;
	margin-bottom: 12px;
}

#container {
	width: 100%;
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

.cart-basket_footer {
	height: 78px;
	background: #f8f9fa;
	border-top: 1px solid #ddd;
	padding: 15px 54px;
	overflow: hidden;
	margin-top: -1px;
	text-align: end;
}

.order .order_summary .label {
	font-size: 16px;
	line-height: 24px;
	color: #000;
	letter-spacing: -0.5px;
	line-height: 40px;
	font-weight: normal;
	float: left;
}

.bs_btn_cart_02 {
	width: 84px;
	height: 22x;
	line-height: 22px;
}

.bs_btn_white_02 {
	display: inline-block;
	border-radius: 2px;
	border: 1px solid #aaa;
	background-color: #fff;
	color: #666;
	vertical-align: middle;
	transition: all .15s ease-in-out;
}

/* 주소창 */
.orderInfo .infoForm {
	margin: 0 auto;
	width: 850px;
}

.infoWrite {
	padding: 30px;
	border: 3px soid #e4e4e4;
}

.inputArea {
	color: #6b6b6b;
	padding-left: 10px;
	background: #f3f4f8;
	align: left;
	border: 2px solid #dedee0;
	text-align: center;
}

.infoWrite td, .infoWrite th {
	padding: 20px 0 20px;
}

.my_line {
	border: 2px solid #dedee0;
}

.form-cont {
	width: 60%;
	padding: .375rem .75rem;
	font-size: 1rem;
	font-weight: 400;
	line-height: 1.5;
	color: #495057;
	background-color: #fff;
	background-clip: padding-box;
	border: 1px solid #ced4da;
	border-radius: .25rem;
	transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
	box-sizing: border-box;
	height: 36px;
}

.id-btn, .order_btn, .cancel_btn, .orderOpne_bnt {
	width: 180px;
	height: 40px;
	line-height: 40px;
	border: 1px #3399dd solid;
	margin: 15px auto;
	background-color: #f7f7f7;
	text-align: center;
	font-size: 18px;
	cursor: pointer;
	color: #333;
	border-radius: .25rem;
}

.orderOpne_bnt {
	width: 100%;
	margin: 100px 0 0 0;
	padding: 0px;
}

.orderInfo {
	padding: 20px;
	display: none;
}

.orderInfo .inputArea {
	margin: 10px 0;
}

.orderInfo .inputArea label {
	display: inline-block;
	width: 120px;
	margin-right: 10px;
}

.orderInfo .inputArea input {
	font-size: 14px;
	padding: 5px;
}

.orderInfo .inputArea:last-child {
	margin-top: 30px;
}

.orderInfo .inputArea button {
	font-size: 20px;
	border: 2px solid #ccc;
	padding: 5px 10px;
	background: #fff;
	margin-right: 20px;
}

.btnwrap {
	width: 100%;
	text-align: right;
}

.contaii {
	display: table;
	table-layout: fixed;
	position: relative;
	width: 1300px;
	min-height: 100%;
	margin: 0 auto;
}
</style>

<div class="sub_top_ban"></div>

<div id="container">
	<div class="contaii">
		<div class="cart_header">
			<div class="inner_cont">
				<h3 class="title">장바구니</h3>
			</div>
		</div>
		<div class="cart_option">
			<div class="inner_cont">
				<div class="cart_opion_area">
					<ul class="cart_option_box">
						<li class="select_all"><span class="input_custom"> <input
								type="checkbox" name="allCheck" id="allCheck" /><label
								for="allCheck">모두 선택</label>
						</span></li>
						<li>
							<button class="selectDelete_btn">
								<span>선택 삭제</span>
							</button>
						</li>
					</ul>
				</div>
			</div>
		</div>

		<div id="cart_body" style="background: #f3f3f3;">
			<div class="inner_cont">
				<c:set var="sum" value="0" />

				<c:forEach items="${cartList}" var="cartList">

					<div class="cart_list">
						<ol class="basket_list_group">
							<li class="cart-basket">
								<div class="cart-basket_header">
									<span class="shop_name">${cartList.gdsName}</span>
								</div>
								<div class="cart-basket_body">
									<ul class="order-list">
										<li class="order-idx">
											<div class="item_check">
												<input type="checkbox" name="chBox" class="chBox"
													data-cartNum="${cartList.cartNum}" />
											</div>
											<div class="item_img">
												<img src="/resources/images/upload${cartList.gdsThumbImg}"
													style="max-width: 130px;" />
											</div> <a class="bs_btn_white_02 ">
												<button type="button" class="delete_${cartList.cartNum}_btn"
													data-cartNum="${cartList.cartNum}">삭제</button>
										</a>
										</li>
									</ul>
								</div>


								<div class="cart-basket_footer">

									<strong class="text_value"> <fmt:formatNumber
											pattern="###,###,###" value="${cartList.gdsPrice}" /> 원
									</strong>
								</div>

							</li>
						</ol>
					</div>



					<div class="delete">
						<script>
							$(".delete_${cartList.cartNum}_btn")
									.click(
											function() {
												var confirm_val = confirm("정말 삭제하시겠습니까?");
												var csrfHeaderName = "${_csrf.headerName}";
												var csrfTokenValue = "${_csrf.token}";
												if (confirm_val) {
													var checkArr = new Array();

													checkArr.push($(this).attr(
															"data-cartNum"));

													$
															.ajax({
																url : "/shop/deleteCart",
																type : "post",
																data : {
																	chbox : checkArr
																},
																beforeSend : function(
																		xhr) {
																	xhr
																			.setRequestHeader(
																					csrfHeaderName,
																					csrfTokenValue)
																},
																success : function(
																		result) {
																	if (result == 1) {
																		location.href = "/shop/cartList";
																	} else {
																		alert("삭제 실패");
																	}
																}
															});
												}
											});
						</script>
					</div>
					<c:set var="sum"
						value="${sum + (cartList.gdsPrice * cartList.cartStock)}" />
				</c:forEach>
			</div>
		</div>


		<div class="cart_order">
			<div class="order">
				<div class="order_title">
					<strong class="text">전체 합계</strong>
				</div>
				<div class="order_info">

					<div class="sum">
						<ul class="receipt_list_box">
							<li class="list"><span class="label"> 총 구입 수량 </span> <span
								class="text_value"> <fmt:formatNumber
										value="${ sumStock}" /></span></li>
						</ul>
						<div class="order_summary">

							<strong class="label"> 주문 금액</strong> <span class="format-price"><strong
								class="text_value"> <fmt:formatNumber
										pattern="###,###,###" value="${sum}" />원
							</strong> </span>
						</div>

					</div>

				</div>
			</div>
		</div>


		<div class="orderOpne">
			<button type="button" class="orderOpne_bnt">주문 정보 입력</button>

			<script>
				$(".orderOpne_bnt").click(function() {
					$(".orderInfo").slideDown();
					$(".orderOpne_bnt").slideUp();
				});
			</script>
		</div>
	</div>
</div>
<!--                  주소                                  -->

<div class="orderInfo">
	<div class="infoForm">
		<div class="infoWrite">
			<form role="form" method="post" autocomplete="off"
				action="/shop/cartListPost">

				<input type="hidden" name="amount" value="${sum}" />

				<table width="100%" cellspacing="0" cellpadding="0"
					style="border-collapse: collapse;">
					<tbody>
						<tr>
							<td class="inputArea"><label for="">수령인</label></td>

							<td style="padding: 8px;" bgcolor="#ffffff" align="left"
								class="my_line"><input type="text" class="form-cont"
								name="orderRec" id="orderRec" required="required" /></td>
						</tr>
						<tr>
							<td class="inputArea"><label for="orderPhon">수령인 연락처</label></td>
							<td style="padding: 8px;" bgcolor="#ffffff" align="left"
								class="my_line"><input type="text" class="form-cont"
								name="orderPhon" id="orderPhon" required="required" /></td>
						</tr>
						<tr>
							<td class="inputArea"><label for="userAddr1">우편번호</label></td>
							<td style="padding: 8px;" bgcolor="#ffffff" align="left"
								class="my_line"><input type="text" class="form-cont"
								name="userAddr1" id="userAddr1" required="required" /> <input
								type="button" class="id-btn"
								onclick="sample4_execDaumPostcode()" value="우편번호 찾기"></td>
						</tr>
						<tr>
							<td class="inputArea"><label for="userAddr2">1차 주소</label></td>
							<td style="padding: 8px;" bgcolor="#ffffff" align="left"
								class="my_line"><input type="text" class="form-cont"
								name="userAddr2" id="userAddr2" required="required" /></td>
						</tr>
						<tr>
							<td class="inputArea"><label for="userAddr3">2차 주 소</label></td>
							<td style="padding: 8px;" bgcolor="#ffffff" align="left"
								class="my_line"><input type="text" class="form-cont"
								name="userAddr3" id="userAddr3" required="required" /></td>
						</tr>
						<tr>
							<td class="inputArea"><label for="userAddr4">상세주소 주소</label></td>
							<td style="padding: 8px;" bgcolor="#ffffff" align="left"
								class="my_line"><input type="text" class="form-cont"
								name="userAddr4" id="userAddr4" required="required" /></td>
						</tr>
						<input type="hidden" name="${_csrf.parameterName }"
							value="${_csrf.token }" />

					</tbody>
				</table>
				<div class="btnwrap">
					<button type="submit" class="order_btn">주문</button>
					<button type="button" class="cancel_btn">취소</button>
					<script>
						$(".cancel_btn").click(function() {
							$(".orderInfo").slideUp();
							$(".orderOpne_bnt").slideDown();
						});
					</script>

				</div>
			</form>
		</div>
	</div>
</div>


<!--     //////////////////////////////////////////////////////////////         -->

<script>
	//모두선택
	$("#allCheck").click(function() {
		var chk = $("#allCheck").prop("checked");
		if (chk) {
			$(".chBox").prop("checked", true);
		} else {
			$(".chBox").prop("checked", false);
		}
	});
</script>

<script>
	// 개별선택
	$(".chBox").click(function() {
		$("#allCheck").prop("checked", false);
	});
</script>


<script>
	//선택 목록 삭제
	$(".selectDelete_btn").click(function() {
		var confirm_val = confirm("정말 삭제하시겠습니까?");
		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";
		if (confirm_val) {
			var checkArr = new Array();

			$("input[class='chBox']:checked").each(function() {
				checkArr.push($(this).attr("data-cartNum"));
			});

			$.ajax({
				url : "/shop/deleteCart",
				type : "post",
				data : {
					chbox : checkArr
				},
				beforeSend : function(xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)
				},
				success : function(result) {
					if (result == 1) {
						location.href = "/shop/cartList";
					} else {
						alert("삭제 실패");
					}
				}
			});
		}
	});
</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>


<script>
	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function sample4_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 도로명 조합형 주소 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}
						// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
						if (fullRoadAddr !== '') {
							fullRoadAddr += extraRoadAddr;
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('userAddr1').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('userAddr2').value = fullRoadAddr;
						document.getElementById('userAddr3').value = data.jibunAddress;

						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							//예상되는 도로명 주소에 조합형 주소를 추가한다.
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							document.getElementById('guide').innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							document.getElementById('guide').innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr + ')';

						} else {
							document.getElementById('guide').innerHTML = '';
						}
					}
				}).open();
	}
</script>

<%@ include file="../includes/footer2.jsp"%>