<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><!-- jstl core 쓸때 태그에 c 로 표시. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jstl fmt 쓸때 위와 같음.
fmt : formatter 형식 맞춰서 표시 -->


<style>
.loginbox {
	width: 50%;
	height: 280px;
	margin: 30px;
	padding: 50px 50px;
	box-sizing: content-box;
	background: rgba(0,0,0,.8);
	box-shadow: 0 15px 25px rgba(0,0,0,.5);
	transform: translate(40%,40%);
	
}

.loginbox h1 {
	width: 100%;
	height: 40px;
	font-size: 35px;
	color: #ff9900;
	border-bottom: 1px solid #ff9900;
	padding-left: 40%;
	box-sizing: border-box;
	background-repeat: no-repeat;
	background-position: 3px 5px;
	margin-bottom: 30px;
}

.loginbox h2 {
	color: #ff9900;
}

#loginid, #loginpw {
	width: 30%;
	border: 1px solid #ff9900;
	box-sizing: border-box;
}

.labelid {
	font-size: 20px;
	color: #ff9900;
	margin-left: 30%;
	margin-right: 29px;
}

.labelpw {
	font-size: 20px;
	color: #ff9900;
	margin-left: 30%;
	margin-right: 8px;
}

.chk {
	box-sizing: border-box;
}

.chk label {
	font-size: 18px;
	color: #ff9900;
	position: static;
	top: -3px;
}

.search {
	width: 100%;
	height: 40px;
	border-bottom: 1px dashed #ff9900;
	box-sizing: border-box;
	line-height: 40px;
	text-align: center;
	margin-bottom: 20px;
}

.search span {
	font-size: 17px;
	color: #999;
}

.search a {
	font-size: 17px;
	text-decoration: none;
	background-color: #333;
	color: #fff;
	padding: 3px 5px;
	border-radius: 3px;
	margin-left: 5px;
}

.btnwrap {
	width: 100%;
	text-align: center;
}

.btnwrap label {
	position: absolute;
	left: -999em;
}

.btnwrap a {
	width: 129px;
	height: 35px;
	background-color: #999;
	text-decoration: none;
	display: inline-block;
	border-radius: 3px;
	color: #fff;
	font-size: 14px;
	font-weight: bold;
	line-height: 35px;
}

#loginbtn {
	width: 129px;
	height: 35px;
	border: none;
	background-color: #ff9900;
	border-radius: 3px;
	color: #fff;
	font-size: 14px;
	font-weight: bold;
	position: relative;
}

#loginbtn:hover {
	color: rgba(0, 0, 0, 0.5);
}

#idchk {
	width: 10px;
	height: 10px;
	margin-left: 59%;
}
</style>



<%@ include file="includes/header.jsp"%>


<div class="page">
	<article id="article">
		<div class="loginbox">

			<h1>로그인 처리</h1>
			<h2>${error}</h2>
			<h2>${logout }</h2>

			<form method="post" action="/login">

				<label for="loginid" class="labelid">아이디</label>
				<input type="text"
					id="loginid" name="username" placeholder="id"><br>
				<label
					for="loginid" class="labelpw">패스워드</label>
				<input type="password"
					id="loginpw" name="password" placeholder="pass">


				<div class="chk">
					<input type="checkbox" id="idchk" name="remember-me"><label
						for="idchk" class="text">자동로그인</label>
				</div>

				<div class="search">
					<span class="text"> 아이디 / 비밀번호를 잊으셧나요?</span> <a href="/id">아이디 / 비밀번호
						찾기</a> <input type="hidden" name="${_csrf.parameterName }"
						value="${_csrf.token }" />
				</div>


				<div class="btnwrap">
					<a href="/member">회원가입</a>
					
					<input type="submit" id="loginbtn" value="login">
						<label for="loginbtn">로그인버튼</label>
				</div>
			</form>
		</div>

		<!-- <div class="col-md-3 col-sm-3 col-xs-6"> 
<a href="/login" class="btn btn-sm animated-button victoria-two">Login</a>
 </div>
 -->
	</article>
</div>






