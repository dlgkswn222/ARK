<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp"%>
    
			<link rel="stylesheet" href="../resources/css/skel-noscript.css" />
			<link rel="stylesheet" href="../resources/css/style.css" />
			<link rel="stylesheet" href="../resources/css/style-desktop.css" />

<div class="row">
	<div class="ARK-head">
		<h1 class="page-header">글 수정</h1>
	</div>
</div>
<div class="row">
	<div class="ARK-middle">
		<div class="panel panel-default">
			<div class="panel-heading"></div>
			<form role="form" method="post">
			<input type="hidden" 
				name="${_csrf.parameterName }" 
				value="${_csrf.token}" />
			<div class="ARK-body">
			
				<p class="Text">번호</p>
				<div class="ARK-title">
					<input class="content-box1" name="ntnum"
						value='<c:out
					value="${notice.ntnum }"/>'
						readonly="readonly">
				</div>
				<div class="ARK-body">
					<p class="Text">제목</p>
					<div class="ARK-title">
						<input class="content-box1" name="nttitle"
							value='<c:out
					value="${notice.nttitle }"/>'>
					</div>
					<p class="Text">내용</p>
					<div class="ARK-content">
						<textarea rows="3" class="content-box2" name="ntcontent">					
						<c:out value="${notice.ntcontent }" /></textarea>
					</div>
					<!--		<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${notice.ntdate }" /></td>  -->
					<div class="form-group">
						<input class="form-control" name="ntdate"
							value='<fmt:formatDate
							pattern="yyyy/MM/dd"
							value="${notice.ntdate }"/>'
							readonly="readonly">
					</div>
					<button type="submit" data-oper="modify" class="btn btn-warning">수정
					</button>
					<button type="submit" data-oper="remove" class="btn btn-danger">삭제</button>
				</div>
			</div>
			</form>
		</div>
</div>
</div>
	<script>
		$(document).ready(function() {
			console.log("history.state : " + history.state);
			var formObj = $("form");
			$('button').on("click", function(e) {
				e.preventDefault();
				var operation = $(this).data("oper");
				console.log(operation);
				
				if (operation === 'remove') {
					formObj.attr("action", "/notice/remove");
				} 
				else if (operation === 'modify') {
					formObj.attr("action","/notice/modify");
				}
				formObj.submit();
			});
		});
	</script>
	<%@ include file="../includes/footer2.jsp"%>
	