<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><!-- jstl core 쓸때 태그에 c 로 표시. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<style>
div.member-container {
	padding: 100px;
	background-color: #fff;
	text-align: center;
	position: relative;
	width: 976px;
	margin: 0 auto;
}

.find-account-tab li {
	float: left;
	margin-left: -1px;
}

.find-id-notice li {
	display: block;
	text-align: center;
	line-height: 40px;
	overflow: hidden;
	font-size: 16px;
	font-weight: normal;
	border-bottom: 1px solid #dedede;
	color: #777;
	background: #fff8ce;
}

.find-id-notice li {
	position: relative;
	padding-left: 20px;
}

.find-id-table {
	border-top: 2px solid #969696;
	border-collapse: collapse;
	text-align: center;
}

.find-id-tableid {
	border-top: 2px solid #969696;
	border-collapse: collapse;
	text-align: center;
}

.find-id-table th {
	background-color: #eef1f8;
	text-align: left;
	white-space: nowrap;
	width: 40%;
	padding: 14px 30px;
	border-bottom: 1px solid #ddd;
}

.find-id-tableid th {
	background-color: #eef1f8;
	text-align: left;
	white-space: nowrap;
	width: 44.4%;
	padding: 14px 30px;
	border-bottom: 1px solid #ddd;
}

.find-id-table td {
	border-left: 1px solid #ddd;
	padding: 14px 0px;
	border-bottom: 1px solid #ddd;
	text-align: center;
}

.find-id-tableid td {
	border-left: 1px solid #ddd;
	padding: 14px 0px;
	border-bottom: 1px solid #ddd;
	text-align: center;
}

.find-id-name-tf {
	width: 200px;
	height: 30px;
	padding: 2px 5px;
	line-height: 22px;
	border: 1px solid #ccc;
	vertical-align: middle;
}

.find-id-btn {
	border-color: #0085da;
	color: #fff;
	background-color: #0c97e7;
	background-image: -webkit-linear-gradient(#41bef9, #0c97e7, #007ed0);
	background-image: linear-gradient(#41bef9, #0c97e7, #007ed0);
	box-shadow: inset 0 0 2px #fff;
	border-radius: 4px;
	font-size: 15px;
	line-height: 24px;
	text-shadow: -1px -1px 0 rgba(0, 0, 0, 0.4);
}

.xans-member {
	width: 428px;
	margin: 10px auto 7px;
	padding: 27px 0 30px 0;
	color: #111;
}

.list-page-location {
	padding-top: 12px;
	position: relative;
	text-align: initial;
}

.box-tab-idpwfind_navigation {
	display: block;
	width: 100%;
	overflow: hidden;
}

.box-tab-idpwfind {
	width: 598px;
	margin: 70px auto 0;
	padding: 0;
	box-shadow: 0 4px 10px 0 rgba(0, 0, 0, 0.2), 0 4px 20px 0 rgba(0, 0, 0, 0.19);
}

.box-tab-idpwfind_navigation-item--active {
	border-bottom: none;
}

.box-tab-idpwfind_navigation-item--active .box-tab-idpwfind_navigation-link
	{
	border-bottom: 2px solid #067dfd;
	font-weight: bold;
	color: #067dfd;
}

.box-tab-idpwfind_navigation {
	display: block;
	width: 100%;
	overflow: hidden;
}

.box-tab-idpwfind_navigation-item {
	position: relative;
	display: block;
	float: left;
	width: 50%;
	background: #fff;
}

.box-tab-idpwfind_navigation-item .box-tab-idpwfind_navigation-link {
	position: relative;
	display: block;
	line-height: 73px;
	height: 73px;
	border-bottom: 1px solid #fff;
	text-align: center;
	font-size: 20px;
	font-weight: normal;
	color: #777;
}

.box-tab-idpwfind_navigation-link:hover {
	text-decoration: none;
}

.box-tab-idpwfind_navigation li:first-child:after {
	content: '';
	display: block;
	width: 1px;
	height: 27px;
	position: absolute;
	z-index: 2;
	left: 299px;
	top: 24px;
	background: #e5e5e5;
}

a:link, a:visited, a:active {
	color: #676767;
	text-decoration: none;
}
</style>

<%@ include file="includes/header.jsp"%>

<div class="page">
	<article id="article">

		<div class="member-container">
			<section class="find-account-content">
				<ul class="list-page-location">
					<li><a href="/">홈</a><span
						class="list-page-location_icon sprite-idpwfind">&gt;</span><a
						href="/customLogin">로그인</a><span
						class="list-page-location_icon sprite-idpwfind">&gt;</span><span>아이디
							찾기</span></li>
				</ul>
				<div id="box-tab-idpwfind" class="box-tab-idpwfind uxetabs">
					<ul class="box-tab-idpwfind_navigation">
						<li class="box-tab-idpwfind_navigation-item"><a
							class="box-tab-idpwfind_navigation-link" href="/id">아이디 찾기ㅋ</a></li>

						<li class="box-tab-idpwfind_navigation-item"><a
							class="box-tab-idpwfind_navigation-link" href="/newPass">비밀번호
								찾기</a></li>
					</ul>
					<ul class="find-id-notice">
						<li>아이디가 생각나지 않으세요?<br> 이메일 입력 하신 후 확인 버튼을 클릭해주세요.
						</li>
					</ul>
					<script>
						$(document)
								.ready(
										function() {
											$(".move")
													.on(
															"click",
															function(e) {
																var actionForm = $("#actionForm");
																e
																		.preventDefault();
																actionForm
																		.append("<input type='hidden' name='id' "
																				+ "value='"
																				+ $(
																						this)
																						.attr(
																								"href")
																				+ "'>");
																actionForm
																		.attr(
																				"action",
																				"/newPass");
																actionForm
																		.submit();
															});
										});
					</script>
					<div class="xans-member">
						<form action="/id" method="post">
							<table class="find-id-table">
								<tr>
									<th scope="row">이메일</th>
									<td><input class="find-id-name-tf" type="text" id="email"
										name="email">
										<button class="find-id-btn" type="submit">
											<input type="hidden" name="${_csrf.parameterName }"
												value="${_csrf.token }" /> 확인
										</button></td>
								</tr>
							</table>
						</form>
						<form id="actionForm" action="/newPass" method="GET">
							<table class="find-id-tableid">
								<tr>
									<th scope="row">아이디</th>
									<c:forEach items="${id}" var="list">
									<td>
									<input class="find-id-name-tf" value="${list.id}"
										class="id" name="id"><br>
									
										</td>
										</c:forEach>
							</table>
						</form>
					</div>
				</div>
			</section>

		</div>
	</article>
</div>

<%@ include file="includes/footer2.jsp"%>
