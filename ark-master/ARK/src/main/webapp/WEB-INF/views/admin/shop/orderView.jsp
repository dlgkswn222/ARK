<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../includes/adminHeader.jsp" %>


<style>
/*
#container_box table { width:900px; }
#container_box table th { font-size:20px; font-weight:bold;
       text-align:center; padding:10px; border-bottom:2px solid #666; }
#container_box table tr:hover { background:#eee; }
#container_box table td { padding:10px; text-align:center; }
#container_box table img { width:150px; height:auto; }
*/
 .orderInfo { border:5px solid #7a7abb87; padding:10px 20px; margin:20px 0; outline-style: auto; }
 .orderInfo span { font-size:20px; font-weight:bold; display:inline-block; width:90px; }
 .orderView{ outline-style: auto; border:5px solid #7a7abb87;}
 
 .orderView li { margin-bottom:20px; padding-bottom:20px; }
 .orderView li::after { content:""; display:block; clear:both; }
 
 .thumb { float:left; width:200px;margin-top: 20px; }
 .thumb img { width:200px; height:200px; }
 .gdsInfo { float:right; width:calc(100% - 220px); line-height:2; 
 outline-style: auto; border:5px solid #7a7abb87; margin-top: 20px;
margin-right: 10px; border:5px solid #7a7abb87;}
 .gdsInfo span { font-size:20px; font-weight:bold; display:inline-block; width:100px; margin-right:10px; }

.deliveryChange { text-align:right; }
.delivery1_btn,
.delivery2_btn { font-size:16px; background:#fff; border:1px solid #999; margin-left:10px; }
ul{
   list-style:none;
   }

</style>


<section id="content">

 <div class="orderInfo">
  <c:forEach items="${orderView}" var="orderView" varStatus="status">
  
  <c:if test="${status.first}">
   <p><span>주문자:</span>${orderView.userId}</p>
   <p><span>수령인:</span>${orderView.orderRec}</p>
   <p><span>주소:</span>(${orderView.userAddr1}) ${orderView.userAddr2} ${orderView.userAddr3}</p>
   <p><span>가격:</span><fmt:formatNumber pattern="###,###,###" value="${orderView.amount}" /> 원</p>
   <p><span>상태:</span>${orderView.delivery}</p>
 
 
 	<div class="deliveryChange">
 <form role="form" method="post" class="deliveryForm">
 
  <input type="hidden" name="orderId" value="${orderView.orderId}" />
  <input type="hidden" name="delivery" class="delivery" value="" />
  <input type="hidden" name="CK" class="CK" value="">
  <button type="button" class="delivery1_btn">배송 중</button>
  <button type="button" class="delivery2_btn">배송 완료</button>
  <input type="hidden"
name="${_csrf.parameterName }"
value="${_csrf.token }"/>
  <script>
   $(".delivery1_btn").click(function(){
    $(".delivery").val("배송 중");
    $(".CK").val("1");
    run();
   });
   
   $(".delivery2_btn").click(function(){
    $(".delivery").val("배송 완료");
    $(".CK").val("0");
    run();
    
   });
   
   function run(){  
    $(".deliveryForm").submit();
   }
  
  </script>
 </form>
</div>
  </c:if>
  
 </c:forEach>
</div>

<ul class="orderView" >
 <c:forEach items="${orderView}" var="orderView">     
 <li>
  <div class="thumb">
   <img src="/resources/images/upload${orderView.gdsThumbImg}" />
  </div>
  <div class="gdsInfo">
   <p>
    <span>상품명</span>${orderView.gdsName}<br />
    <span>개당 가격</span><fmt:formatNumber pattern="###,###,###" value="${orderView.gdsPrice}" /> 원<br />
    <span>구입 수량</span>${orderView.cartStock} 개<br />
    <span>최종 가격</span><fmt:formatNumber pattern="###,###,###" value="${orderView.gdsPrice * orderView.cartStock}" /> 원                  
   </p>
  </div>
 </li>     
 </c:forEach>
</ul>
</section>

<%@ include file="../../includes/adminFooter.jsp" %>