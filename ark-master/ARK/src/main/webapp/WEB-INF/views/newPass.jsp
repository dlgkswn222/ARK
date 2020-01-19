<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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

.find-account-title {
	margin: 0 0 10px;
	font-size: 30px;
	text-align: center;
}

.find-password-notice {
	list-style: none;
	margin: 0 0 20px;
	padding: 0;
	text-align: center;
}

.find-password-notice li {
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

.find-password-table {
	border-top: 2px solid #969696;
	border-collapse: collapse;
	width: 428px;
	margin: 10px auto 7px;
	padding: 27px 0 30px 0;
	color: #111;
}

.find-password-table th {
	background-color: #eef1f8;
	text-align: left;
	white-space: nowrap;
	width: 100px;
	padding: 14px 30px;
	border-bottom: 1px solid #ddd;
}

.find-password-table td {
	border-left: 1px solid #ddd;
	padding: 14px 30px;
	border-bottom: 1px solid #ddd;
}

.find-password-name-tf {
	width: 200px;
	height: 22px;
	padding: 2px 5px;
	line-height: 22px;
	border: 1px solid #ccc;
	vertical-align: middle;
}

.find-passwor-btn {
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
	margin-top: 10px;
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
						class="list-page-location_icon sprite-idpwfind">&gt;</span><span>비밀번호
							찾기</span></li>
				</ul>
				<div id="box-tab-idpwfind" class="box-tab-idpwfind uxetabs">
					<ul class="box-tab-idpwfind_navigation">
						<li class="box-tab-idpwfind_navigation-item"><a
							class="box-tab-idpwfind_navigation-link" href="/id">아이디 찾기</a></li>

						<li class="box-tab-idpwfind_navigation-item"><a
							class="box-tab-idpwfind_navigation-link" href="/newPass">비밀번호
								찾기</a></li>
					</ul>
					<ul class="find-password-notice">
						<li>비밀번호의 경우 암호화 저장되어 분실 시 찾아드릴 수 없는 정보 입니다. <br> 본인 확인을
							통해 비밀번호를 재설정 하실 수 있습니다.
						</li>
					</ul>

					<form action="/newPass" method="post">
						<table class="find-password-table">
							<tr>
								<th scope="row">회원님의 아이디를 적어주세요</th>
								<td><input class="find-password-name-tf" type="text"
									name="id" class="id"></td>
							</tr>
							<tr>
								<th scope="row">회원님의 이메일을 적어주세요</th>
								<td><input class="find-password-name-tf" type="text"
									name="email" class="email"></td>
							</tr>
						</table>
						<div class="find-password-foot">
							<button class="find-passwor-btn" type="submit">
							비밀번호 찾기
							</button>
						</div>
						<input type="hidden" name="${_csrf.parameterName }"
									value="${_csrf.token }" />
					</form>
				</div>
			</section>
			
			<script>
			var csrfHeaderName = "${_csrf.headerName}";
			var csrfTokenValue = "${_csrf.token}";
			
			
			$(document).on("click", ".find-passwor-btn", function(e) {
				e.preventDefault();
				var id=$("input[name='id']").val();
				var email=$("input[name='email']").val();
				$.ajax({
					type : 'POST',
					url : '/newPass',
					data :{id:id,
						email:email},
					beforeSend: function(xhr){
					xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);	
					},success : function() {
						alert("임시비밀번호를 이메일로 보냈습니다^^");
						location.href ="/";
						},
					// 실패시
					error : function() {
						/* alert("이메일혹은 아이디를 확인하세요"); */
						alert("임시 비밀번호를 이메일로 보냈습니다^^");
						location.href ="/";
					}
				});
			});
			
			</script>
			
		</div>
	</article>
</div>
<%@ include file="includes/footer2.jsp"%>