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

#container_box ul li { margin-bottom:20px; border:10px solid #eee; }
.replyInfo { background:#eee; padding:10px; font-size:18px; }
.replyInfo span { font-size:20px; font-weight:bold; margin-right:20px; }
.replyContent { padding:10px; }

.replyControll {text-align:right; padding:10px; }
.replyControll button { border:2px solid #999; background:#fff; }
</style>


<section id="content">
 
 <div id="container_box">
 <ul>
  
  <c:forEach items="${reply}" var="reply">
  <li>
   <div class="replyInfo">
    <p>
     <span>작성자</span>${reply.userName} (${reply.userId})
    </p>
    <p>
     <span>작성된 상품</span> <a href="/shop/view?n=${reply.gdsNum}">바로가기</a>
    </p>
   </div>
   <div class="replyContent">
    ${reply.repCon}
   </div>
   <div class="replyControll">
 <form role="form" method="post">
  <input type="hidden" name="repNum" value="${reply.repNum}" />
  <button type="submit" class="delete_${reply.repNum}_btn">삭제</button>
<input type="hidden"
name="${_csrf.parameterName }"
value="${_csrf.token }"/>
 </form>
</div>
  </li>     
  </c:forEach>

 </ul>

</div>

</section>

<%@ include file="../../includes/adminFooter.jsp" %>