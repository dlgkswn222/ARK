<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
		<meta charset="utf-8" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta http-equiv="Expires" content="-1" />
	<meta http-equiv="Pragma" content="no-cache" />
	<meta http-equiv="Cache-Control" content="No-Cache" />
	<meta name="format-detection" content="telephone=no" />
	<meta name="Author-Date" content="2017-05-25" />
	<meta name="Description" content="반려 동물의 DNA실명제를 통한 펫혈통 관리로 유기견 없는 나라 대한민국을 만드는 반려동물 실명제 프로젝트를 시작하는 회사입니다." />
	<meta name="keyword" content="도그코리아, 반려동물, DNA검사, DNA실명제, 혈통관리, 펫펼통, 유기견, 실명제" />
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
	<link href="/css/jquery-ui.css" rel="stylesheet">
	<link href="/css/swiper.min.css" rel="stylesheet" media="screen">
	<link href="/css/style.css" rel="stylesheet" media="screen">
	<link href="/css/font-awesome.min.css" rel="stylesheet">
	<script src="/js/site/common.top.js"></script>
	<script src="/js/common.js?v=1"></script>
	<link rel="shortcut icon" href="/favicon.ico">
	<script src="/js/home_toggle.js"></script>	<script src="/js/lib/jquery.number.min.js"></script>
</head>
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