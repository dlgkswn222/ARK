<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><!-- jstl core 쓸때 태그에 c 로 표시. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jstl fmt 쓸때 위와 같음.
fmt : formatter 형식 맞춰서 표시 -->

<style>
.ng-box.main01 {
	border: 4px solid #fa2828;
	text-align: center;
}

.ng-box.main01 .title {
	margin-top: 20px;
	padding: 30px;
	font-weight: bold;
	font-size: 30px;
	color: #fa2828;
	text-align: center;
}

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

/* 체크박스 and 라디오 버튼 */
input[type=checkbox], input[type=radio] {
	width: 13px;
	height: 13px;
	margin: 0;
	padding: 0;
	vertical-align: middle
}

.customer-step {
	width: 837px;
	height: 254px;
	margin: -40px 0 0 -30px;
	background: url(//pics.auction.co.kr/customer/bg_customer_step.jpg)
		no-repeat 0 0;
	font-size: 0;
	line-height: 0;
	text-indent: -5000px
}

.check-label {
	font-weight: bold
}
/* text박스 */
input[type=text] {
	*margin: -1px 0
}

/* 메인:전체보기 */
.tab-cont, .subtab-cont {
	display: none;
}

.two-tab {
	overflow: hidden;
	height: 29px;
	padding: 6px 0 0 5px;
	border-bottom: 1px solid #ccc;
}

.two-tab li:first-child {
	background: none;
}

.two-tab li a {
	font-size: 13px;
	color: #999;
	text-decoration: none;
}

.two-tab li {
	float: left;
	padding: 0 15px 0 14px;
	background: url(//pics.auction.co.kr/customer/bl_two_tab.gif) no-repeat
		0 2px;
}

div.inquiry-board tbody tr:first-child td {
	border-top: 0;
}

div.inquiry-board tbody td.division {
	padding: 12px 0 12px 19px;
	font-size: 13px;
	color: #333;
	vertical-align: top;
}

div.inquiry-board tbody th, div.inquiry-board tbody td {
	margin: 0;
	padding: 0;
}

div.inquiry-board tbody tr.questions td .subject {
	position: relative;
	padding: 0 40px 0 21px;
	background: url(//pics.auction.co.kr/customer/bg_questions.png)
		no-repeat 2px 14px;
	font-size: 13px;
	color: #666;
}

div.inquiry-board tbody tr.questions td .subject strong {
	display: inline-block;
	padding: 11px 0 13px;
	font-weight: normal;
	vertical-align: middle;
}

div.inquiry-board tbody tr.questions td .subject .vh-btn {
	position: absolute;
	top: 12px;
	right: 20px;
}

div.inquiry-board {
	width: 100%;
	border-bottom: 1px solid #ececec;
}

div.inquiry-board tbody tr.answer td {
	background-color: #fcf8f2;
}

div.inquiry-board tbody tr.answer td .answer-cont {
	padding: 6px 12px 5px 22px;
	font-family: 'Malgun Gothic', '맑은고딕', Dotum, '돋움';
	background: url(//pics.auction.co.kr/customer/bg_answer.png) no-repeat
		2px 9px;
	font-size: 13px;
	line-height: 19px;
	color: #666;
}

div.answer-cont {
	line-height: 16px;
	font-family: '돋움', dotum, tahoma, sans-serif, arial, verdana;
	letter-spacing: -1px;
}

div.inquiry-board table {
	width: 100%
}

.cont-view {
	display: block
}

div.inquiry-board {
	width: 100%;
	border-bottom: 1px solid #ececec;
}

div.inquiry-board tbody td {
	border-top: 1px solid #ececec
}

div.inquiry-board tbody tr.a-view td, div.inquiry-board tbody tr.questions:hover td
	{
	background-color: #f5f5f5;
	cursor: pointer
}

div.inquiry-board tbody tr.questions td .subject .point {
	background-color: #ff0
}

div.inquiry-board tbody tr.questions td .subject .icon {
	display: inline-block;
	padding: 5px 6px 6px;
	font-size: 0;
	line-height: 0;
	vertical-align: middle
}

div.inquiry-board tbody tr.a-view td strong, div.inquiry-board tbody tr.questions:hover td strong
	{
	font-weight: bold;
	color: #333;
	text-decoration: underline
}

.main-search-box {
	padding: 30px;
}

.ng-box input {
	padding: .375rem 17rem;
	font-size: 1rem;
	font-weight: 400;
	line-height: 1.5;
	color: #495057;
	background-color: #fff;
	background-clip: padding-box;
	border: 1px solid #ced4da;
	border-radius: .25rem;
	transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
}

.contai {
	display: table;
	table-layout: fixed;
	position: relative;
	width: 1000px;
	min-height: 100%;
	margin: 0 auto;
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

</style>

<script language="JavaScript" type="text/javascript"
	src="http://script.auction.co.kr/style/js/jquery.customer.js"></script>
<script language="JavaScript" type="text/javascript"
	src="http://script.auction.co.kr/pc/style/js/member_customer.js"></script>
<script language="JavaScript" type="text/javascript"
	src="/help/js/customer.js"></script>


<%@ include file="../includes/header.jsp"%>

<div class="sub_top_ban"></div>

<div class="page">
	<article id="article">
		<div class="contai">
			<div class="ng-box main01">
				<h3 class="title">자주 찾는 문의</h3>
				<div class="main-search-box">
					<form>
						<input type="text" class="ng-box input">
						<button class="main-search-btn">검색</button>
					</form>
				</div>
			</div>

			<br>

			<div id="tabCont1" class="tab-cont" style="display: block;">
				<ul class="two-tab">
					<li id="subLi_" class="on"><a href="">전체(44)</a></li>
					<li id="subLi_01"><a href="">회원정보</a></li>
					<li id="subLi_02"><a href="">주문</a></li>
					<li id="subLi_03"><a href="">배송</a></li>
					<li id="subLi_04"><a href="">반품/교환/AS</a></li>
					<li id="subLi_05"><a href="">서비스/불편사항</a></li>
				</ul>
				<div id="tabCont1-0" class="subtab-cont" style="display: block;">

					<div class="inquiry-board qna-board">
						<table>
							<thead align="center">
								<tr>
									<th>구분</th>
									<th>질문제목 및 답변</th>
								</tr>
							</thead>
							<tbody id="faqListTbody">

								<tr class="questions">
									<td class="division">회원가입/정보수정</td>
									<td onclick="">
										<div class="subject">
											<strong>회원 정보를 변경하고 싶어요.</strong> <span class="vh-btn"><a><img
													src="http://pics.auction.co.kr/customer/ico_view.gif"
													class="faqListIcons"></a></span>
										</div>
									</td>
								</tr>
								<tr class="answer" style="display: none;">
									<td class="division"></td>
									<td>
										<div class="answer-cont">
											<div id="M0103001_content"></div>
											<dl class="answer-radio">
												<dt>궁금하신 내용이 해결 되었나요?</dt>
											</dl>
										</div>
									</td>
								</tr>
								<tr class="questions">
									<td class="division">구매등급</td>
									<td onclick="">
										<div class="subject">
											<strong>회원등급은 언제 반영되나요?</strong> <span class="vh-btn"><a><img
													src="http://pics.auction.co.kr/customer/ico_view.gif"
													class="faqListIcons"></a></span>
										</div>
									</td>
								</tr>
								<tr class="answer" style="display: none;">
									<td class="division"></td>
									<td>
										<div class="answer-cont">

											<dl class="answer-radio">
												<dt>궁금하신 내용이 해결 되었나요?</dt>
											</dl>
										</div>
									</td>
								</tr>
								<tr class="questions">
									<td class="division">로그인</td>
									<td onclick="">
										<div class="subject">
											<strong>이용제한 상태로 로그인이 되지 않아요.</strong> <span class="vh-btn"><a><img
													src="http://pics.auction.co.kr/customer/ico_view.gif"
													class="faqListIcons"></a></span>
										</div>
									</td>
								</tr>
								<tr class="answer" style="display: none;">
									<td class="division"></td>
									<td>
										<div class="answer-cont">

											<dl class="answer-radio">
												<dt>궁금하신 내용이 해결 되었나요?</dt>
											</dl>
										</div>
									</td>
								</tr>
								<tr class="questions">
									<td class="division">탈퇴/재가입</td>
									<td onclick="">
										<div class="subject">
											<strong>재가입은 어떻게 하나요?</strong> <span class="vh-btn"><a><img
													src="http://pics.auction.co.kr/customer/ico_view.gif"
													class="faqListIcons"></a></span>
										</div>
									</td>
								</tr>
								<tr class="answer" style="display: none;">
									<td class="division"></td>
									<td>
										<div class="answer-cont">
											<dl class="answer-radio">
												<dt>궁금하신 내용이 해결 되었나요?</dt>
											</dl>
										</div>
									</td>
								</tr>
								<tr class="questions">
									<td class="division">구매등급</td>
									<td onclick="">
										<div class="subject">
											<strong>나의 회원상태를 알고 싶어요.</strong> <span class="vh-btn"><a><img
													src="http://pics.auction.co.kr/customer/ico_view.gif"
													class="faqListIcons"></a></span>
										</div>
									</td>
								</tr>
								<tr class="answer" style="display: none;">
									<td class="division"></td>
									<td>
										<div class="answer-cont">

											<dl class="answer-radio">
												<dt>궁금하신 내용이 해결 되었나요?</dt>
											</dl>
										</div>
									</td>
								</tr>
								<tr class="questions">
									<td class="division">탈퇴/재가입</td>
									<td onclick="">
										<div class="subject">
											<strong>새로운 아이디로 재가입 할 수 있나요?</strong> <span class="vh-btn"><a><img
													src="http://pics.auction.co.kr/customer/ico_view.gif"
													class="faqListIcons"></a></span>
										</div>
									</td>
								</tr>
								<tr class="answer" style="display: none;">
									<td class="division"></td>
									<td>
										<div class="answer-cont">

											<dl class="answer-radio">
												<dt>궁금하신 내용이 해결 되었나요?</dt>
											</dl>
										</div>
									</td>
								</tr>

								<tr id="M0101002" class="questions">
									<td class="division">회원가입/정보수정</td>
									<td onclick="fnFaqContentShow('M0101002');">
										<div class="subject">
											<strong>아이디를 변경하고 싶어요.</strong> <span class="vh-btn"><a><img
													src="http://pics.auction.co.kr/customer/ico_view.gif"
													class="faqListIcons" id="faqListIcon_M0101002"></a></span>
										</div>
									</td>
								</tr>
								<tr class="answer" id="M0101002_sub" style="display: none;">
									<td class="division"></td>
									<td>
										<div class="answer-cont">
											<div id="M0101002_content">
												<p class="innerp_s mtxs">
													<span style="font-family: 'malgun gothic';"><strong
														class="slim color01">아이디는 변경 하실 수 없습니다.</strong></span>
												</p>
												<p class="innerp_s mtxs">
													<span style="font-family: 'malgun gothic';">단, 거래내역이
														없고 개인 구매회원의 경우에 한해 회원 탈퇴 7일 이 후 재가입을 통해 새로운 아이디로 가입이
														가능합니다. <a href="javascript:inlinelink('E05002');">자세히보기</a>
													</span>
												</p>
												<input type="hidden" class="evaluateYn" value="Y">
											</div>
											<dl class="answer-radio">
												<dt>궁금하신 내용이 해결 되었나요?</dt>
												<dd>
													<label><input id="checky" type="radio"
														onclick="fnFAQTextBoxShow('M0101002', false);"
														name="yesorno" value="Y">예</label>
												</dd>
												<dd>
													<label class="no-click"><input id="checkn"
														type="radio" onclick="fnFAQTextBoxShow('M0101002', true);"
														name="yesorno" value="N">아니오</label>
												</dd>
											</dl>
											<div class="star-input" id="M0101002_textbox">
												<div class="textarea">
													<textarea class="text_area" rows="10" cols="10" title="평가글"
														onfocus="fnFaqTextArea('M0101002');"
														onkeyup="fnFAQChkByte(this, 200);">추가되었으면 하는 내용이 있다면 말씀해주세요.</textarea>
												</div>
												<p class="text-byte">
													(<strong><span class="areacount">0</span></strong>/200)
												</p>
											</div>
											<div class="rating-btn">
												<span class="btn-type1"><a href="#"
													style="cursor: pointer"
													onclick="fnFAQEvaluateConfirm('M0101002');">평가하기</a></span>
											</div>
											<p class="dot-text">
												더 궁금한 사항이 있으시면 고객만족센터로 문의해주세요. <span class="link"><a
													href="javascript:window.open('http://www.auction.co.kr/login/?SELLER=AUCTION_HELP&amp;helpmain=1&amp;url=http://member.auction.co.kr/help/MailCheck.aspx?topCode=M&amp;cCode=M0101002','','toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=no,resizable=Yes,copyhistory=0,width=483,height=573,left=100,top=0').focus()">문의접수하기</a></span>
											</p>
										</div>
									</td>
								</tr>

							</tbody>
						</table>
					</div>
				</div>

			</div>
		</div>
	</article>
</div>

<script>
	$(document).ready(function() {

		$('ul.tabs li').click(function() {
			var tab_id = $(this).attr('data-tab');

			$('ul.tabs li').removeClass('current');
			$('.tab-content').removeClass('current');

			$(this).addClass('current');
			$("#" + tab_id).addClass('current');
		})

	})
</script>



<%@include file="../includes/footer2.jsp"%>