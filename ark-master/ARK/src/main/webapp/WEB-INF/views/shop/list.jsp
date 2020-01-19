<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../includes/header.jsp"%>

<style>
.allkill_title {
	position: relative;
	margin-bottom: 20px;
	height: 28px;
	font-size: 20px;
	font-weight: 900;
	color: #222;
	text-align: center;
}

section#content ul li {
	display: inline-block;
	margin: 10px;
}

section#content div.goodsThumb img {
	width: 100%;
	-webkit-transition: height 0.2s;
	-moz-transition: height 0.2s;
	height: auto;
	text-align: center;
	overflow: visible;
	position: relative;
	-moz-transition: height 0.2s;
}

section#content div.goodsName {
	display: inline-block;
	-webkit-transition: height 0.2s;
	-moz-transition: height 0.2s;
	transition: height 0.2s;
	height: auto !important;
	min-height: 160px;
	font-size: 20px;
	text-align: right;
	font-weight: 500;
}

section#content div.goodsName a {
	color: #000;
}

.section_module-wrap {
	background: #fff;
	margin-bottom: 0;
	border-radius: 6px;
}

.item_list_wrap {
	float: none;
	display: block;
	top: 0px;
	left: 0px;
	width: 1500px;
	margin: 0 auto;
}

.inner {
	position: relative;
	border: 3px solid rgba(0,123,255,.25);
	background: #fff;
}

.Thumb {
	margin: 0 0 17px;
}

.Thumb h2 {
	width: 1000px;
	height: 20px;
	margin: 0 30px 0 350px;
	border-bottom: 2px dotted #c2c2c2;
	padding: 10px 0 35px 0;
	font-weight: bold;
	font-size: 30px;
	font-family: "맑은고딕", "Malgun Gothic", Arial, "돋움", Dotum, sans-serif;
	color: #9f9f9f;
	text-align: center;
	font-weight: 900;
}

.goodsThumb {
	text-align: center;
}

.goodsThumb_title {
	display: block;
	overflow: hidden;
	margin: 12px 13px 0;
	font-size: 20px;
	color: #222;
	text-overflow: ellipsis;
	white-space: nowrap;
	text-decoration: none;
	letter-spacing: 0;
}

.price {
	font-size: 15px;
	font-weight: 900;
	font-family: auto;
}

.function {
    overflow: hidden;
    font-size: 15px;
    text-align: right;
    line-height: 38px;
    border: 0px solid #d7d5d5;
    margin: 0 26% 0 0;
}

.normalmenu{
    display: inline;
    margin: 0 4px 0 0;
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

</style>

<div class="sub_top_ban"></div>
<section id="content">
	<div class="section_module-wrap">
		<div class="section_module-wrap">
			<div class="Thumb">
				<h2>
					<span>${cateName }</span>
				</h2>
			</div>
		
			<div class="item_list_wrap">
				<ul>
					<c:forEach items="${list}" var="list">
						<li>
							<div class="inner">
								<div class="goodsThumb">
									<a href="/shop/view?n=${list.gdsNum }"> 
									
									<img style="width: 300px; height: 300px;"
									src="/resources/images/upload${list.gdsThumbImg}"> <span
										class="goodsThumb_title">${list.gdsName}</span>
									</a> <span class="price" ><fmt:formatNumber pattern="###,###,###" value="${list.gdsPrice}" /> 원</span>
								</div>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
</section>



					<form id="searchForm" action="/shop/list" method="get">
					&nbsp;&nbsp;&nbsp;<select name="type">
							<option value="" ${pageMaker.cri.type==null?"selected":"" }>
								--</option>
							<option value="T" ${pageMaker.cri.type eq "T"?"selected":"" }>
								이름</option>
						
						</select> 
						<input type="hidden" name="c" id="cateCode" value="${ cateCode}"/>
						<input type="hidden" name="l" id="level" value="${ level}" />
						<input type="text" name="keyword" />
						<input type="hidden"name="pageNum" value="${pageMaker.cri.pageNum }"> 
						<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
						<button class="btn btn-warning">선택</button>
					</form>
			




		
			<div>
				<ul class="pagination justify-content-center">
					<c:if test="${pageMaker.prev }">
						<li class="page-item previous"><a
							href="${pageMaker.startPage-1 }" class="page-link">prev</a></li>
					</c:if>

					<c:forEach var="num" begin="${pageMaker.startPage }"
						end="${pageMaker.endPage }">
						<li class='page-item ${pageMaker.cri.pageNum==num?"active":"" }'>
				<a href="${num }" class="page-link"> ${num }</a>
						</li>
					</c:forEach>

					<c:if test="${pageMaker.next }">
						<li class="page-item next"><a href="${pageMaker.endPage+1 }"
							class="page-link">next</a></li>
					</c:if>

				</ul>
			</div>
		



<form id="actionForm" action="/shop/list" method="get">
				
				<input type="hidden" name="c" value="${cateCode}">
				<input type="hidden" name="l" value="${level}">
				<input type="hidden" name="pageNum"
					value="${pageMaker.cri.pageNum }"> <input type="hidden"
					name="amount" value="${pageMaker.cri.amount }">
					
					
					<input type="hidden" name="type" 
					value="${pageMaker.cri.type }">
					<input type="hidden" name="keyword" 
					value="${pageMaker.cri.keyword }">
			</form>


<script> /* 페이징 */

$(document).ready(function() {
var actionForm = $("#actionForm");
// 클래스 page-item 에 a 링크가 클릭 된다면,

$(".page-item a").on(
		"click",
		function(e) {
			e.preventDefault();
			// 기본 이벤트 동작을 막고,
			console.log("click");
			// 웹 브라우저 검사 창에 클릭을 표시
			actionForm.find("input[name='pageNum']").val(
					$(this).attr("href"));
			// 액션폼 인풋태그에 페이지넘 값을 찾아서,
			// href로 받은 값으로 대체함.
			actionForm.submit();
		});
});
</script>




<script>
//카테고리
// 컨트롤러에서 데이터 받기
var jsonData = JSON.parse('${cat}');
console.log(jsonData);

var cate1Arr = new Array();
var cate1Obj = new Object();

// 1차 분류 셀렉트 박스에 삽입할 데이터 준비
for(var i = 0; i < jsonData.length; i++) {
 if(jsonData[i].level == "1") {
  cate1Obj = new Object();  //초기화
  cate1Obj.cateCode = jsonData[i].cateCode;
  cate1Obj.cateName = jsonData[i].cateName;
  cate1Arr.push(cate1Obj);
 }
}

//1차 분류 셀렉트 박스에 데이터 삽입
var cate1Select = $("select.category1")

for(var i = 0; i < cate1Arr.length; i++) {
 cate1Select.append("<option value='" + cate1Arr[i].cateCode + "'>"
      + cate1Arr[i].cateName + "</option>"); 
}
</script>



<script>
$(document).on("change", "select.category1", function(){

	 var cate2Arr = new Array();
	 var cate2Obj = new Object();
	 
	 // 2차 분류 셀렉트 박스에 삽입할 데이터 준비
	 for(var i = 0; i < jsonData.length; i++) {
	  
	  if(jsonData[i].level == "2") {
	   cate2Obj = new Object();  //초기화
	   cate2Obj.cateCode = jsonData[i].cateCode;
	   cate2Obj.cateName = jsonData[i].cateName;
	   cate2Obj.cateCodeRef = jsonData[i].cateCodeRef;
	   
	   cate2Arr.push(cate2Obj);
	  }
	 }
	 
	 var cate2Select = $("select.category2");
	 
	 /*
	 for(var i = 0; i < cate2Arr.length; i++) {
	   cate2Select.append("<option value='" + cate2Arr[i].cateCode + "'>"
	        + cate2Arr[i].cateName + "</option>");
	 }
	 */
	 
	 cate2Select.children().remove();

	 $("option:selected", this).each(function(){
	  
	  var selectVal = $(this).val();  
	  cate2Select.append("<option value=''>전체</option>");
	  
	  for(var i = 0; i < cate2Arr.length; i++) {
	   if(selectVal == cate2Arr[i].cateCodeRef) {
	    cate2Select.append("<option value='" + cate2Arr[i].cateCode + "'>"
	         + cate2Arr[i].cateName + "</option>");
	   }
	  }
	  
	 });
	 
	});
</script>




<%@ include file="../includes/footer2.jsp"%>