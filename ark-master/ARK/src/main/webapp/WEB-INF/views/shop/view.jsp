<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://www.springframework.org/security/tags"
   prefix="sec"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../includes/header.jsp" %>

<script>

/* 좋아요 */
function like_func(){
	
  var gdsNum = ${view.gdsNum}
  //var mno = $('#mno', frm_read).val();
  //console.log("boardno, mno : " + boardno +","+ mno);
  
  $.ajax({
    url: "/shop/liketo/like.do",
    type: "GET",
    cache: false,
    dataType: "json",
    data: {boardno:gdsNum},
    success: function(data) {
      var msg = '';
      var like_img = '';
      msg += data.msg;
      alert(msg);
      
      if(data.like_check == 0){
        like_img = "/resources/images/h2.jpg";
      } else {
        like_img = "/resources/images/h1.jpg";
      }      
      $('#like_img').attr('src', like_img);
      $('#like_cnt').html(data.like_cnt);
      $('#like_check').html(data.like_check);
    	location.reload();
    },
    error: function(request, status, error){
      alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    }
  });
}

</script>
<script> //덧글보여주는 친구 
function replyList(){
var gdsNum = ${view.gdsNum};

var a = true;
var b= false;
 $.getJSON("/shop/view/replyList" + "?n=" + gdsNum, function(data){
  var str = "";
  
  $(data).each(function(){
   
   console.log(data);
   
   var repDate = new Date(this.repDate);
   repDate = repDate.toLocaleDateString("ko-US")
   
   str += "<li data-gdsNum='" + this.gdsNum + "'>"
     + "<div class='userInfo'>"
     + "<span class='userId'>" + this.userId + "님 덧글</span>"
     + "<span class='date'>" + repDate + "</span>"
     + "</div>"
     + "<div class='replyContent'>" + this.repCon + "</div>"
 
     + "<div class='replyFooter'>"
   
     + "<button type='button' class='modify' data-repNum='" + this.repNum + "'>수정</button>"
     + "<button type='button' id='delete' name='delete' class='delete' data-repNum='" + this.repNum + "'>삭제</button>"
  
     + "</div>"
     
     + "</li>";           
  });
  
  $("section.replyList ol").html(str);
 });
};
</script>


<script>
function doInit() {

	<c:set value="${ searchDate.strDay}" var = "strDay"/>      //서버에서 받은값

	   <c:set value="${ searchDate.endDay}" var = "endDay"/>  //서버에서 받은값

	var endDay       = today();                                       //스크립트에서 처리한값

	var strDay       = beforeDay();                                         //스크립트에서 처리한값

	    $('#searchDay1').val(strDay); 

	    $('#searchDay2').val(endDay);

	    <c:if test="${serachStrDate != ''}">                              

	     $('#reg_dttm1').val(<c:out value="${serachStrDate}"/>);

	    </c:if>

	    <c:if test="${serachEndDate != ''}">

	        $('#reg_dttm2').val(<c:out value="${serachStrDate}"/>);

	    </c:if>

	}

</script>

<style>
#contai {
	display: table;
	table-layout: fixed;
	position: relative;
	width: 1000px;
	min-height: 100%;
	margin: 0 auto;
}

#container>#content {
	display: table-cell;
	width: 100%;
	padding: 0 0 100px;
	vertical-align: top;
}
</style>

<style>
.goods {
	padding: 30px 0 0;
}

div.image {
	position: relative;
	float: left;
	width: 400px;
}

.thumbnail {
	display: table-cell;
	width: 398px;
	height: 398px;
	border: 1px solid #d1d1d1;
	text-align: center;
	vertical-align: middle;
}

.info {
	float: right;
	width: 566px;
	position: relative;
}

.goods-header {
	position: relative;
}

.tit {
	float: left;
	width: 473px;
	font-size: 20px;
}

.item {
	padding: 30px 0 20px;
	border-bottom: 1px solid #e9e9e9;
}

.item ul li:first-child {
	display: block;
	border-top: 1px solid #707070;
	margin-top: 5px;
}

.item ul li>strong {
	display: table-cell;
	width: 80px;
	color: #555;
	vertical-align: top;
}

.item ul li.price>strong {
	vertical-align: middle;
}

.item ul li>div {
	display: table-cell;
	position: relative;
	width: 470px;
	vertical-align: middle;
}

.item ul li {
	display: table;
	padding: 20px 8px 0;
}

.order-goods {
	background: #f5f5f5;
	border-top: none;
	border-bottom: 2px solid #3e3d3c;
}

.order-goods .check {
	display: table;
	padding: 13px 14px 13px 19px;
}

.order-goods .check .name {
	display: table-cell;
	width: 271px;
	padding: 0 10px 0 0;
	color: #555;
}

.order-goods .check .price .count {
	display: inline-block;
	vertical-align: middle;
}

.order-goods .check .price {
	display: table-cell;
	width: 210px;
	padding: 0 13px;
	text-align: right;
}

.order-goods .check .price .count span {
	float: left;
	margin: 0 0 0 -1px;
}

.count span button {
	display: block;
	width: 25px;
	height: 16px;
	text-indent: -9999px;
}

.up {
	background: url(/resources/images/count-up.png) no-repeat left top;
}

.down {
	margin: -1px 0 0;
	background: url(/resources/images/count-down.png) no-repeat left top;
}

.order-goods .check .price .count .numBox {
	float: left;
	width: 43px;
	height: 31px;
	border: 1px solid #ccc;
	color: #3f3f3f;
	line-height: 31px;
	text-align: center;
}

.ToCart_btn {
	display: inline;
	position: relative;
	text-align: center;
}

.addToCart_btn {
	width: 120px;
	height: 61px;
	line-height: 59px;
	font-weight: bold;
	color: #3e3d3c;
	font-size: large;
	background-color: rgba(251, 255, 0, 0.075);
}

.addToCart {
	width: 120px;
	height: 61px;
	line-height: 59px;
	font-weight: bold;
	color: #3e3d3c;
	font-size: large;
	background-color: rgba(255, 64, 64, 0.075);
}

/* 상품 정보 css */
.multiple-topics>div {
	padding: 100px 0 0;
}

.multiple-topics h3 {
	padding: 100px 0 17px;
	color: #000;
	font-size: 20px;
	border-bottom: 3px solid #e2e2e2;
}

.gdsDes {
	padding: 30px 0;
}

/* 상품 후기 css */
.top-reviews {
	overflow: hidden;
	padding: 34px 0 0;
}

.top-reviews .tit {
	float: left;
}

.top-reviews .btn {
	float: right;
	font-size: 0;
}

.top-reviews .btn .skinbtn {
	margin: 0 0 0 10px;
}

.skinbtn.point2.gv-reviewwrite {
	width: 151px;
	height: 40px;
	line-height: 38px;
}

.skinbtn.point2 {
	border: 1px solid #3e3d3c;
	color: #fff;
	font-weight: bold;
	font-size: large;
}

.u_cbox_write_box {
	position: relative;
}

.u_cbox_write_inner {
	position: relative;
	background-color: #fff;
	border: 1px solid #b3b3b3;
}

.u_vc {
	overflow: hidden;
	position: absolute;
	left: -9999px;
	width: 1px;
	height: 1px;
	font-size: 1px;
	color: transparent;
	line-height: 1px;
}

.u_cbox_inbox {
	position: relative;
	padding: 0 15px;
	background-color: #fff;
}

.reviews {
	padding: 400px 0 100px;
}

.btn_get_wrap {
	clear: both;
	padding: 20px 0 0 5px;
	text-align: right;
}

.u_cbox_text {
	display: block;
	overflow-x: hidden;
	overflow-y: auto;
	position: relative;
	z-index: 1;
	width: 100%;
	height: 56px;
	padding: 6px 0 0;
	margin: 0;
	padding-right: 16px;
	border: none;
	color: #333;
	background-color: transparent;
	background-color: rgba(255, 255, 255, .001);
	font-size: 20px;
	-webkit-appearance: none;
	vertical-align: top;
	resize: none;
	box-sizing: border-box;
}

.u_cbox .u_cbox_write:after {
	display: block;
	clear: both;
	content: '';
}

.u_cbox .u_cbox_info_base:after {
	display: block;
	clear: both;
	content: '';
}

.u_cbox {
	font-size: 12px;
	line-height: 4em;
}

.u_cbox_comment_box {
	position: relative;
	border-bottom: 1px solid #e2e2e2;
}

.u_cbox_area {
	padding: 15px 0;
}

.u_cbox_info {
	padding-bottom: 1px;
	font-size: 15px;
	font-weight: 900;
}

.u_cbox_text_wrap {
	overflow: hidden;
	font-size: 20px;
	line-height: 18px;
	word-break: break-all;
	word-wrap: break-word;
	padding: 10px 0 0 0;
}

.u_cbox_info_base {
	display: inline-block;
	position: relative;
	margin-bottom: 7px;
	padding: 10px 0 0 0;
	font-size: 15px;
}

.u_cbox_tool {
	float: right;
}

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

/*   슬라이드            */
.banner_wraper {
	display: block;
	overflow: hidden;
	height: 140px;
	position: relative;
	padding: 20px 0;
}

.banner_wraper img {
	width: 213px;
	height: 120px;
	padding: 0 7px 5px;
	vertical-align: top;
	line-height: 24px;
	position: absolute;
	word-break: break-all;
}

.xans-srlite-display {
	position: relative;
	width: 100%;
	padding: 11px 0 20px 0;
	border: 1px #000 solid;
	margin: 20px 0 60px;
}

.xans-srlite-display h3 {
padding: 0 0 10px 21px;
    font-size: xx-large;
    font-family: Arial, 돋움;
    color: #000;
    letter-spacing: 2px;
    border-bottom: 1px #000 solid;
    background-color: white;
    text-align: center;
    font-weight: 900;
}

.orderInfo .infoForm {
	margin: 0 auto;
	width: 850px;
}

.orderInfo {
	padding: 20px;
	display: none;
}

.orderInfo .inputArea {
	margin: 10px 0;
}

.orderInfo .inputArea label {
	display: inline-block;
	width: 120px;
	margin-right: 10px;
}

.orderInfo .inputArea input {
	font-size: 14px;
	padding: 5px;
}

.orderInfo .inputArea:last-child {
	margin-top: 30px;
}

.orderInfo .inputArea button {
	font-size: 20px;
	border: 2px solid #ccc;
	padding: 5px 10px;
	background: #fff;
	margin-right: 20px;
}

.btnwrap {
	width: 100%;
	text-align: right;
}

</style>

<c:set var="sum" value="0" />
<div class="sub_top_ban"></div>

<div id="contai">
	<div class="goods">
		<section id="content">

			<form role="form" method="post">
				<input type="hidden" name="gdsNum" value="${view.gdsNum}" />
			</form>

			<div class="image">
				<div class="thumbnail">
					<img src="/resources/images/upload${view.gdsImg}"
						style="left: 27px; top: 385px; height: 267px; width: 400px;">
				</div>

			</div>

			<div class="info">
				<div class="goods-header">
					<div class="tit">${view.gdsName}</div>
				</div>
				<div class="item">
					<ul>
						<li><strong>카테고리</strong>
							<div>${view.cateName}</div></li>

						<li class="price"><strong>가격 </strong>
							<div>
								<fmt:formatNumber pattern="###,###,###" value="${view.gdsPrice}" />
								원
							</div></li>

						<li><strong>재고</strong>
							<div>
								<fmt:formatNumber pattern="###,###,###" value="${view.gdsStock}" />
								EA
							</div></li>
					</ul>
				</div>
				<div class="order-goods">
					<div class="check">
						<c:if test="${view.gdsStock !=0 }">
							<p class="name">
								<strong>구입 수량</strong>
							</p>
							<div class="price">

								<span class="count"> <input type="number" class="numBox"
									min="1" max="${view.gdsStock}" value="1" readonly="readonly" />

									<span>
										<button type="button" class="up"></button>
										<button type="button" class="down"></button>
								</span>
								</span>
							</div>
						</c:if>
						<c:if test="${view.gdsStock ==0 }">
							<p>상품 수량이 부족합니다</p>
						</c:if>
					</div>
				</div>

 <!--좋아요 테스트2  -->
 <c:choose>
  <c:when test="${mno == 1}">
    <a href='javascript: like_func();'><img style="width:80px; height:80px;" src='/resources/images/h1.jpg' id='like_img' name='like_img'></a>
  </c:when>
  
  <c:otherwise>
    <a href='/customLogin'><img style="width:80px; height:80px;" src='/resources/images/h1.jpg'></a>
  </c:otherwise>
</c:choose>
<span>${view.like_cnt } </span>


 
 <script>
  $(".up").click(function(){
   var num = $(".numBox").val();
   var plusNum = Number(num) + 1;
   
   if(plusNum >= ${view.gdsStock}+1) {
    $(".numBox").val(num);
   } else {
    $(".numBox").val(plusNum);          
   }
  });
  
  $(".down").click(function(){
   var num = $(".numBox").val();
   var minusNum = Number(num) - 1;
   
   if(minusNum <= 0) {
    $(".numBox").val(num);
   } else {
    $(".numBox").val(minusNum);          
   }
  });
 </script>
				<div class="btn_get_wrap">
					<div class="btn_cart_wrap">
						<c:if test="${view.gdsStock != 0 }">
						<button type="button" class="addToCart_btn">
							<span>장바구니</span>
						</button>
						<button type="button" class="addToCart">
							<span>바로 구매</span>
						</button>
						</c:if>
						<c:if test="${view.gdsStock == 0 }">
						<span>재고 수량이 부족하여 준비중입니다</span>
						</c:if>
					</div>
				</div>
				<c:set var="sum"
					value="${sum + (view.gdsPrice * cartList.cartStock)}" />
	<!-- 			
	<script>
		$(".addToCart").click(function() {
			$(".orderInfo").slideDown();
			$(".orderOpne_bnt").slideUp();
		});
	</script>
	 -->
	
	
	
	
	
 	
<script>
  $(".addToCart").click(function(){
   var gdsNum = $("#gdsNum").val();
   var cartStock = $(".numBox").val();
   var csrfHeaderName = "${_csrf.headerName}";
   var csrfTokenValue = "${_csrf.token}";     
   var data = {
     gdsNum : gdsNum,
     cartStock : cartStock
     };
   
   $.ajax({
	   url : "/shop/view/addCart",
	   type : "post",
	   data : data,
	   beforeSend: function(xhr){xhr.setRequestHeader(
			   csrfHeaderName,
			   csrfTokenValue)},
	   success : function(result){
	    if(result == 1) {
	     alert("장바구니에서 옵션을 정해주세요");
	     $(".numBox").val("1");
	     location.href="/shop/cartList";
	    } else {
	     alert("회원만 사용할 수 있습니다.")
	     $(".numBox").val("1");
	     
	     location.href="/customLogin";
	    }
	   },
	   error : function(){
	    alert("구매 실패");
	   }
	  });
	 });
	</script>	
	
				
<script>
  $(".addToCart_btn").click(function(){
   var gdsNum = $("#gdsNum").val();
   var cartStock = $(".numBox").val();
   var csrfHeaderName = "${_csrf.headerName}";
   var csrfTokenValue = "${_csrf.token}";     
   var data = {
     gdsNum : gdsNum,
     cartStock : cartStock
     };
   
   $.ajax({
	   url : "/shop/view/addCart",
	   type : "post",
	   data : data,
	   beforeSend: function(xhr){xhr.setRequestHeader(
			   csrfHeaderName,
			   csrfTokenValue)},
	   success : function(result){
	    if(result == 1) {
	     alert("카트 담기 성공");
	     $(".numBox").val("1");
	    } else {
	     alert("회원만 사용할 수 있습니다.")
	     $(".numBox").val("1");
	     
	     location.href="/customLogin";
	    }
	   },
	   error : function(){
	    alert("카트 담기 실패");
	   }
	  });
	 });
	</script>
	
	
			</div>
		</section>
	</div>



<div class="orderInfo">
	<div class="infoForm">
		<div class="infoWrite">
			<form role="form" method="post" autocomplete="off"
				action="/shop/cartListPost">

				<input type="hidden" name="amount" value="${sum}" />

				<table width="100%" cellspacing="0" cellpadding="0"
					style="border-collapse: collapse;">
					<tbody>
						<tr>
							<td class="inputArea"><label for="">수령인</label></td>

							<td style="padding: 8px;" bgcolor="#ffffff" align="left"
								class="my_line"><input type="text" class="form-cont"
								name="orderRec" id="orderRec" required="required" /></td>
						</tr>
						<tr>
							<td class="inputArea"><label for="orderPhon">수령인 연락처</label></td>
							<td style="padding: 8px;" bgcolor="#ffffff" align="left"
								class="my_line"><input type="text" class="form-cont"
								name="orderPhon" id="orderPhon" required="required" /></td>
						</tr>
						<tr>
							<td class="inputArea"><label for="userAddr1">우편번호</label></td>
							<td style="padding: 8px;" bgcolor="#ffffff" align="left"
								class="my_line"><input type="text" class="form-cont"
								name="userAddr1" id="userAddr1" required="required" /> <input
								type="button" class="id-btn"
								onclick="sample4_execDaumPostcode()" value="우편번호 찾기"></td>
						</tr>
						<tr>
							<td class="inputArea"><label for="userAddr2">1차 주소</label></td>
							<td style="padding: 8px;" bgcolor="#ffffff" align="left"
								class="my_line"><input type="text" class="form-cont"
								name="userAddr2" id="userAddr2" required="required" /></td>
						</tr>
						<tr>
							<td class="inputArea"><label for="userAddr3">2차 주 소</label></td>
							<td style="padding: 8px;" bgcolor="#ffffff" align="left"
								class="my_line"><input type="text" class="form-cont"
								name="userAddr3" id="userAddr3" required="required" /></td>
						</tr>
						<tr>
							<td class="inputArea"><label for="userAddr4">상세주소 주소</label></td>
							<td style="padding: 8px;" bgcolor="#ffffff" align="left"
								class="my_line"><input type="text" class="form-cont"
								name="userAddr4" id="userAddr4" required="required" /></td>
						</tr>
						<input type="hidden" name="${_csrf.parameterName }"
							value="${_csrf.token }" />

					</tbody>
				</table>
				<div class="btnwrap">
					<button type="submit" class="order_btn">주문</button>
					<button type="button" class="cancel_btn">취소</button>
					<script>
						$(".cancel_btn").click(function() {
							$(".orderInfo").slideUp();
							$(".orderOpne_bnt").slideDown();
						});
					</script>

				</div>
			</form>
		</div>
	</div>
</div>






<!-- 추천리스트 빙글빙글 링크 -->
	<div class="srlite_container" style="padding: 450px 0 17px;">
		<div class="xans-element- xans-srlite xans-srlite-display">
			<h3>추천 리스트</h3>
			<div class="banner_wraper">
			
				<c:forEach items="${roll }" var="list">
				
				<a href="/shop/view?n=${list.gdsNum }">
				<img class="banner_wraper1" src="/resources/images/upload${list.gdsThumbImg }">
				</a>
				
				</c:forEach>
				
			</div>
		</div>
	</div>




	<!--~  ~~~~  ~~  ~~~~  ~   작업중 인곳~~~  ~~~~        ~~~~~~~~ -->

	<div class="multiple-topics">
		<div id="detail">
			<h3>상품상세정보</h3>
			<div class="gdsDes">${view.gdsDes}</div>
		</div>
	</div>

	<div id="reply" class="reviews">
		<!-- 로그인 여부  -->
		<sec:authorize access="isAnonymous()">
			<p>
				소감을 남기시려면 <a href="/customLogin">로그인</a>해주세요
			</p>
		</sec:authorize>

		<!-- 로그인이 되있다면 -->
		<sec:authorize access="isAuthenticated()">



			<section class="replyForm">
				<form role="form" method="post" autocomplete="off">

					<input type="hidden" id="gdsNum" name="gdsNum"
						value="${view.gdsNum}"> <input type="hidden" name="id"
						value="<sec:authentication property="principal.username"/>">


					<div class="top-reviews">
						<div class="tit">
							<h3>상품후기</h3>

						</div>

						<div class="btn">
							<a type="submit" id="reply_btn"
								class="skinbtn point2 gv-reviewwrite"> <em>상품후기 글쓰기</em></a>
						</div>
					</div>
					<div class="u_cbox_write_wrap">
						<div class="u_cbox_write_box u_cbox_type_logged_out">

							<fieldset>
								<div class="u_cbox_write">
									<div class="u_cbox_write_inner">
										<div class="u_cbox_write_area">
											<strong class="u_vc">댓글 입력</strong>
											<div class="u_cbox_inbox">
								<textarea id="repCon" class="u_cbox_text" rows="3" cols="30"
													data-log="RPC.input"></textarea>
											</div>
										</div>
									</div>
								</div>
							</fieldset>

						</div>
					</div>
					<input type="hidden" name="${_csrf.parameterName }"
						value="${_csrf.token }" />
				</form>
			</section>
		</sec:authorize>
	</div>

	<!--reply end  -->

	<!-- <script>
replyList(); 스크립트 덧글 처리방식 c:if 때문에 봉인 아주 SiBar 임
<sec:authentication property="principal" var="pinfo" />
</script> -->



	<div class="u_cbox">
		<ul class="u_cbox_list">
			<c:forEach items="${reply}" var="reply">

				<li>
					<div class="u_cbox_comment_box">
						<div class="u_cbox_area">
							<div class="u_cbox_info">
								<span class="userId">${reply.userId} 님의덧글</span>
							</div>
							<div class="u_cbox_text_wrap">${reply.repCon}</div>

							<div class="u_cbox_info_base">
								<span class="date"><fmt:formatDate
										value="${reply.repDate}" pattern="yyyy-MM-dd" /></span>
							</div>

							<div class='u_cbox_tool'>

								<c:if test="${users eq reply.userId }">
									<button type='button' class='modify'
										data-repNum="${reply.repNum }">수정</button>
									<button type="button" id='delete' name='delete' class='delete'
										data-repNum="${reply.repNum }">삭제</button>
								</c:if>
							</div>

						</div>
					</div>
				</li>
			</c:forEach>
		</ul>
	</div>
	<!--replyList end -->

	<!--goods end  -->


	<!-- <div class="replyModal">
		<div class="modalContent">
			<div>
				<textarea class="modal_repCon" name="modal_repCon"></textarea>
			</div>
			<div>
				<button type="button" class="modal_modify_btn">수정</button>
				<button type="button" class="modal_cancel">취소</button>
			</div>
		</div>
		<div class="modalBackground"></div>
	</div> -->
</div>

<script>
   $(document).on("click", ".modify", function(){
	 //$(".replyModal").attr("style", "display:block;");
	 $(".replyModal").fadeIn(200);
	 
	 var repNum = $(this).attr("data-repNum");
	 var repCon = $(this).parent().parent().children(".replyContent").text();
	 
	 $(".modal_repCon").val(repCon);
	 $(".modal_modify_btn").attr("data-repNum", repNum);
	 
	});
</script>

<script>
$(".modal_modify_btn").click(function(){
	 var modifyConfirm = confirm("정말로 수정하시겠습니까?");
	 var gdsNum = $("#gdsNum").val();
	 var csrfHeaderName = "${_csrf.headerName}";
	  var csrfTokenValue = "${_csrf.token}"; 
	 if(modifyConfirm) {
	  var data = {
	     repNum : $(this).attr("data-repNum"),
	     repCon : $(".modal_repCon").val()
	    };  // ReplyVO 형태로 데이터 생성
	  
	  $.ajax({
	   url : "/shop/view/modifyReply",
	   type : "post",
	   data : data,
	   beforeSend: function(xhr){ xhr.setRequestHeader(
			   csrfHeaderName,
			   csrfTokenValue)},
	   success : function(result){
	    
	    if(result == 1) {
	    	 $(".replyModal").fadeOut(200);
	    	url ="/shop/view?n="+gdsNum;
	    	location.href = url;
	    
	    } 
	   },
	   error : function(){
	    alert("로그인 안하시고 어떡해...너는..대체누구냐..")
	   }
	  });
	 }
	 
	});
</script>




<script>
 $("#reply_btn").click(function(){
  var csrfHeaderName = "${_csrf.headerName}";
  var csrfTokenValue = "${_csrf.token}";  
  var formObj = $(".replyForm form[role='form']");
  var gdsNum = $("#gdsNum").val();
  var repCon = $("#repCon").val()
  var type=$(this).data("type");
 
  var data = {
		    gdsNum : gdsNum,
		    repCon : repCon
		  }
  
  
  $.ajax({
   url : "/shop/view/registReply",
   data :data,
   beforeSend: function(xhr){ xhr.setRequestHeader(
		   csrfHeaderName,
		   csrfTokenValue)},
	 type : "POST",
   success : function(){
    $("#repCon").val("");
    	
    	url ="/shop/view?n="+gdsNum;
    	
    location.href = url;
   }
  });
 });
</script>

<script>
$(document).on("click", ".delete", function(){
	var csrfHeaderName = "${_csrf.headerName}";
	  var csrfTokenValue = "${_csrf.token}"; 
  var data = {repNum : $(this).attr("data-repNum")};
   
  $.ajax({
   url : "/shop/view/deleteReply",
   type : "post",
   data : data,
   beforeSend: function(xhr){ xhr.setRequestHeader(
		   csrfHeaderName,
		   csrfTokenValue)},
   success : function(){
     
   }
  });
 });
</script>


<script type="text/javascript">

            //client rolling banner
   window.onload = function() {
            var bannerLeft=0;
            var first=1;
            var last;
            var imgCnt=0;
            var $img = $(".banner_wraper img");
            var $first;
            var $last;
            
            $img.each(function(){   // 5px 간격으로 배너 처음 위치 시킴
                $(this).css("left",bannerLeft);
                bannerLeft += $(this).width()+10;
                $(this).attr("id", "banner"+(++imgCnt));  // img에 id 속성 추가
            });
            if( imgCnt > 0){                //배너 9개 이상이면 이동시킴

                last = imgCnt;

                setInterval(function() {
                    $img.each(function(){
                        $(this).css("left", $(this).position().left-1); // 1px씩 왼쪽으로 이동
                    });
                    $first = $("#banner"+first);
                    $last = $("#banner"+last);
                    if($first.position().left < -200) {    // 제일 앞에 배너 제일 뒤로 옮김
                        $first.css("left", $last.position().left + $last.width()+5 );
                        first++;
                        last++;
                        if(last > imgCnt) { last=1; }   
                        if(first > imgCnt) { first=1; }
                    }
                }, 40);   //여기 값을 조정하면 속도를 조정할 수 있다.(위에 1px 이동하는 부분도 조정하면 

//깔끔하게 변경가능하다           

 }

};

</script>


<!-- <script type="text/javascript" src="/resources/js/ply.js">



<script>
var csrfHeaderName =("${_csrf.parameterName }");
var csrfTokenValue = ("${_csrf.token }");


$(document).ajaxSend(function(e,xhr,options){
	
	xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
}); // csrf 값을 미리 설정해 두고, ajax 처리시마다 이용,
var reply_btn = ("#reply_btn");

reply_btn.on("click", function(e) {
	// 덧글 등록 버튼을 눌렀다면
	var reply = {
			gdsNum : gdsNum,
		    repCon : repCon,
			
	}; // ajax로 전달할 reply 객체 선언 및 할당.
	
	replyService.add(reply, function(result) {
		alert(result);
		//ajax 처리후 결과 리턴
		//showList(1); // 덧글 목록 갱신.
		   replyList();
    	$("#repCon").val("");
		showList(-1);
		//목록 자동 새로고침
	})

});

</script> -->






<%@ include file="../includes/footer2.jsp"%>