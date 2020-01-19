<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><!-- jstl core 쓸때 태그에 c 로 표시. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jstl fmt 쓸때 위와 같음.
fmt : formatter 형식 맞춰서 표시 -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>

<style>

.contentWrap {
	width: 100%;
	border-top: 1px solid #ebebeb;
}

.contentWrap .innerSec {
	margin: 0 auto;
	width: 985px;
}

.h4 {
	margin-top: 30px;
	padding: 0 0 12px;
	border-bottom: 1px solid #333;
	font-size: 24px;
	line-height: 24px;
}

.memberJoin .infoForm .caption h5 {
	float: left;
	letter-spacing: -1px;
	height: 30px;
	font-size: 20px;
	color: #242424;
}

.nameform {
	color: #6b6b6b;
	padding-left: 10px;
	background: #f3f4f8;
	align: left;
	border: 2px solid #dedee0;
	text-align: center;
}

.boxform {
	padding: 8px;
	bgcolor: #ffffff;
	align: left;
}

.memberJoin .infoForm .caption p {
	float: right;
	padding-top: 30px;
	letter-spacing: -1px;
	font-size: 13px;
	color: #999;
}

.memberJoin .infoForm {
	margin: 0 auto;
	width: 850px;
}

.memberJoin .infoForm .caption {
	margin-top: 55px;
	width: 100%;
	overflow: hidden;
	border-bottom: 2px solid #cdcdcd;
}

.infoWrite {
	padding: 30px;
	border: 1px soid #e4e4e4;
	background: #f7f7f7;
}

.memberJoin .infoWrite table {
	width: 100%;
}

.memberJoin .infoWrite th {
	padding-left: 24px;
	text-align: left;
	font-size: 15px;
}

.memberJoin .infoWrite td, .memberJoin .infoWrite th {
	padding: 20px 0 20px;
	
}

.memberJoin .infoWrite input[type=password], .memberJoin .infoWrite input[type=text],
	.memberJoin .infoWrite select {
	box-sizing: border-box;
	height: 36px;
	width:40%;
}

.my_line {
	border: 2px solid #dedee0;
}

.btnwrap {
	width: 100%;
	text-align: right;
}

.id-btn {
	width: 180px;
	height: 40px;
	line-height: 40px;
	border: 1px #3399dd solid;
	margin: 15px auto;
	background-color: #f7f7f7;
	text-align: center;
	font-size: 18px;
	cursor: pointer;
	color: #333;
}

.btnwrap a {
	width: 180px;
	height: 40px;
	line-height: 40px;
	border: 1px #3399dd solid;
	text-decoration: none;
	margin: 15px auto;
	background-color: #f7f7f7;
	text-align: center;
	font-size: 18px;
	cursor: pointer;
	color: #333;
	padding: 0px 6px;
	display: inline-block;
}

.a:hover {
	color: #fff;
}

.btnwrap a:hover {
	box-shadow: 200px 0 0 0 rgba(0, 0, 0, 0.5) inset;
}

.id-btn:hover {
	color: #fff;
}

.hover:hover {
	box-shadow: 200px 0 0 0 rgba(0, 0, 0, 0.5) inset;
}

.form-cont{
	padding: .375rem .75rem;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #495057;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #ced4da;
    border-radius: .25rem;
    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
}
</style>

<%@ include file="includes/header.jsp"%>
<br><br><br>
<article id="article">
	<form action="/signup/signup.do" name="signup" method="post">
		

		<div class="contentWrap">
			<div class="memberJoin">
				<div class="infoForm">
					<div class="caption">
						<h5>회원가입</h5>
						<p>※ 입력하신 정보는 아이디 또는 본인인증,비밀번호 찾기시 사용되므로 정확히 입력해주시기 바랍니다.</p>
					</div>

					<div class="infoWrite">
						<table width="100%" cellspacing="0" cellpadding="0"
							style="border-collapse: collapse;">


							<!-- 아이디 -->
							<tbody>
								<tr>
									<td class="nameform"><label for="user_id">아이디</label></td>
									<td style="padding: 8px;" bgcolor="#ffffff" align="left"
										class="my_line"><input type="text" class="form-cont"
										id="id" name="id" placeholder="ID" required>
										<div class="check_font" id="id_check"></div></td>
								</tr>
								<!-- 비밀번호 -->
								<tr>
									<td class="nameform"><label for="user_pw">비밀번호</label></td>
									<td style="padding: 8px;" bgcolor="#ffffff" align="left"
										class="my_line"><input type="password"
										class="form-cont" id="pass" name="pass"
										placeholder="PASSWORD" required>
										<div class="check_font" id="pw_check"></div></td>
								</tr>
								<!-- 이름 -->
								<tr>
									<td class="nameform"><label for="user_name">이름</label></td>
									<td style="padding: 8px;" bgcolor="#ffffff" align="left"
										class="my_line"><input type="text" class="form-cont"
										id="name" name="name" placeholder="Name" required>
										<div class="check_font" id="name_check"></div></td>
								</tr>
								<!-- 본인확인 이메일 -->
								<tr>
									<td class="nameform"><label for="user_email">이메일</label></td>
									<td style="padding: 8px;" bgcolor="#ffffff" align="left"
										class="my_line"><input type="text" class="form-cont"
										name="useremail" id="useremail" placeholder="E-mail" required>
										<div class="check_font" id="email_check"></div>
								</tr>
								<!-- 휴대전화 -->
								<tr>
									<td class="nameform"><label for="user_phone">휴대전화</label></td>
									<td style="padding: 8px;" bgcolor="#ffffff" align="left"
										class="my_line"><input type="text" class="form-cont"
										id="phonenum" name="phonenum" placeholder="Phone Number"
										required>
										<div class="check_font" id="phone_check"></div>('-' 없이 번호만 입력해주세요)</td>
								</tr>
								<tr>
									<td class="nameform"><label for="jooso">주소입력</label></td>
									<td style="padding: 8px;" bgcolor="#ffffff" align="left"
										class="my_line"><input class="form-cont" type="text" id="uoop" name="uoop"
										placeholder="우편번호"> <input type="button"
										onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
										<input type="text" class="form-cont" id="doro" name="doro"
										placeholder="도로명주소"> <input type="text"
										class="form-cont" id="jibun" name="jibun"
										placeholder="지번주소"> <span id="guide"
										style="color: #999"></span>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="btnwrap">
						<a class="a hover" href="${pageContext.request.contextPath}"
							aria-hidden="true">글초기화 </a>
						<button class="id-btn hover" id="reg_submit" name="reg_submit"
							type="submit">가입하기</button>
					</div>

				</div>
			</div>
		</div>
		<input type="hidden" name="${_csrf.parameterName }"
			value="${_csrf.token }" />
	</form>
</article>




<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<!-- <script>
	$(document).ready(function() {
		var operForm = $("#operForm");

		$("button[data-oper='rkdlq']").on("click", function(e) {
			operForm.attr("action", "/newmember").submit();
		});

		/* 폼에서 어떤 버튼이 눌렸는지 확인하여
		액션을 변경하거나, 일부 값을 삭제하여 전송.*/
	});
</script> -->






<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 
                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
 
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }
 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('uoop').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('doro').value = fullRoadAddr;
                document.getElementById('jibun').value = data.jibunAddress;
 
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
 
                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
 
                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
</script>



<script>
// 아이디 유효성 검사(1 = 중복 / 0 != 중복)
	
	
	$("#id").blur(function() {
		// id = "id_reg" / name = "userId"
		var id = $('#id').val();
		
		$.ajax({
			url : '/member.do',
			data: {id:id} ,
			type : 'get',
			datatype:'text',
			success : function(data) {
				console.log(data);
				console.log("1 = 중복o / 0 = 중복x : "+ data);							
	
				if (data == 1) {
						// 1 : 아이디가 중복되는 문구
						$("#id_check").text("사용중인 아이디입니다");
						$("#id_check").css("color", "red");
						$("#reg_submit").attr("disabled", true);
					} else {
						
						if(id.length < 13&& id.length > 3){
							// 0 : 아이디 길이 / 문자열 검사
							$("#id_check").text("");
							$("#reg_submit").attr("disabled", false);
				
						} else if(id == ""){
							
							$('#id_check').text('아이디를 입력해주세요');
							$('#id_check').css('color', 'red');
							$("#reg_submit").attr("disabled", true);				
							
						} else {
							
							$('#id_check').text("아이디는 소문자와 숫자 4~12자리만 가능합니다");
							$('#id_check').css('color', 'red');
							$("#reg_submit").attr("disabled", true);
						}
						
					}
				}, error : function() {
						console.log("실패");
				}
			});
		});
</script>

</body>

