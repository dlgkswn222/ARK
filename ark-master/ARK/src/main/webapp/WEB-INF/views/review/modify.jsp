<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp"%>


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

.contai6 {
	display: table;
	table-layout: fixed;
	position: relative;
	width: 1000px;
	min-height: 100%;
	margin: 0 auto;
}

.contents2 {
	margin: 20px 0 auto;
}

.contents2 .title {
	min-height: 30px;
	margin: 10px 0 20px;
	border-bottom: 1px solid #e8e8e8;
}

.xans-board-product {
	position: relative;
	min-height: 130px;
	margin: 0 0 20px;
	padding: 30px 20px 70px;
	border: 5px solid #e8e8e8;
}

.xans-board-product .prdThumb {
	position: absolute;
}

.xans-board-product .prdThumb img {
	width: 90px;
	height: 130px;
	border: 1px solid #d5d5d5;
}

.xans-board-product .prdInfo {
	padding: 0 0 0 255px;
}

.xans-board-product .prdInfo h3 {
	margin: 17px 0 5px;
	font-size: 14px;
	color: #2e2e2e;
}

.xans-board-product .prdInfo .price {
	font-size: 14px;
	font-weight: bold;
	color: #008bcc;
}

.xans-board-product .prdInfo .button {
	margin: 19px 0 0 0;
	padding: 13px 0 0 0;
	border-top: 1px solid #e8e8e8;
}

.contai6 .title p {
	display: inline-block;
	margin: 0 0 0 6px;
	padding: 0 0 0 10px;
	color: #939393;
	vertical-align: bottom;
	background: url(//pics.auction.co.kr/customer/bl_two_tab.gif) no-repeat
		0 2px;
}

.contai6 .title h2 {
	display: inline-block;
	padding: 0 0 0 12px;
	color: #2e2e2e;
	font-size: x-large;
}

.boardView table {
	table-layout: fixed;
	border: 1px solid #d7d5d5;
	color: #353535;
	line-height: 180%;
	width: -webkit-fill-available;
}

.boardView table th {
	width: 110px;
	padding: 10px 0 8px 20px;
	border-top: 1px solid #e8e8e8;
	border-right: 1px solid #e8e8e8;
	background-color: #fbfafa;
	text-align: left;
	font-weight: normal;
}

.boardView table td input {
	width: -webkit-fill-available;
	padding: 10px 0 8px 10px;
	border-top: 1px solid #e8e8e8;
}

.boardView table tr.view td {
	padding: 0;
	border: 0;
	line-height: 140%;
}

.boardView table tr.view td .detali {
	position: relative;
	z-index: 2;
	margin: -1px 0 0;
	padding: 17px 0 15px 20px;
	border-top: 1px solid #d7d5d5;
	word-break: break-all;
	line-height: 16px;
	letter-spacing: 0px;
}

.main-search-btn {
	width: 80px;
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

.input_area1 {
	width: 105px;
	border: 1px #3399dd solid;
	margin: 15px;
	background-color: #f7f7f7;
	text-align: center;
	font-size: 18px;
	cursor: pointer;
	color: #333;
	border-radius: .25rem;
}

#reply {
	margin: 30px 0 0;
	padding: 20px 20px 20px;
	border: 1px solid #e9e9e9;
	background-color: #fbfafa;
	color: #353535;
}

.input_area {
	border: 1px solid #b3b3b3;
}

#repCon {
	display: block;
	overflow-x: hidden;
	overflow-y: auto;
	position: relative;
	z-index: 1;
	width: 100%;
	height: 56px;
	padding: 15px 0 0;
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

.etcArea td {
	padding: 0;
	border: 0;
}

.etcArea ul {
	position: relative;
	z-index: 1;
	overflow: hidden;
	width: 100%;
	border-top: 1px solid #e8e8e8;
}

.etcArea ul li {
	float: left;
}

.u_cbox_text {
	display: block;
	overflow-x: hidden;
	overflow-y: auto;
	position: relative;
	z-index: 1;
	width: 100%;
	height: 200px;
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
</style>

<div class="sub_top_ban"></div>

<div class="contents2">
	<div class="contai6">
		<div class="title">
			<h2>
				<font>글 수정</font>
			</h2>
		</div>
		<form role="form" action="/review/modify" method="post">
	<input type="hidden" name="${_csrf.parameterName }"
			 value="${_csrf.token }" />
	
	<div class="select_img">
	<input style="display: none;" type="file" id="gdsImg"
	name="uploadPath"  value="/resources/images/upload${review.gdsthumbimg}" />
						
	<img id="file" name="file"  width="150px" height="150px"
	src="/resources/images/upload${review.gdsthumbimg}	" />
							</div>
		
	
	
	<script>
$(document).ready(function(){
	$("#file").click(function(){
		$("#gdsImg").click() ;
		})			
	})

</script>


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



		
			 
				
			<input type="hidden" name="num" value="${review.num }" />

			<div class="boardView">

				<table>
					<tbody>

						<tr>
							<th scope="row">작성자</th>
							<td><input name="writer"
								value='<c:out value="${review.writer }"/>' readonly="readonly">
							</td>
						</tr>

						<tr>
							<th scope="row">날짜</th>
							<td><input name="ttdate"
								value='<fmt:formatDate
pattern="yyyy/MM/dd"
value="${review.ttdate }"/>'
								readonly="readonly"></td>
						</tr>

						<tr>
							<th scope="row">제목</th>
							<td><input name="title"
								value='<c:out value="${review.title }"/>'></td>
						<tr class="view">

							<td colspan="2"><textarea rows="3" name="content"><c:out
										value="${review.content }" /></textarea></td>
						</tr>

					</tbody>
				</table>
			</div>
		</form>
		<div class="card-header py-3" align="right">
			<button type="submit" data-oper="modify" class="main-search-btn">수정</button>
			<button type="submit" data-oper="remove" class="main-search-btn">삭제</button>
			<button type="submit" data-oper="list" class="main-search-btn">목록</button>
		</div>
	</div>
</div>


<script>
	//스마트 에딧
	var ckeditor_config = {
		resize_enaleb : false,
		enterMode : CKEDITOR.ENTER_BR,
		shiftEnterMode : CKEDITOR.ENTER_P,
		
	};

	CKEDITOR.replace("content", ckeditor_config);
</script>


<script>
	$(document).ready(function() {
		console.log("history.state : " + history.state);
		var formObj = $("form");
		$('button').on("click", function(e) {
			e.preventDefault();
			var operation = $(this).data("oper");

			if (operation === 'remove') {
				formObj.attr("action", "/review/remove");

			} else if (operation === 'list') {
				formObj.attr("action", "/review/list").attr("method", "get");
				var pageNumTag = $("input[name='pageNum']").clone();
				var amountTag = $("input[name='amount']").clone();
				formObj.empty();
				formObj.append(pageNumTag);
				formObj.append(amountTag);
			}

			formObj.submit();
		});
	});
</script>


<%@ include file="../includes/footer2.jsp"%>