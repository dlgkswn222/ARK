<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="includes/header.jsp"%>

<style>
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

.list-page-location {
	padding-top: 12px;
	position: relative;
	text-align: initial;
}

div.member-container {
	background-color: #fff;
	text-align: center;
	position: relative;
	width: 976px;
	margin: 0 auto;
}

.find--table {
	outline-style: auto;
	border-collapse: collapse;
	width: 428px;
	margin: 10px auto 7px;
	padding: 27px 0 30px 0;
	color: #111;
	margin-top: 30px;
	margin-bottom: 30px;
}

.find--table th {
	background-color: #eef1f8;
	text-align: left;
	white-space: nowrap;
	width: 100px;
	padding: 14px 30px;
	border-bottom: 1px solid #ddd;
}

.find--table td {
	border-left: 1px solid #ddd;
	padding: 14px 30px;
	border-bottom: 1px solid #ddd;
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
	box-shadow: 0 4px 10px 0 rgba(0, 0, 0, 0.2), 0 4px 20px 0
		rgba(0, 0, 0, 0.19);
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
	display: block;
	float: left;
	width: 100%;
	background: #fff8ce;
}

.box-tab-idpwfind_navigation-item .box-tab-idpwfind_navigation-link {
	position: relative;
	display: block;
	line-height: 73px;
	height: 73px;
	border-bottom: 2px solid #000000;
	text-align: center;
	font-size: xx-large;
	font-weight: normal;
	color: #777;
	font-weight: 900;
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

.find--notice li {
	display: block;
	text-align: center;
	line-height: 40px;
	overflow: hidden;
	font-size: 25px;
	border-bottom: 2px solid #000000;
	color: #777;
	background: #fff8ce;
	font-weight: 900;
}

.find--name-tf {
	width: -webkit-fill-available;
	height: 30px;
	padding: 2px 5px;
	line-height: 22px;
	border: 1px solid #ccc;
	vertical-align: middle;
}

.main--btn, .outmember {
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


.outform p{
	margin-top: 20px;
	font-weight: 600;

}
</style>

<div class="sub_top_ban"></div>

<div class="member-container">
	<input type="hidden" name="${_csrf.parameterName }"
		value="${_csrf.token }" />

	<div id="box-tab-idpwfind" class="box-tab-idpwfind uxetabs">
		<ul class="box-tab-idpwfind_navigation">
			<li class="box-tab-idpwfind_navigation-item"><a
				class="box-tab-idpwfind_navigation-link">회원 탈퇴</a>
		</ul>
		<ul class="find--notice">
			<li>회원을 탈퇴하시겠습니까</li>
		</ul>

		<script src="https://code.jquery.com/jquery-3.3.1.js"
			integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
			crossorigin="anonymous"></script>


		<script>
			$(document).on("click", ".outmember", function(e) {
				e.preventDefault();
				var result = confirm("회원 탈퇴를 진행하시겠습니까?");
				if (result) {
					$(".outform").submit();
				} else {
					alert("회원탈퇴 취소합니다^^");
				}
			});
		</script>

		<form method="post" class="outform">

			<input type="hidden" name="${_csrf.parameterName }"
				value="${_csrf.token }" />

			<table class="find--table">
				<tr>
					<th scope="row">아이디</th>
					<td><input class="find--name-tf" type="text" id="id" name="id"
						value="<sec:authentication property="principal.username"/>" /></td>
				</tr>

				<tr>
					<th scope="row">패스워드</th>
					<td><input class="find--name-tf" type="password" id="pass"
						name="pass" /></td>
					<c:if test="${ko eq 1 }">
						<p>비밀번호를 확인해주세요</p>
					</c:if>
				</tr>
			</table>
			<div class="card-header py-3" align="right">
				<button class="outmember" type="submit"  name="remember-me">회원
					탈퇴</button>
				<button class="main--btn">
					<a href="/">처음으로</a>
				</button>
			</div>
		</form>
	</div>
</div>


<%@ include file="includes/footer2.jsp"%>
