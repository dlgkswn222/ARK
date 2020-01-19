<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>

<html>
<head>
<title>A R K</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<link
	href='http://fonts.googleapis.com/css?family=Roboto+Condensed:700italic,400,300,700'
	rel='stylesheet' type='text/css'>
<!--[if lte IE 8]><script src="js/html5shiv.js"></script><![endif]-->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>

<script src="/resources/ckeditor/ckeditor.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"
	integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU="
	crossorigin="anonymous">
	
</script>
<script src="/resources/vendor1/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="/resources/vendor1/jquery-easing/jquery.easing.min.js"></script>

<!-- Page level plugin JavaScript-->
<script src="/resources/vendor1/chart.js/Chart.min.js"></script>
<script src="/resources/vendor1/datatables/jquery.dataTables.js"></script>
<script src="/resources/vendor1/datatables/dataTables.bootstrap4.js"></script>

<!-- Custom scripts for all pages-->
<script src="/resources/js1/sb-admin.min.js"></script>




<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/skel-noscript.css" />
<link rel="stylesheet" href="/resources/css/style.css" />
<link rel="stylesheet" href="/resources/css/style2.css" />
<link rel="stylesheet" href="/resources/css/style-desktop.css" />
<link rel="stylesheet" href="/resources/css/fullpage.css" />


<!--[if lte IE 8]><link rel="stylesheet" href="css/ie/v8.css" /><![endif]-->
<!--[if lte IE 9]><link rel="stylesheet" href="css/ie/v9.css" /><![endif]-->
</head>
<body class="homepage">

	<!-- Header -->


	<div class="ark-container">

		<!-- Logo -->

		<div id="header" class=" js-ussr-component">
			<div id="desktop_layout-header" class="section_header">
				<div class="box_category-all">
					<div class="box_usermenu">
						<ul class="list_usermenu">
							<sec:authorize access="isAnonymous()">
								<li class="list-item"><a href="/customLogin"
									class="link_usermenu">로그인</a></li>

								<li class="list-item"><a href="/id" class="link_usermenu">아이디
										/ 비밀번호 찾기</a></li>

								<li class="list-item"><a href="/board/faq"
									class="link_usermenu">고객센터</a></li>
							</sec:authorize>



							<sec:authorize access="isAuthenticated()">
								<li class="list-item"><a class="link_usermenu"
									href="/member/mypage?id='<sec:authentication property="principal.username"/>'"><sec:authentication
											property="principal.username" />님 찡끗</a></li>
								<li class="list-item"><a href="/customLogout"
									class="Logout">로그아웃</a>

									<form id="actionForm" action="/customLogout" method="post">

										<input type="hidden" name="out" value=""> <input
											type="hidden" name="${_csrf.parameterName }"
											value="${_csrf.token }" />
									</form> <script>
										var actionForm = $("#actionForm");
										$(".Logout").on("click",function(e) {
											e.preventDefault();
											// 기본 이벤트 동작을 막고,
											console.log("click");
											// 웹 브라우저 검사 창에 클릭을 표시
											actionForm.find("input[name='out']").val($(this).attr("href"));
															// 액션폼 인풋태그에 페이지넘 값을 찾아서,
															// href로 받은 값으로 대체함.
															actionForm.submit();
														});
									</script></li>
								<li class="list-item"><a href="/shop/cartList"
									class="link_usermenu">장바구니</a></li>
								<li class="list-item"><a href="/shop/orderList"
									class="link_usermenu">주문확인</a></li>
									<li class="list-item">
								<a href="/review/list" class="link_usermenu">고객상품후기</a></li>
							</sec:authorize>
							<sec:authorize access="hasRole('ROLE_ADMIN')">
								<li class="list-item"><a href="/admin"
									class="link_usermenu">관리자페이지</a></li>
							</sec:authorize>
						</ul>
						<div id="hd_wrapper">
							<nav id="gnbArea" style="height: 150px;">
								<div class="box_title-logo">
									<a href="/"><img src='/resources/images/logo.gif'
										width="240" height="113" class="image_logo"></a>
								</div>

								<ul>
									<li class="active"><a href="#"> 아이템</a>
										<ul class="hidden-menu">


											<li class="menu-top"><a href="/shop/list?c=1200&l=1">곤충류</a>
											</li>
											<li class="menu-top"><a href="/shop/list?c=1100&l=1">양서류</a>
											</li>
											<li class="menu-top"><a href="/shop/list?c=1000&l=1">절지류</a>
											</li>
											<li class="menu-top"><a href="/shop/list?c=900&l=1">조류</a>
											</li>
											<li class="menu-top"><a href="/shop/list?c=800&l=1">파충류</a>
											</li>
											<li class="menu-top"><a href="/shop/list?c=700&l=1">포유류</a>
											</li>

										</ul></li>
									<!-- 카테고리 값 전달 필요 	-->
									<li class="active"><a href="#"> 품종</a>
										<ul class="hidden-menu">
											<li class="menu-top"><a href="/shop/list?c=100&l=1">곤충류</a>
												<ul class="menu-top">
													<li><a href="/shop/list?c=101&l=2">사슴벌레</a></li>
													<li><a href="/shop/list?c=102&l=2">유충</a></li>
													<li><a href="/shop/list?c=103&l=2">풍뎅이</a></li>
												</ul></li>

											<li class="menu-top"><a href="/shop/list?c=200&l=1">양서류</a>
												<ul class="menu-top">
													<li><a href="/shop/list?c=201&l=2">개구리&두꺼비</a></li>
													<li><a href="/shop/list?c=202&l=2">도롱뇽</a></li>

												</ul></li>

											<li class="menu-top"><a href="/shop/list?c=300&l=1">절지류</a>
												<ul class="menu-top">
													<li><a href="/shop/list?c=301&l=2">밀리패드&센티패드</a></li>
													<li><a href="/shop/list?c=302&l=2">전갈</a></li>
													<li><a href="/shop/list?c=303&l=2">타란튤라(거미)</a></li>

												</ul></li>
											<li class="menu-top"><a href="/shop/list?c=400&l=1">조류</a>
												<ul class="menu-top">
													<li><a href="/shop/list?c=401&l=2">앵무새</a></li>

												</ul></li>


											<li class="menu-top"><a href="/shop/list?c=500&l=1">파충류</a>
												<ul class="menu-top">
													<li><a href="/shop/list?c=501&l=2">도마뱀&이구아나</a></li>
													<li><a href="/shop/list?c=502&l=2">뱀</a></li>
													<li><a href="/shop/list?c=503&l=2">수생거북</a></li>
													<li><a href="/shop/list?c=504&l=2">육지거북</a></li>

												</ul></li>
											<li class="menu-top"><a href="/shop/list?c=600&l=1">포유류</a>
												<ul class="menu-top">
													<li><a href="/shop/list?c=601&l=2">고슴도치</a></li>
													<li><a href="/shop/list?c=602&l=2">햄스터</a></li>

												</ul></li>

										</ul></li>
									<li class="active"><a href="/notice/list">공지사항</a></li>
									<li class="active"><a href="/review/list">커뮤니티</a></li>
								</ul>
							</nav>


							<%-- <div class="header-menu">
			
					<ul><sec:authorize access="isAnonymous()">
					<li><a href="/customLogin">로그인</a></li>
					
					<li><a href="/id">아이디 찾기</a></li>
					</sec:authorize>
					
					
				
					
					<li><sec:authorize access="isAuthenticated()">
					<li><a href="/member/mypage?id='<sec:authentication property="principal.username"/>'"><sec:authentication property="principal.username"/>님 찡끗</a></li>
					<li><a href="/customLogout">로그아웃</a></li>
					<li><a href="/shop/cartList">장바구니</a></li>
					<li><a href="/shop/orderList">주문확인</a></li>
					
					</sec:authorize></li>
					<li>
					
					
					
					
					<sec:authorize access="hasRole('ROLE_ADMIN')">
					<li><a href="/admin">관리자페이지</a></li>
					</sec:authorize>
					
					
					<li><a href="#">고객센터</a></li>
					
					</ul>
					
				</div> --%>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<!-- Header -->
<script>
	/* 상품 구매 페이지 list 이동  */
	$(document).ready(function(e) {

		var menuChoice = $(".menu-top li > a")

		menuChoice.on("click", function(e) {
			var cateb = $(this).find("input[name='cateb']").val();
			var cates = $(this).find("input[name='cates']").val();

			console.log(cateb);
			console.log(cates);

			self.location = "/product/productList?catecode=" + catecode;
		});
	});
</script>