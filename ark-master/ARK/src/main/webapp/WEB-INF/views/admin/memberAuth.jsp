<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
   prefix="sec"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><!-- jstl core 쓸때 태그에 c 로 표시. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
 
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
            <script
              src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"
              integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU="
              crossorigin="anonymous">
 </script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<!-- 

다음 api 기능
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
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

 -->
 <style>
 button {
    width:200px;
    background-color: #f8585b;
    border: none;
    color:#fff;
    padding: 15px 0;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    margin: 5px;
    cursor: pointer;
    border-radius:10px;
	white-space: nowrap;
}

.w3-container, .w3-panel {
    padding: 0.01em 16px;
    padding-bottom: 60px;
}

 </style>
 
 
 
<title>회원등급변경(ADMIN)</title>
</head>
<body>
	<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<div class="w3-center w3-large w3-margin-top">
				<h3>회원등급변경</h3>
			</div>
			<div>
					<script>
$(document).ready(function(){
	$("#file").click(function(){
		$("#gdsImg").click() ;
		})			
	})

</script>
					
					
						<div class="inputArea">
 	 <label for="gdsImg">이미지</label>
 <input style="display: none;" type="file" id="gdsImg" name="file"/>


 <div class="select_img">
  
  
  <img id="file" name="file" width="150px" height="150px"  src="/resources/images/upload${list.userimg }"/>
  
  
 </div>
 

 
 <script>
 $("#gdsImg").change(function(){
   if(this.files && this.files[0]) {
    var reader = new FileReader;
    reader.onload = function(data) {
     $(".select_img img").attr("src", data.target.result);        
    }
    reader.readAsDataURL(this.files[0]);
   }
  });

 </script>

</div>
					
					<p>
						<label>ID</label> 
						<input class="w3-input" type="text" id="id" name="id" readonly value="${list.id }" > 
					</p>
					<p>
						<label>Email</label> 
						<input class="w3-input" type="text" id="email" name="email" readonly value="${list.useremail }" > 
					</p>
					<br/>
					
					<p>
						<label>이름</label>
						<input class="w3-input"  name="name" id="name" type="text" readonly value="${list.name }" >
					</p>
						<p>
						<label>전화번호</label>
						<input class="w3-input"  name="phonenum" id="phonenum" type="text" readonly value="${list.phonenum }" >
						
					</p>
					<div class="form-group">
			<label for="jooso">주소입력</label><br/>
	우편번호<input type="text" id="uoop" name="uoop" value="${list.uoop }">
	도로명주소<input type="text" class="form-control"  id="doro" name="doro" value="${list.doro }">
	지번<input type="text" class="form-control"  id="jibun" name="jibun"  value="${list.jibun }">
	<span id="guide" style="color:#999"></span>
			</div>
					<input type="hidden"
name="${_csrf.parameterName }"
value="${_csrf.token }"/>
	<form method="POST" action="/admin/memberAuth" class="deliveryForm">			
<input type="hidden" name="userid" class="userid" value="${list.id }">
<input type="hidden" name="auth" class="auth" value="" />
<input type="hidden"
name="${_csrf.parameterName }"
value="${_csrf.token }"/>
</form>		
		
				
		<c:if test="${list.authList[0].auth != 'ROLE_ADMIN' }">
					<p class="w3-center">
	
	<c:choose>
	<c:when test="${list.authList[0].auth eq 'ROLE_USER' }">			
	<button type="submit" id="joinBtn" class="joinBtn1">매니저등급으로</button>
	</c:when>
	<c:otherwise>
	<button type="submit" id="joinBtn" class="joinBtn2">일반유저등급으로</button>
	</c:otherwise>				
	</c:choose>			
					</p>
					
		</c:if>			
			</div>

  <script>
   $(".joinBtn1").click(function(){
    $(".auth").val("ROLE_MANAGER");
    run();
    alert("등급을 매니저로 올렸습니다");
   });
   
   $(".joinBtn2").click(function(){
    $(".auth").val("ROLE_USER");
    run();
    alert("등급을 유저로 내렸습니다");
   });
   
   function run(){  
    $(".deliveryForm").submit();
   }
  
  </script>

			
				
				
			
			
				
				
				


		</div>
	</div>
</body>




</html>