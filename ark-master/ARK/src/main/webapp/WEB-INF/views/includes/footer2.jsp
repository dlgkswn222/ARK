<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<style>
#footer1 {
	width: 100%;
	margin: 100px 0 0 0;
	padding: 0px;
	font-size: 0px;
	border-top: 3px solid #eaeaea;
}

#mfooter {
	width: 1200px;
	height: 293px;
	margin: 0 auto;
	position: relative;
}

#mfooter .bt_top {
	position: absolute;
	top: 0px;
	right: 0;
	background: url(/resources/images/bt_top.png) no-repeat left top;
}

#mfooter .inner_left {
	float: left;
	width: 420px;
}

#mfooter .inner_left .sns_box {
	text-align: left;
	margin-left: -8px;
	font-size: 0;
}

#mfooter .inner_left .sns_box li {
	display: inline-block;
	padding: 0 20px 0 0;
}

#mfooter .inner_left .sns_box li a {
	filter: alpha(opacity = 70);
	opacity: 0.7;
	-moz-opacity: 0.7;
}

#mfooter .inner_left .sns_box li a:hover {
	filter: alpha(opacity = 100);
	opacity: 1.0;
	-moz-opacity: 1.0;
}

#mfooter .inner_left .bt_customer .cscenter {
	float: left;
	text-transform: uppercase;
}

#mfooter .inner_left .bt_customer .cscenter p {
	color: #b2b2b2;
	font-size: 25px;
	text-align: left;
	font-family: 'Oswald', "Open Sans", "Nanum Gothic", sans-serif;
	letter-spacing: 5px;
	line-height: 25px;
	font-weight: 300;
}

#mfooter .inner_left .bt_customer .cscenter p:first-child {
	font-size: 18px;
	color: #333;
}

#mfooter .inner_left .bt_customer .cstime {
	margin-left: 20px;
	margin-top: 5px;
	color: #939191;
	font-size: 11px;
	text-align: left;
	font-family: dotum;
	line-height: 17px;
	font-weight: normal;
}

#mfooter .inner_left .bt_bank {
	margin-top: 26px;
	text-transform: uppercase;
}

#mfooter .inner_left .bt_bank p {
	color: #b2b2b2;
	font-size: 25px;
	text-align: left;
	font-family: 'Oswald', "Open Sans", "Nanum Gothic", sans-serif;
	letter-spacing: 5px;
	line-height: 30px;
	font-weight: 300;
}

#mfooter .inner_left .bt_name {
	color: #b2b2b2;
	font-family: dotum;
	line-height: 17px;
	font-weight: normal;;
	margin-top: 20px;
}

#mfooter .inner_left .bt_bank p:first-child {
	font-size: 18px;
	color: #333;
}

#mfooter .inner_left .bt_name {
	margin-top: 10px;
	text-transform: uppercase;
}

#mfooter .inner_left .bt_name p {
	color: #939191;
	font-size: 11px;
	text-align: left;
	font-weight: 300;
	font-family: dotum;
	line-height: 17px;
	font-weight: normal;
}

#mfooter .inner_right {
	float: left;
	margin: 60px 0 0 100px;
	width: 680px;
}

#mfooter .inner_right .bt_logo {
	text-align: left;
	display: none;
}

#mfooter .inner_right .bt_copyright {
	margin-top: 26px;
	color: #939191;
	font-size: 11px;
	text-align: left;
	font-family: dotum;
	line-height: 17px;
	font-weight: normal;
}

#mfooter .inner_right .bt_copyright p {
	color: #777;
	font-family: Verdana;
	font-weight: normal;
	font-size: 12px;
	text-align: left;
	line-height: 32px;
}

#mfooter .inner_right .bt_copyright p img {
	margin-left: 10px;
	vertical-align: middle;
	filter: alpha(opacity = 60);
	opacity: 0.6;
	-moz-opacity: 0.6;
}

#mfooter .inner_right .bt_copyright a {
	font-size: 11px;
	text-align: left;
	font-family: dotum;
	line-height: 17px;
	color: #939191;
	vertical-align: baseline;
}

#mfooter .inner_right .bt_guide {
	margin-top: 47px;
	text-align: left;
}

#mfooter .inner_right .bt_guide a {
	float: left;
	color: #777;
	font-family: Verdana;
	font-weight: normal;
	font-size: 11px;
	text-align: left;
	padding-right: 20px;
}

#mfooter .inner_right .bt_guide a:hover {
	color: #68abb3;
}

#mfooter .inner_right .bt_guide a:first-child+a {
	color: #68abb3;
	text-decoration: underline;
	font-weight: 3;
}

#mfooter .inner_right .bt_guide a:first-child+a:hover {
	color: #111
}
</style>

<!-- footer -->
<div id="footer1">
	<div id="mfooter">
		<div class="bt_top">
			<a href="#a"><img src="/resources/images/bt_top.png"
				alt="맨위로 올라기가기"></a>
		</div>
		<div class="inner_left">
			<div class="cboth bt_customer">
				<div class="cscenter">
					<!-- 하단 쇼핑몰 정보 입력하는곳 -->
					<p>CS CENTER</p>
					<p>000.0000.0000</p>
				</div>
				<!-- //cscenter -->

				<div class="cstime">
					운영시간 : 오전 08:30 ~ 오후 06시30분<br> 점심시간 : 12시 ~ 1시 <br>
					토,일,공휴일 휴무
				</div>
				<!-- //cstime -->
			</div>
			<!-- //bt_customer -->



			<div class="cboth bt_bank">
				<p>BANK ACCOUNT</p>
				<p>KOOKMIN 0000000000</p>
				<p>GWANGJU 000-000-000000</p>
				<p>SHINHAN 000-000-000000</p>

			</div>
			<!-- //bt_bank -->

			<div class="cboth bt_name">
				<p>예금주 : 000</p>
			</div>
			<!-- //bt_bank -->


		</div>
		<!-- //inner_left -->

		<div class="inner_right">
			<div class="cboth bt_copyright">
				COMPANY : 스픽스&nbsp;&nbsp;OWNER : 000&nbsp;&nbsp;ADDRESS : 인천 미추홀구
				매소홀로488번길 6-32 태승빌딩 5층<br> 개인정보관리책임자 : &nbsp;&nbsp;사업자등록번호 :
				[000-00-00000] <a href="#none"
					onclick="popup_bizInfo('4022961806');">[사업자정보확인]</a>&nbsp;&nbsp;통신판매업
				신고번호 : 0000-0000-0000<br> CALL CENTER :
				010-0000-0000&nbsp;&nbsp;FAX : 000-000-0000&nbsp;&nbsp;<br>

				<p>Copyright (c) by monsterlab.kr. All Right Reserved.</p>
			</div>
			<!-- //bt_copyright -->

		</div>
		<!-- //inner_right -->
	</div>
</div>
<script>
$( window ).scroll( function() {
	if ( $( this ).scrollTop() > 200 ) {
		$( '.bt_top' ).fadeIn();
	} else {
		$( '.bt_top' ).fadeOut();
	}
} );

$( '.bt_top' ).click( function() {
	$( 'html, body' ).animate( { scrollTop : 0 }, 400 );
	return false;
} );
</script>
