<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><!-- jstl core 쓸때 태그에 c 로 표시. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html lang="ko">

<head>
		<meta charset="utf-8">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta http-equiv="Expires" content="-1">
	<meta http-equiv="Pragma" content="no-cache">
	<meta http-equiv="Cache-Control" content="No-Cache">
	<meta name="format-detection" content="telephone=no">
	<meta name="Author-Date" content="2017-05-25">
	<meta name="Description" content="반려 동물의 DNA실명제를 통한 펫혈통 관리로 유기견 없는 나라 대한민국을 만드는 반려동물 실명제 프로젝트를 시작하는 회사입니다.">
	<meta name="keyword" content="도그코리아, 반려동물, DNA검사, DNA실명제, 혈통관리, 펫펼통, 유기견, 실명제">
	<title> 도그코리아(PET WORLD KOREA) - 유기견 없는나라 대한민국 </title>
	<!-- <script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script> -->
	<script src="/js/jquery.min.js" crossorigin="anonymous"></script>
	<script src="/js/jquery-ui.js"></script>
	<script src="/js/lib/underscore-min.js"></script>
	<script src="/js/lib/jquery.bpopup.min.js"></script>
	<script src="/js/lib/jquery.form.min.js"></script>
	<!-- <script src="/js/lib/clipboard.min.js"></script> -->
	<script src="/js/lib/jquery.twbsPagination.min.js"></script>
	<!-- <script src="/js/lib/jquery.touchslider.js"></script> -->
	<script src="/js/lib/unslider.js"></script>
	<script src="/js/lib/swiper.jquery.min.js"></script>
	<script src="https://pg.mcash.co.kr/dlp/js/npgIF.js" charset="EUC-KR"></script> <!-- 필수 -->
	<script src="https://mup.mobilians.co.kr/js/ext/ext_inc_comm.js"></script>
	<script src="/controller/pet_bunyang/bunyang_search.js?190320134714"></script>
	<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" /> -->
	<meta name="viewport" content="width=1200">
	<link href="/resources/css/jquery-ui.css" rel="stylesheet">
	<link href="/resources/css/swiper.min.css" rel="stylesheet" media="screen">
	<link href="/resources/css/font-awesome.min.css" rel="stylesheet">
	<link href="/resources/css/style1.css" rel="stylesheet" media="screen">
	
	<script src="/js/site/common.top.js"></script>
	<script src="/js/common.js?v=1"></script>
	<link rel="shortcut icon" href="/favicon.ico">
	<script src="/js/home_toggle.js"></script>	<script src="/js/lib/jquery.number.min.js"></script>
</head>
<body>
	<!-- wrap : Start -->
	<div class="wrap">
		<!-- header : Start -->
		<div class="header">
						<div class="sub-menu-wrap">
				<div class="sub-menu-box">
				<ul class="h_logo">
						<li><h2><a href="/"><img src="/images/global/logo_top_3.png" alt="" style="height:35px;"></a></h2></li>
						<!-- <li> -->
							<!-- 검색박스 -->
							<!-- <form method="GET" action="/search"> -->
								<!-- <input type="text" name="search" value="" placeholder="검색어 입력"><button class="fa fa-search"></button> -->
							<!-- </form> -->
							<!--<img src="/images/global/btn_search.png" alt="">-->
						<!-- </li> -->
					</ul>
					<ul class="sub-menu">
					    
						<li class="mr20"><img src="/images/global/btn_sns01.png" alt=""></li>
						<li class="mr20"><img src="/images/global/btn_sns02.png" alt=""></li>
						<li class="mr20"><img src="/images/global/btn_sns03.png" alt=""></li>
						<li class="mr20"><img src="/images/global/btn_sns04.png" alt=""></li>
						
				<li class="sm-txt split"><a href="/membership/login.php">Login</a></li>
				<li class="sm-txt split"><a href="/membership/join1.php">Join</a></li>
				<li class="sm-txt"><a href="/mypage/index.php">Mypage</a></li>
		
						<li class="alert-bell">
                            <i class="fa fa-bell" aria-hidden="true"></i><span></span>
							<div class="alert-box">
                     
								<div class="alert-balloon">
									<ul class="alter-list">
										<li class="alert-blank">본 기능을 사용하시려면 로그인 해 주세요.</li>
									</ul>
									<div class="page-paging paging-border" aria-label="Page navigation">
										<ul class="pagination" id="pagination_memo"></ul>
									</div>
								</div>

							</div>
						</li>
						
						<li class="badge-box"></li>

					</ul>
				</div>
			</div>
<!--
			<div class="logo-wrap">
				<div class="logo-box">
					
				</div>
			</div>-->
						<div class="top-menu-wrap">
				<div class="top-gnb-wrap">
					<ul class="top-gnb-menu">
						<li>
							<a href="/pet_record/"><p>펫 혈통관리시스템</p></a>
						</li>
						<li>
							<a href="/pet_presale/"><p>펫 실명분양</p></a>
						</li>
						<li class="active">
							<a href="/pet_bunyang/"><p>각종 펫 분양</p></a>
							<ul class="top-sub-menu">
								<li class="logo-menu"><a href="/"><img src="/images/global/logo_menu.png" alt=""></a></li>
								<li><a href="/pet_bunyang/bunyang_search.php?s_size_gn=m">포유류</a></li>
								<li><a href="/pet_bunyang/bunyang_search.php?s_size_gn=r">파충류</a></li>
								<li><a href="/pet_bunyang/bunyang_search.php?s_size_gn=a">양서류</a></li>
								<li><a href="/pet_bunyang/bunyang_search.php?s_size_gn=i">곤충류</a></li>
								<li><a href="/pet_bunyang/bunyang_search.php?s_size_gn=b">조류</a></li>
								<li><a href="/pet_bunyang/bunyang_search.php?s_size_gn=f">사육용품</a></li>
							</ul>
						</li>
						<li>
							<a href="/pet_shop/"><p>쇼핑몰</p></a>
						</li>
						
						<li>
							<a href="/pet_sub/com01.php"><p>도그코리아</p></a>
						</li>
						<li>
							<a href="/patners/"><p>협력사</p></a>
						</li>
					</ul>
				</div>
			</div>		</div>
		<!-- header :  End -->
		<!-- content :  Start -->
		<div class="content">

			<div class="page-nav"><i><img src="/images/global/ico_page_nav.png" alt=""></i>&nbsp;DOGKOREA&nbsp;&nbsp;&gt;&nbsp;&nbsp;각종 펫 분양&nbsp;&nbsp;&gt;&nbsp;&nbsp;<span>파충류 분양</span></div>
			<div class="page-title"><h2>파충류 분양</h2></div>
			<div class="search-presale">
				<form class="form-search" method="post" name="presale-search" autocomplete="off">
					<input type="hidden" name="s_ani_gn" value="R">
					<input type="hidden" name="m_mst_cd" value="M">	<!-- 추가_펫색상(흰색, 검정 등)_KSB_20181123 -->

				<ul class="search-presale-tab">
					<li>PET SEARCH</li>
					
				</ul>
				<div class="search-presale-wrap">
					<div class="default-form-group group_head">
						<table id="pet_datalist" cellpadding="0" cellspacing="0">
							<thead>
								<tr>
									<th>펫종류</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
										<select name="s_ani_cd" id="s_ani_cd">
	                                    	<!--option value="">전체</option-->
								    	 <option value="">전체</option> <option value="R075">거북이_(기타)</option> <option value="R076">거북이_(늑대거북)</option> <option value="R080">거북이_(동헤르만)</option> <option value="R079">거북이_(레드풋)</option> <option value="R078">거북이_(레오파드)</option> <option value="R077">거북이_(스피노사 박스터틀)</option> <option value="R071">도마뱀_(기타)</option> <option value="R072">도마뱀_(레오파드게코)</option> <option value="R074">도마뱀_(크레스티드 게코)</option> <option value="R073">도마뱀_(토케이 게코)</option> <option value="R070">뱀_(기타)</option> <option value="R067">뱀_(렛스네이크)</option> <option value="R069">뱀_(보아)</option> <option value="R066">뱀_(콘스네이크)</option> <option value="R068">뱀_(킹스네이크)</option></select>
								    </td>
								</tr>								
							</tbody>
						</table>
					</div>
					<div class="default-form-group group_body">
						<table>
							<thead>
								<tr>
									<th>성별</th>

									<th class="pt10"><label><input type="radio" name="s_sex" value="" checked="">&nbsp;&nbsp;전체</label></th>

									<th><label><input type="radio" name="s_sex" value="X">&nbsp;&nbsp;수컷</label></th>

									<th><label><input type="radio" name="s_sex" value="Y">&nbsp;&nbsp;암컷</label></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="gr_td">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;컬러</td>
									<td colspan="3">
										<select name="s_color" id="s_color">
	  										<!--option value="">색상 선택</option>
											<option value="흰색">흰색</option>
											<option value="검정">검정</option>
											<option value="빨강">빨강</option-->
										 <option value="">색상 선택</option> <option value="04">갈색</option> <option value="26">검은회색</option> <option value="02">검정</option> <option value="22">골드</option> <option value="13">노란갈색</option> <option value="03">노랑</option> <option value="28">레드탄</option> <option value="15">브린들</option> <option value="09">블랙탄</option> <option value="23">블루멀</option> <option value="07">빨강</option> <option value="99">색상 미지정</option> <option value="12">실버</option> <option value="27">얼룩무늬</option> <option value="16">오렌지</option> <option value="24">점박이</option> <option value="08">점박이 갈색</option> <option value="06">점박이 검정</option> <option value="19">점박이 노랑</option> <option value="29">초록색</option> <option value="21">쵸코탄</option> <option value="05">크림</option> <option value="11">크림갈색</option> <option value="30">파랑</option> <option value="20">파티</option> <option value="25">패치</option> <option value="17">호피</option> <option value="14">회색</option> <option value="18">흑백 얼룩이</option> <option value="01">흰색</option> <option value="10">흰회색</option></select>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="default-form-group group_mid">
						<table>
							<tbody>
								<tr>
									<th>분양가</th>
									<td class="pt10">
										<select name="s_price" id="s_price">
     										<option value="">전체</option>
     										<option value="A">50만원미만</option>
     										<option value="B">50만원~100만원미만</option>
     										<option value="C">100만원~150만원미만</option>
     										<option value="D">150만원~200만원미만</option>
     										<option value="E">200만원이상</option>
										</select>
									</td>
								</tr>
								
								<tr>
									<th>개월수</th>
									<td><select name="s_month" id="s_month">
  										<option value="">개월수 선택</option>
										<option value="A">3개월 미만</option>
										<option value="B">3개월~6개월미만</option>
										<option value="C">6개월~12개월미만</option>
										<option value="D">1년이상~3년미만</option>
										<option value="E">3년이상~5년미만</option>
										<option value="F">5년이상</option>
									</select></td>
								</tr>
								
							</tbody>
						</table>
					</div>
					
					<div class="default-form-group group_foot">
						<table>
						    <thead>
						        <tr>
									<th style="margin:0; height:30px;">지역</th>
									<td class="pt10">
										<select name="s_area_do" id="s_area_do">
											<option value="">지역선택</option>
											<option value="01">강원</option>
											<option value="02">경기</option>
											<option value="03">경남</option>
											<option value="04">경북</option>
											<option value="05">광주</option>
											<option value="06">대구</option>
											<option value="07">대전</option>
											<option value="08">부산</option>
											<option value="09">서울</option>
											<option value="10">세종</option>
											<option value="11">울산</option>
											<option value="12">인천</option>
											<option value="13">전남</option>
											<option value="14">전북</option>
											<option value="15">제주</option>
											<option value="16">충남</option>
											<option value="17">충북</option>
										</select>
									</td>
								</tr>
						    </thead>
							<tbody>
								<tr>
									<td colspan="2" rowspan="4"><span><p class="btn-default-search">검색</p></span></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				</form>
			</div>

			<div class="presale-wrap">
				<div class="list-presale widget-gallery" id="pet-list">					<dl class="pet-info-popup" data-method="2427">						<a href="/pet_presale/sale_detail.php?sa_no=256">							<dt class="widget-img"><img src="/uploadfiles/pet_sell/256/20181231155655_01.png"></dt>							<dd>종류 : 도마뱀_(크레스티드 게코)</dd>							<dd>성별 : 암컷</dd>							<dd class="sell-amt"><span></span></dd>							<dd><span class="ico-progress">분양중</span></dd>							<dd></dd>						</a>					</dl>					<dl class="pet-info-popup" data-method="2426">						<a href="/pet_presale/sale_detail.php?sa_no=255">							<dt class="widget-img"><img src="/uploadfiles/pet_sell/255/20181231155115_01.png"></dt>							<dd>종류 : 거북이_(늑대거북)</dd>							<dd>성별 : 암컷</dd>							<dd class="sell-amt"><span></span></dd>							<dd><span class="ico-progress">분양중</span></dd>							<dd></dd>						</a>														</dl>					<dl class="pet-info-popup" data-method="2425">						<a href="/pet_presale/sale_detail.php?sa_no=254">							<dt class="widget-img"><img src="/uploadfiles/pet_sell/254/20181231154717_01.png"></dt>							<dd>종류 : 뱀_(킹스네이크)</dd>							<dd>성별 : 암컷</dd>							<dd class="sell-amt"><span></span></dd>							<dd><span class="ico-progress">분양중</span></dd>							<dd></dd>						</a>														</dl>					<dl class="pet-info-popup" data-method="2424">						<a href="/pet_presale/sale_detail.php?sa_no=253">							<dt class="widget-img"><img src="/uploadfiles/pet_sell/253/20181231154355_01.png"></dt>							<dd>종류 : 뱀_(콘스네이크)</dd>							<dd>성별 : 암컷</dd>							<dd class="sell-amt"><span></span></dd>							<dd><span class="ico-progress">분양중</span></dd>							<dd></dd>						</a>																							</dl>					<dl class="pet-info-popup" data-method="2423">						<a href="/pet_presale/sale_detail.php?sa_no=252">							<dt class="widget-img"><img src="/uploadfiles/pet_sell/252/20181231153852_01.png"></dt>							<dd>종류 : 도마뱀_(레오파드게코)</dd>							<dd>성별 : 암컷</dd>							<dd class="sell-amt"><span></span></dd>							<dd><span class="ico-progress">분양중</span></dd>							<dd></dd>						</a>																	</dl>					<dl class="pet-info-popup" data-method="2386">						<a href="/pet_presale/sale_detail.php?sa_no=224">							<dt class="widget-img"><img src="/uploadfiles/pet_sell/224/20181228155351_01.png"></dt>							<dd>종류 : 뱀_(보아)</dd>							<dd>성별 : 암컷</dd>							<dd class="sell-amt"><span></span></dd>							<dd><span class="ico-progress">분양중</span></dd>							<dd></dd>						</a>					</dl>					<dl class="pet-info-popup" data-method="2385">						<a href="/pet_presale/sale_detail.php?sa_no=223">							<dt class="widget-img"><img src="/uploadfiles/pet_sell/223/20181228155201_01.png"></dt>							<dd>종류 : 거북이_(기타)</dd>							<dd>성별 : 암컷</dd>							<dd class="sell-amt"><span></span></dd>							<dd><span class="ico-progress">분양중</span></dd>							<dd></dd>						</a>								</dl>					<dl class="pet-info-popup" data-method="2384">						<a href="/pet_presale/sale_detail.php?sa_no=222">							<dt class="widget-img"><img src="/uploadfiles/pet_sell/222/20181228154912_01.png"></dt>							<dd>종류 : 도마뱀_(기타)</dd>							<dd>성별 : 암컷</dd>							<dd class="sell-amt"><span></span></dd>							<dd><span class="ico-progress">분양중</span></dd>							<dd></dd>						</a>											</dl>					<dl class="pet-info-popup" data-method="2383">						<a href="/pet_presale/sale_detail.php?sa_no=221">							<dt class="widget-img"><img src="/uploadfiles/pet_sell/221/20181228154651_01.png"></dt>							<dd>종류 : 뱀_(기타)</dd>							<dd>성별 : 암컷</dd>							<dd class="sell-amt"><span></span></dd>							<dd><span class="ico-progress">분양중</span></dd>							<dd></dd>						</a>					</dl>					<dl class="pet-info-popup" data-method="2378">						<a href="/pet_presale/sale_detail.php?sa_no=216">							<dt class="widget-img"><img src="/uploadfiles/pet_sell/216/20181228152801_01.png"></dt>							<dd>종류 : 거북이_(기타)</dd>							<dd>성별 : 암컷</dd>							<dd class="sell-amt"><span></span></dd>							<dd><span class="ico-progress">분양중</span></dd>							<dd></dd>						</a>					</dl></div>
			</div>
			<div class="page-paging" aria-label="Page navigation">
				<ul class="pagination" id="pagination"><li class="page-item first disabled"><a href="#" class="page-link"><span class="glyp-back" aria-hidden="true"></span></a></li><li class="page-item prev disabled"><a href="#" class="page-link"><span class="glyp-tr-left" aria-hidden="true"></span></a></li><li class="page-item active"><a href="#" class="page-link">1</a></li><li class="page-item next disabled"><a href="#" class="page-link"><span class="glyp-tr-right" aria-hidden="true"></span></a></li><li class="page-item last disabled"><a href="#" class="page-link"><span class="glyp-for" aria-hidden="true"></span></a></li></ul>
			</div>
			
			<div class="quick-wrap">
				<ul class="quick-menu">
					<li><a href="#" id="btn-dna-login-gobal"><img src="/images/global/btn_quick_01.png" alt=""></a></li>
					<li><a href="/mypage/pet_reg.php"><img src="/images/global/btn_quick_02.png" alt=""></a></li>
				</ul>
			</div>

			<div class="chat-start-ico">
				<span class="chat-open">실시간 상담</span>
				<i class="fa fa-comments chat-open" aria-hidden="true"></i>
				<input type="hidden" name="ss_chat_cc_no" value="">
			</div>
			<div class="chat-wrap">
				<div class="chat-title">
					<h2><i class="fa fa-comments" aria-hidden="true"></i>실시간 상담</h2>
				</div>
				<div class="chat-list">
					<ul>
						<li class="chat-info">
							<p><i class="fa fa-user-circle-o" aria-hidden="true"></i> 상담자 정보</p>
							<span class="chat-name">비회원 고객</span>님
						</li>
						<li class="chat-start-btn"><button>상담시작</button></li>
					</ul>
				</div>
				<div class="chat-status"> 관리자가 입력중 입니다... </div>
				<div class="chat-input">
					<form name="frm-chat" id="frm-chat" method="post">
						<input type="hidden" name="chat_mb_no" value="98337467023">
						<input type="hidden" name="chat_cc_no">
						<input type="hidden" name="chat_send_gn" value="1">
						<input type="text" name="chart_message" readonly="readonly" autocomplete="off"><button class="chat-none-btn"><i class="fa fa-paper-plane-o" aria-hidden="true"></i>보내기</button>
					</form>
				</div>
			</div>

		</div>
		<!-- content :  End -->
				<!-- partner-wrap :  Start -->
		<div class="partner-wrap">
			<h3><img src="/images/global/title_partner.png" alt=""></h3>
			<div class="swiper-container swiper-container-horizontal">
				<div class="swiper-wrapper" style="transition-duration: 0ms; transform: translate3d(-3145px, 0px, 0px);"><ul class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="30" style="width: 175px; margin-right: 10px;">				<li><img src="/uploadfiles/edt_upload/20181226162435_639023.png"></li>				<li>전국예능인노동조합연맹</li>			</ul><ul class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="31" style="width: 175px; margin-right: 10px;">				<li><img src="/uploadfiles/edt_upload/20171229094739_541937.png"></li>				<li>한국 유전자 정보 연구원</li>			</ul><ul class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="32" style="width: 175px; margin-right: 10px;">				<li><img src="/uploadfiles/edt_upload/20171229095239_497384.png"></li>				<li>한국 동물 병원 협회</li>			</ul><ul class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="33" style="width: 175px; margin-right: 10px;">				<li><img src="/uploadfiles/edt_upload/20170523140823_696448.png"></li>				<li>충현동물종합병원</li>			</ul><ul class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="34" style="width: 175px; margin-right: 10px;">				<li><img src="/uploadfiles/edt_upload/20170523141058_883665.png"></li>				<li>이리온 동물병원 김포점</li>			</ul><ul class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="35" style="width: 175px; margin-right: 10px;">				<li><img src="/uploadfiles/edt_upload/20181220180131_845345.png"></li>				<li>고려동물병원</li>			</ul>
							<ul class="swiper-slide" data-swiper-slide-index="0" style="width: 175px; margin-right: 10px;">				<li><img src="/uploadfiles/edt_upload/20190711092908_149607.png"></li>				<li>코리아경찰견학교</li>			</ul>			<ul class="swiper-slide" data-swiper-slide-index="1" style="width: 175px; margin-right: 10px;">				<li><img src="/uploadfiles/edt_upload/20190711100327_907346.png"></li>				<li>군산도그랜드</li>			</ul>			<ul class="swiper-slide" data-swiper-slide-index="2" style="width: 175px; margin-right: 10px;">				<li><img src="/uploadfiles/edt_upload/20190710095838_003460.png"></li>				<li>야호펫</li>			</ul>			<ul class="swiper-slide" data-swiper-slide-index="3" style="width: 175px; margin-right: 10px;">				<li><img src="/uploadfiles/edt_upload/20190710095912_224971.png"></li>				<li>아이헤븐</li>			</ul>			<ul class="swiper-slide" data-swiper-slide-index="4" style="width: 175px; margin-right: 10px;">				<li><img src="/uploadfiles/edt_upload/20190710101646_105391.png"></li>				<li>휴벳</li>			</ul>			<ul class="swiper-slide" data-swiper-slide-index="5" style="width: 175px; margin-right: 10px;">				<li><img src="/uploadfiles/edt_upload/20190710101751_010540.png"></li>				<li>커뮤니티월드(펫투어)</li>			</ul>			<ul class="swiper-slide" data-swiper-slide-index="6" style="width: 175px; margin-right: 10px;">				<li><img src="/uploadfiles/edt_upload/20190710171156_157388.png"></li>				<li>기전동물매개치료연구소</li>			</ul>			<ul class="swiper-slide" data-swiper-slide-index="7" style="width: 175px; margin-right: 10px;">				<li><img src="/uploadfiles/edt_upload/20190710101916_752655.png"></li>				<li>펫페스티벌</li>			</ul>			<ul class="swiper-slide" data-swiper-slide-index="8" style="width: 175px; margin-right: 10px;">				<li><img src="/uploadfiles/edt_upload/20190710101938_679699.png"></li>				<li>원광대학교</li>			</ul>			<ul class="swiper-slide" data-swiper-slide-index="9" style="width: 175px; margin-right: 10px;">				<li><img src="/uploadfiles/edt_upload/20190710102002_272945.png"></li>				<li>충청일보</li>			</ul>			<ul class="swiper-slide swiper-slide-prev" data-swiper-slide-index="10" style="width: 175px; margin-right: 10px;">				<li><img src="/uploadfiles/edt_upload/20190710102024_425739.png"></li>				<li>기전대학 애완동물관리과</li>			</ul>			<ul class="swiper-slide swiper-slide-active" data-swiper-slide-index="11" style="width: 175px; margin-right: 10px;">				<li><img src="/uploadfiles/edt_upload/20190710105903_180654.png"></li>				<li>펫더맨</li>			</ul>			<ul class="swiper-slide swiper-slide-next" data-swiper-slide-index="12" style="width: 175px; margin-right: 10px;">				<li><img src="/uploadfiles/edt_upload/20190710105938_561564.png"></li>				<li>청목회</li>			</ul>			<ul class="swiper-slide" data-swiper-slide-index="13" style="width: 175px; margin-right: 10px;">				<li><img src="/uploadfiles/edt_upload/20190710110559_483036.png"></li>				<li>(주)휴먼펫 -아이미스홈</li>			</ul>			<ul class="swiper-slide" data-swiper-slide-index="14" style="width: 175px; margin-right: 10px;">				<li><img src="/uploadfiles/edt_upload/20190710151944_788213.png"></li>				<li>(유)지암</li>			</ul>			<ul class="swiper-slide" data-swiper-slide-index="15" style="width: 175px; margin-right: 10px;">				<li><img src="/uploadfiles/edt_upload/20190710171842_750833.png"></li>				<li>마한애견훈련학교</li>			</ul>			<ul class="swiper-slide" data-swiper-slide-index="16" style="width: 175px; margin-right: 10px;">				<li><img src="/uploadfiles/edt_upload/20190710173916_692835.png"></li>				<li>M.I.T KOREA생명공학</li>			</ul>			<ul class="swiper-slide" data-swiper-slide-index="17" style="width: 175px; margin-right: 10px;">				<li><img src="/uploadfiles/edt_upload/20190710174245_430046.png"></li>				<li>SR바이오(주)</li>			</ul>			<ul class="swiper-slide" data-swiper-slide-index="18" style="width: 175px; margin-right: 10px;">				<li><img src="/uploadfiles/edt_upload/20190710174721_787514.png"></li>				<li>CAB국회방송</li>			</ul>			<ul class="swiper-slide" data-swiper-slide-index="19" style="width: 175px; margin-right: 10px;">				<li><img src="/uploadfiles/edt_upload/20190710174830_387244.png"></li>				<li>LAKE관광호텔</li>			</ul>			<ul class="swiper-slide" data-swiper-slide-index="20" style="width: 175px; margin-right: 10px;">				<li><img src="/uploadfiles/edt_upload/20190710175325_636138.png"></li>				<li>한국동물매개치료심리학회</li>			</ul>			<ul class="swiper-slide" data-swiper-slide-index="21" style="width: 175px; margin-right: 10px;">				<li><img src="/uploadfiles/edt_upload/20190710180212_644948.png"></li>				<li>무상사</li>			</ul>			<ul class="swiper-slide" data-swiper-slide-index="22" style="width: 175px; margin-right: 10px;">				<li><img src="/uploadfiles/edt_upload/20190710180737_382280.png"></li>				<li>반려동물생산자비상대책위원회</li>			</ul>			<ul class="swiper-slide" data-swiper-slide-index="23" style="width: 175px; margin-right: 10px;">				<li><img src="/uploadfiles/edt_upload/20180713104751_167730.png"></li>				<li>한국유전자정보연구원</li>			</ul>			<ul class="swiper-slide" data-swiper-slide-index="24" style="width: 175px; margin-right: 10px;">				<li><img src="/uploadfiles/edt_upload/20180104103422_969315.jpg"></li>				<li>한국케이블방송기술인연합회</li>			</ul>			<ul class="swiper-slide" data-swiper-slide-index="25" style="width: 175px; margin-right: 10px;">				<li><img src="/uploadfiles/edt_upload/20180104103838_538017.jpg"></li>				<li>(주)아리온 (펫 파크사업)</li>			</ul>			<ul class="swiper-slide" data-swiper-slide-index="26" style="width: 175px; margin-right: 10px;">				<li><img src="/uploadfiles/edt_upload/20180104104059_015599.jpg"></li>				<li>한국동물병원협회 인증마크 협약</li>			</ul>			<ul class="swiper-slide" data-swiper-slide-index="27" style="width: 175px; margin-right: 10px;">				<li><img src="/uploadfiles/edt_upload/20180104121650_038746.jpg"></li>				<li>코리아 경찰견 훈련소 (애견 훈련)</li>			</ul>			<ul class="swiper-slide" data-swiper-slide-index="28" style="width: 175px; margin-right: 10px;">				<li><img src="/uploadfiles/edt_upload/20180104170441_635374.jpg"></li>				<li>이리온 김포 동물병원</li>			</ul>			<ul class="swiper-slide" data-swiper-slide-index="29" style="width: 175px; margin-right: 10px;">				<li><img src="/uploadfiles/edt_upload/20180104170733_019100.jpg"></li>				<li>충현동물병원</li>			</ul>			<ul class="swiper-slide" data-swiper-slide-index="30" style="width: 175px; margin-right: 10px;">				<li><img src="/uploadfiles/edt_upload/20181226162435_639023.png"></li>				<li>전국예능인노동조합연맹</li>			</ul>			<ul class="swiper-slide" data-swiper-slide-index="31" style="width: 175px; margin-right: 10px;">				<li><img src="/uploadfiles/edt_upload/20171229094739_541937.png"></li>				<li>한국 유전자 정보 연구원</li>			</ul>			<ul class="swiper-slide" data-swiper-slide-index="32" style="width: 175px; margin-right: 10px;">				<li><img src="/uploadfiles/edt_upload/20171229095239_497384.png"></li>				<li>한국 동물 병원 협회</li>			</ul>			<ul class="swiper-slide" data-swiper-slide-index="33" style="width: 175px; margin-right: 10px;">				<li><img src="/uploadfiles/edt_upload/20170523140823_696448.png"></li>				<li>충현동물종합병원</li>			</ul>			<ul class="swiper-slide" data-swiper-slide-index="34" style="width: 175px; margin-right: 10px;">				<li><img src="/uploadfiles/edt_upload/20170523141058_883665.png"></li>				<li>이리온 동물병원 김포점</li>			</ul>			<ul class="swiper-slide" data-swiper-slide-index="35" style="width: 175px; margin-right: 10px;">				<li><img src="/uploadfiles/edt_upload/20181220180131_845345.png"></li>				<li>고려동물병원</li>			</ul><ul class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="0" style="width: 175px; margin-right: 10px;">				<li><img src="/uploadfiles/edt_upload/20190711092908_149607.png"></li>				<li>코리아경찰견학교</li>			</ul><ul class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="1" style="width: 175px; margin-right: 10px;">				<li><img src="/uploadfiles/edt_upload/20190711100327_907346.png"></li>				<li>군산도그랜드</li>			</ul><ul class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="2" style="width: 175px; margin-right: 10px;">				<li><img src="/uploadfiles/edt_upload/20190710095838_003460.png"></li>				<li>야호펫</li>			</ul><ul class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="3" style="width: 175px; margin-right: 10px;">				<li><img src="/uploadfiles/edt_upload/20190710095912_224971.png"></li>				<li>아이헤븐</li>			</ul><ul class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="4" style="width: 175px; margin-right: 10px;">				<li><img src="/uploadfiles/edt_upload/20190710101646_105391.png"></li>				<li>휴벳</li>			</ul><ul class="swiper-slide swiper-slide-duplicate" data-swiper-slide-index="5" style="width: 175px; margin-right: 10px;">				<li><img src="/uploadfiles/edt_upload/20190710101751_010540.png"></li>				<li>커뮤니티월드(펫투어)</li>			</ul></div>
<!-- 				<div class="swiper-button-next"></div>
				<div class="swiper-button-prev"></div> -->
			</div>
			<!-- partner 리스트 -->
		</div>
		<!-- //partner-wrap : End -->				<!-- customer-wrap :  Start -->
		<div class="customer-wrap">
			<ul class="column-left">
				<li class="column-title">종합상담센터<span><a href="/customer/helpdesk_list.php"><img src="/images/global/btn_more01.png" alt=""></a></span></li>
				<li class="column-normal column-mt">도그코리아 밀착 상담</li>
				<li class="column-bold">도그코리아 회원이라면 누구나</li>
				<li class="column-orange"><a href="/customer/helpdesk_list.php">1:1문의하기</a></li>
			</ul>
			<ul class="column-middle">
				<li class="column-title">공지사항<span><a href="/customer/notice_list.php"><img src="/images/global/btn_more01.png" alt=""></a></span></li>
				<!-- 공지사항 리스트 -->
							<li class="column-bold column-mt"><a href="/customer/notice_view.php?seq_no=45&amp;page=1">도그코리아 반려견 건강을 위한 본격시동 </a></li>				<li class="column-small"><a href="/customer/notice_view.php?seq_no=45&amp;page=1">도그코리아는 반려견의 건강을 위해 본격적인 시동... </a></li>				<li class="column-bold column-mt"><a href="/customer/notice_view.php?seq_no=44&amp;page=1">차에 태울 땐 이렇게 하세요 </a></li>				<li class="column-small"><a href="/customer/notice_view.php?seq_no=44&amp;page=1">차에 태울 땐 이렇게 하세요r&nbsp;&nbsp;회원수 19... </a></li></ul>
			<ul class="column-right">
				<li class="column-title">고객만족센터<span><img src="/images/global/btn_more01.png" alt=""></span></li>
				<li class="column-img"><img src="/images/global/bg_customer_tel.png" alt=""></li>
			</ul>
		</div>
		<!-- //customer-wrap : End -->		<!-- footer :  Start -->
		<div class="footer">
			<div class="footer-menu">
				<ul>
					<li><a href="/membership/person.php">개인정보처리방침</a></li>
					<li><a href="/membership/yak.php">이용약관</a></li>
					<li><a href="/pet_sub/com05.php">오시는길</a></li>
					<li><a href="/pet_client/login.php" title="병원/ DNA 거래처 로그인 하세요">거래처로그인</a></li>
				</ul>
			</div>
			<div class="footer-wrap">
				<h3><img src="/images/global/logo_footer.png" alt=""></h3>
				<ul class="address">
					<li>(주)도그코리아   /   주소: 서울시 구로구 디지털로32길 30 1409호 (코오롱디지털 타워 빌란트1차)</li>
					<li>사업자등록번호 : 759-86-00182 / 통신판매업 : 제2016-서울구로-0754호</li>
					<li>대표번호 : 1599-6331/ 02-2103-2422   /   팩스 : 02-2103-2423</li>
				</ul>
			</div>
		</div>
		<!-- //footer : End -->
<input type="hidden" name="ss_mb_no" value="">
<input type="hidden" name="ss_mb_code" value="">
	<iframe name="process" id="process" frameborder="1" width="100%" height="400" style="display:none;"></iframe>

<!-- 기간연장하기 시작 -->
<!-- 기간연장하기 끝 -->

<!-- // 팝업 영역 시작-->
		<!--DNA 검사-->
		<div class="popup dna-check">
			<ul class="popup-title">
				<li id="title-dna-check">DNA 신청의뢰</li>
				<li class="closed-box"><a href="#" data-method="dna-check"><img src="/images/membership/btn_popup_closed.png" alt=""></a></li>
			</ul>
			<div class="popup-content">

				<form name="form-dna-check" id="form-dna-check" method="post">
					<input type="hidden" name="save_type" id="save_type" value="INSERT">
					<input type="hidden" name="pt_no" id="pt_no" value="">
					<input type="hidden" name="pet_kind" id="pet_kind" value="">
					<input type="hidden" name="collect_nm" id="collect_nm" value="">
					<!-- skm 2019.04.19추가-->
					<input type="hidden" name="hospital_nm" id="hospital_nm" value="지사/지점에서 직접입력시만 입력하세요">
					<input type="hidden" name="doctor_nm" id="doctor_nm" value="지사/지점 담당자이름을 직접 입력하세요">
					<table cellspacing="0" cellpadding="0">
						<colgroup>
							<col width="25%">
							<col width="*">
						</colgroup>
						<tbody><tr>
							<th>펫명</th>
							<td><input type="text" name="pet_name" id="pet_name" value="" readonly="readonly"><span id="btn-pet-search">찾기</span></td>
						</tr>
						<tr>
							<th>주소</th>
							<td>
								<input type="text" name="result_zipcode" id="result_zipcode" value="" readonly="readonly"><span id="btn-zipcode">우편번호찾기</span>
								<input type="text" name="result_addr1" id="result_addr1" value="" class="check95" readonly="readonly">
								<input type="text" name="result_addr2" id="result_addr2" value="" class="check95"><br>
								<span class="input-text-des">* 나머지 주소를 입력해 주세요.</span>
							</td>
						</tr>
						<tr>
							<th>비고사항</th>
							<td>
								<textarea name="req_conts" id="req_conts" rowspan="4"></textarea>
							</td>
						</tr>
						<tr>
							<th>결과서수령</th>
							<td>
								<select name="result_gn" id="result_gn">
									<option value="0">직접수령</option>
									<option value="1">우편</option>
									<option value="2">팩스</option>
									<option value="3">이메일</option>
								</select>
							</td>
						</tr>
						<tr id="result-tr">
							<th id="result-title"></th>
							<td>
								<span id="result-fax">
									<input type="text" name="result_fax" id="result_fax" class="check95">
								</span>
								<span id="result-email">
									<input id="result_email1" name="result_email1" maxlength="50" type="text" value="" class="check120">
									<span>@</span>
									<input id="result_email2" name="result_email2" maxlength="50" type="text" value="" class="check120">
									<select name="email_domain">
										<option value="">직접입력</option>
										<option value="hotmail.com">hotmail.com</option>
										<option value="msn.com">msn.com</option>
										<option value="naver.com">naver.com</option>
										<option value="yahoo.co.kr">yahoo.co.kr</option>
										<option value="empal.com">empal.com</option>
										<option value="lycos.co.kr">lycos.co.kr</option>
										<option value="nate.com">nate.com</option>
										<option value="orgio.net">orgio.net</option>
										<option value="korea.com">korea.com</option>
										<option value="dreamwiz.com">dreamwiz.com</option>
										<option value="netian.com">netian.com</option>
										<option value="hanmir.com">hanmir.com</option>
										<option value="chol.com">chol.com</option>
										<option value="freechal.com">freechal.com</option>
										<option value="gmail.com">gmail.com</option>
										<option value="hanafos.com">hanafos.com</option>
										<option value="hitel.com">hitel.com</option>
										<option value="paran.com">paran.com</option>
										<option value="yahoo.com">yahoo.com</option>
										<option value="daum.net">daum.net</option>
										<option value="daum.net">hanmail.net</option>
									</select>
								</span>
							</td>
						</tr>
						<tr>
							<th>검사방법</th>
							<td>
								<input type="radio" name="inspection" id="inspection1" value="1"> <label for="inspection1">DNA검사(100,000원)</label>&nbsp;&nbsp;
								<input type="radio" name="inspection" id="inspection2" value="2"> <label for="inspection2">유전병 + DNA검사(210,000원)</label>
							</td>
						</tr>
						<tr>
							<th>결제금액</th>
							<td><font id="dnaAmount">0</font> 원</td>
						</tr>
						<tr>
							<th>결제방식</th>
							<td>
								<input type="radio" name="pay_type" value="1" id="dna_pay_type1"> <label for="dna_pay_type1">신용카드</label>&nbsp;&nbsp;
								<input type="radio" name="pay_type" value="2" id="dna_pay_type2"> <label for="dna_pay_type2">무통장</label>&nbsp;&nbsp;
								<input type="radio" name="pay_type" value="4" id="dna_pay_type3"> <label for="dna_pay_type3">핸드폰</label>
							</td>
						</tr>
						<tr id="pay-tr">
							<th>무통장정보</th>
							<td>
								<ul>
									<li>입금은행</li>
									<li>
										<select name="dnaOsBank" id="dnaOsBank">
											<option value="">은행선택</option>
										</select>
									</li>
								</ul>
								<ul class="pay-ul">
									<li>계좌번호</li>
									<li id="dna_account_no"></li>
								</ul>
								<ul class="pay-ul">
									<li>예금주</li>
									<li id="dna_depositor"></li>
								</ul>
							</td>
						</tr>
					</tbody></table>
					<p style="font-size:13px;color:red;margin-top:5px;">*국민카드, 하나KEB(구 외환카드 포함) 카드는 결제가 되지 않습니다.</p>
					<ul class="btn-dna-check-input">
						<li><button>의뢰하기</button></li>
					</ul>
				</form>

			</div>
			<ul class="popup-bottom">
				<li class="closed-box"><a href="#" data-method="dna-check"><span>닫기</span></a></li>
			</ul>
		</div>
		<!--DNA 검사-->
		<!--나의펫 찾기-->
		<div class="popup my-pet-search">
			<ul class="popup-title">
				<li id="title-my-pet-search">펫 부모 찾기</li>
				<li class="closed-box"><a href="#" data-method="my-pet-search"><img src="/images/membership/btn_popup_closed.png" alt=""></a></li>
			</ul>
			<div class="popup-content">

				<div class="my-pet-search-find-box">
					<form name="frmSearch" id="frmSearch" method="post">
						<input type="text" name="my_pet_search" id="my_pet_search" value="">
						<span>검색</span>
					</form>
				</div>
				<div class="my-pet-search-find-list">
					<table id="my-pet-search-datalist" cellspacing="0" cellpadding="0">
						<colgroup>
							<col width="10%">
							<col width="20%">
							<col width="*">
							<col width="20%">
						</colgroup>
						<thead>
							<tr>
								<th>선택</th>
								<th>사진</th>
								<th>펫종류</th>
								<th>펫명</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
				<div class="page-paging" aria-label="Page navigation">
					<ul class="pagination" id="pagination_my_pet"></ul>
				</div>
				<ul class="btn-my-pet-search-find">
					<li><button>선택</button></li>
				</ul>
			</div>
			<ul class="popup-bottom">
				<li class="closed-box"><a href="#" data-method="my-pet-search"><span>닫기</span></a></li>
			</ul>
		</div>
		<!--나의펫 찾기-->
<!-- // 팝업 영역 끝-->


<!-- DNA 결제를 위한 폼 -->
<form name="dnaPayform" accept-charset="euc-kr">
<!-- 결제 결과의 REDIRPATH 페이지 전송을 위한 parameter 시작 (수정하지 말것) -->
<input type="hidden" name="ReplyCode" value="">
<input type="hidden" name="ReplyMessage" value="">
<input type="hidden" name="CcCode" value="">
<input type="hidden" name="Installment" value="">
<!-- 결제 결과의 REDIRPATH 페이지 전송을 위한 parameter 끝 -->

<!-- *MxID -->
<input type="hidden" name="MxID" id="MxID" size="30" value="160728025566">
<input type="hidden" name="MxIssueNO" id="MxIssueNO" size="30" value="191105000011954">
<!-- *MxIssueDate -->
<input type="hidden" name="MxIssueDate" id="MxIssueDate" size="30" value="20191105141954">
<!-- *Amount -->
<input type="hidden" name="Amount" id="Amount" size="30" value="">
<!-- *Currency -->
<input type="hidden" name="Currency" id="Currency" size="30" value="KRW">
<!-- *CcMode -->
<input type="hidden" name="CcMode" id="CcMode" size="30" value="11">
<!-- *Smode -->
<input type="hidden" name="Smode" id="Smode" size="30" value="3001">
<!-- *CcProdDesc -->
<input type="hidden" name="CcProdDesc" id="CcProdDesc" size="30" value="DNA검사의뢰비">
<!-- *CcNameOnCard -->
<input type="hidden" name="CcNameOnCard" id="CcNameOnCard" size="30" value="">
<!-- *MSTR -->
<input type="hidden" name="MSTR" id="MSTR" size="50" value="MSTR_TEST">
<!-- MSTR2* -->
<input type="hidden" name="MSTR2" id="MSTR2" size="50" value="MSTR2_TEST">
<!-- *connectionType -->
<input type="hidden" name="connectionType" id="connectionType" size="30" value="http">
<!-- *URL -->
<input type="hidden" name="URL" id="URL" size="30" value="www.petworldkorea.com">
<!-- *DBPATH -->
<input type="hidden" name="DBPATH" id="DBPATH" size="30" value="/payment/dnadbpath.php">
<!-- *REDIRPATH -->
<input type="hidden" name="REDIRPATH" id="REDIRPATH" size="30" value="/payment/dnapayment_result.php">
<!-- dlpType -->
<input type="hidden" name="dlpType" id="dlpType" size="30" value="">
<!-- Userid -->
<input type="hidden" name="Userid" id="Userid" size="30" value="">
<!-- AutoRedirCall -->
<input type="hidden" name="AutoRedirCall" id="AutoRedirCall" size="30" value="">
<!-- signType -->
<input type="hidden" name="signType" id="signType" size="30" value="">
<!-- Install -->
<input type="hidden" name="Install" id="Install" size="30" value="">
<!-- email -->
<input type="hidden" name="email" id="email" size="30" value="">
<!-- BillType -->
<input type="hidden" name="BillType" id="BillType" size="30" value="">
<!-- InstallType -->
<input type="hidden" name="InstallType" id="InstallType" size="30" value="">
<!-- PAN -->
<input type="hidden" name="PAN" id="PAN" size="30" value="">
<!-- PhoneNO -->
<input type="hidden" name="PhoneNO" id="PhoneNO" size="30" value="">

<!-- <input type="button" value="결제하기" onclick="reqPayment();"> -->

</form>

<form name="frmDnaPay" id="frmDnaPay" mehtod="post" target="process" action="" accept-charset="utf-8">
	<input type="hidden" name="pay_no" id="pay_no" size="30" value="191105000011954">
	<input type="hidden" name="h_pay_kind" id="h_pay_kind">
	<input type="hidden" name="h_pay_type" id="h_pay_type" value="B">
	<input type="hidden" name="h_pay_amt" id="h_pay_amt" value="">
	<input type="hidden" name="h_bank_nm" id="h_bank_nm">
	<input type="hidden" name="h_sa_no" id="h_sa_no">
	<input type="hidden" name="h_seq_no" id="h_seq_no">
	<input type="hidden" name="h_return_url" id="h_return_url">
	<!-- 문자메세지 내용 추가 2017.02.10 -->
	<input type="hidden" name="h_inspection" id="h_inspection">
	<input type="hidden" name="h_pet_nm" id="">
	<!-- skm 2019.04.18 -->
	<input type="hidden" name="h_pet_no" id="">
</form>
<!--
<form name="dnaPayForm" accept-charset="euc-kr">
	<input type="hidden" name="CASH_GB" id="CASH_GB" size="30" value="">
	<input type=hidden maxlength=20  name=Recordkey   value="도그코리아">
	<input type="hidden" name="Userid" id="Userid" size="30" value="">
	<input type="hidden" name="Okurl" id="Okurl" size="50" value="http://www.petworldkorea.com/payment/dnapayment_result_hp.php">
	<input type="hidden" name="MC_SVCID" id="MC_SVCID" size="30" value="">
	<input type="hidden" name="Prdtnm" id="Prdtnm" size="30" value="DNA검사의뢰비">
	<input type="hidden" name="Prdtprice" id="Prdtprice" size="30" value="">
	<input type="hidden" name="Siteurl" id="Siteurl" size="30" value="petworldkorea">
	<input type="hidden" name="PAY_MODE" id="PAY_MODE" size="30" value="10">
	<input type="hidden" name="Tradeid" id="Tradeid" size="50" value="191105000011954">
	<input type="hidden" name="LOGO_YN" id="LOGO_YN" size="30" value="N">
	<input type="hidden" name="CALL_TYPE" id="CALL_TYPE" size="30" value="P">
	<input type="hidden" name="Notiurl" id="Notiurl" size="50" value="http://www.petworldkorea.com/payment/dnadbpath_hp.php">
	<input type="hidden" name="MSTR" id="MSTRHP" size="50" class="MSTR" value="MSTR_TEST">
</form>
-->
<form name="dnaPayForm" accept-charset="euc-kr">
	<input type="hidden" name="CASH_GB" id="CASH_GB" size="30" value="CN">
	<input type="hidden" name="CN_SVCID" id="CN_SVCID" size="30" value="190517071952">
	<input type="hidden" name="PAY_MODE" id="PAY_MODE" size="30" value="10">
	<input type="hidden" name="VER" id="VER" size="10" value="ALL_NEW">
	<input type="hidden" name="Prdtprice" id="Prdtprice" size="30" value="">
	<input type="hidden" name="Prdtnm" id="Prdtnm" size="30" value="DNA검사의뢰비">
	<input type="hidden" name="Tradeid" id="Tradeid" size="50" value="191105000011954">
	<input type="hidden" name="Siteurl" id="Siteurl" size="30" value="petworldkorea">
	<input type="hidden" name="Okurl" id="Okurl" size="50" value="http://www.petworldkorea.com/payment/dnapayment_result_hp.php">
	<input type="hidden" name="Notiurl" id="Notiurl" size="50" value="http://www.petworldkorea.com/payment/dnadbpath_hp.php">
	<input type="hidden" name="CALL_TYPE" id="CALL_TYPE" size="30" value="P">
	<input type="hidden" name="Userid" id="Userid" size="30" value="">
	<input type="hidden" name="MSTR" id="MSTRHP" size="50" class="MSTR" value="MSTR_TEST">
	<!-- 선택사항-->
	<input type="hidden" name="Cryptyn" id="Cryptyn" size="1" value="">
	<input type="hidden" name="Closeurl" id="Closeurl" value="">
	<input type="hidden" name="CN_BILLTYPE" id="CN_BILLTYPE" value="">
	<input type="hidden" name="tax" id="CN_TAX" value="">
	<input type="hidden" name="CN_TAXFREE" id="CN_TAXFREE" value="">
	<input type="hidden" name="CN_FREEINTEREST" id="CN_FREEINTEREST" value="">
	<input type="hidden" name="CN_POINT" id="CN_POINT" value="">
	<input type="hidden" name="Termregno" id="Termregno" value="">
	<input type="hidden" name="APP_SCHEME" id="APP_SCHEME" value="">
	<input type="hidden" name="CN_FIXCARDCD" id="CN_FIXCARDCD" value="">
	<input type="hidden" name="CN_DIRECT" id="CN_DIRECT" value="">
	<input type="hidden" name="CN_INSTALL" id="CN_INSTALL" value="">
</form>	</div>
	<!-- wrap :  End -->
	<input type="hidden" name="mb_no" value="">
<script src="/js/site/common.bottom.js"></script>


</body></html>