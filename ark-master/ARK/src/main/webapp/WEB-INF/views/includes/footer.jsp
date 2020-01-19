<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<style>
.f_info {
	position: relative;
	width: 1200px;
	min-height: 220px;
	margin: 10px 480px;
	padding-top: 30px;
}

.add_sk {
	position: relative;
	float: left;
	width: 468px;
	height: 90px;
	margin-bottom: 22px;
	padding-left: 104px;
}

.footer_wrap3 .f_info .add_sk dl {
	padding-left: 20px;
	border-left: 1px solid #dadada;
}

.footer_wrap3 .f_info dt {
	margin-bottom: 4px;
	font-weight: bold;
	color: #333;
	line-height: 18px;
}

.gnbArea logo {
	position: absolute;
	left: 0;
	top: 80px;
	width: 100px;
	height: 60px;
	background: url(/resources/images/123456.png) 0 0 no-repeat;
}

.add_center {
	float: left;
	width: 311px;
	height: 90px;
	margin-bottom: 22px;
	padding: 0 20px;
	border-left: 1px solid #dadada;
}

.footer_wrap3.no_toolbar {
	padding-bottom: 0;
}

.footer_wrap3 {
	background: #fafafa;
	color: #333;
	font: 14px/1 "Helvetica Neue", "Apple SD Gothic Neo", "맑은 고딕",
		"Malgun Gothic", "돋움", dotum, sans-serif;
	letter-spacing: -1px;
}

.info_conts {
	position: relative;
	clear: both;
	border-top: 1px solid #e8e8e8;
	margin-top: 20px;
	padding: 20px 120px;
}

.footer_wrap3 .f_info .add_ele {
	float: left;
	width: 248px;
	height: 90px;
	margin-bottom: 22px;
	padding-left: 20px;
	border-left: 1px solid #dadada;
}

.footer_wrap3 .f_menu {
    padding: 12px 0;
    background: #f2f2f2;
    border-top: 1px solid #dadada;
    border-bottom: 1px solid #dadada;
    line-height: 22px;
}

.footer_wrap3 .menu_conts {
    width: 600px;
    margin: 0 auto;
    overflow: hidden;
    zoom: 1;
}

.footer_wrap3 .menu_conts li {
    float: left;
}

.footer_wrap3 .menu_conts li + li {
    padding-left: 36px;
    background: url(/resources/images/bar.gif) 18px 6px no-repeat;
}

</style>
<script src="resources/js/fullpage.js"></script>

<!-- footer -->

<div id="footerWrap3" class="footer_wrap3 no_toolbar">
	<div class="f_menu">
		<ul class="menu_conts clfix" data-log-actionid-area="footer"
			data-log-actionid-label="btn" data-is-ab-send="1">
			<li>회사소개</li>		
			<li>이용약관</li>
			<li>거래약관</li>
			<li>개인정보처리방침</li>
			<li>고객센터</li>
			<li>사이트맵</li>
		</ul>
	</div>
	<div class="f_info">
		<div class="add_sk">
			<dl>
				<dt>ARK</dt>
				<dd>(0000) 인천 미추홀구 매소홀로488번길 6-32 태승빌딩 5층</dd>
				<dd>Tel: 0000-0000</dd>
				<dd>Fax: 00-0000-0000</dd>
			</dl>
			<span class="logo"></span>
		</div>
		<div class="add_center">
			<dl>
				<dt>고객센터</dt>
				<dd>(0000) 인천 미추홀구 매소홀로488번길 6-32 태승빌딩 5층</dd>
				<dd>Tel : 0000-0000</dd>
				<dd>Fax : 00-0000-0000</dd>
				<dd>
					E-mail : 000000@naver.com</a>
				</dd>
			</dl>
		</div>
		<div class="add_ele">
			<dl>
				<dt>거래분쟁담당</dt>
				<dd>신한은행: 000-000-0000</dd>
				<dd>예금주 : 000</dd>
				<dd>카카오톡 : 000000</dd>
				<dd>
					E-mail : 000000@naver.com</a>
				</dd>
			</dl>
		</div>

		<div class="info_conts">
			<div class="btnwrap"></div>
			<p class="txt">ARK는 판매중개자로서 거래당사자가 아니며, 입점판매자가 등록한 상품정보 및 거래에 대해
				ARK는 일체 책임을 지지 않습니다.</p>
		</div>
	</div>
</div>