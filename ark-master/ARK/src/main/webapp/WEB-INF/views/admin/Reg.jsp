<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ include file="../includes/adminHeader.jsp" %>

<script src="/resources/ckeditor/ckeditor.js"></script>

<form role="form" method="post" autocomplete="off" enctype="multipart/form-data">
 <div class="card mb-3">
          <div class="card-body">
            <div class="table-responsive">

<div class="inputArea"> 
 <label>1차 분류</label>
 <select class="category1">
  <option value="">전체</option>
 </select>

 <label>2차 분류</label>
 <select class="category2" name="cateCode">
  <option value="">전체</option>
 </select>
</div>

<div class="inputArea">
 <label for="gdsName">상품명</label>
 <input type="text" id="gdsName" name="gdsName" />
</div>

<div class="inputArea">
 <label for="gdsPrice">상품가격</label>
 <input type="text" id="gdsPrice" name="gdsPrice" />
</div>

<div class="inputArea">
 <label for="gdsStock">상품수량</label>
 <input type="text" id="gdsStock" name="gdsStock" />
</div>

<div class="inputArea">
 <label for="gdsDes">상품소개</label>
 <textarea rows="5" cols="50" id="gdsDes" name="gdsDes"></textarea>
</div>


<div class="inputArea">
 <label for="gdsImg">이미지</label>
 <input type="file" id="gdsImg" name="file" />
 <div class="select_img"><img src=""/></div>

</div>


<div class="inputArea">
 <button type="submit" id="register_Btn" class="btn btn-primary">등록</button>
</div>
</div>
</div>
</div>
<input type="hidden"
name="${_csrf.parameterName }"
value="${_csrf.token }"/>

</form>


<script>
  $("#gdsImg").change(function(){
   if(this.files && this.files[0]) {
    var reader = new FileReader;
    reader.onload = function(data) {
     $(".select_img img").attr("src", data.target.result).width(100);        
    }
    reader.readAsDataURL(this.files[0]);
   }
  });
  
 </script>



<script>
//스마트 에딧
 var ckeditor_config = {
   resize_enaleb : false,
   enterMode : CKEDITOR.ENTER_BR,
   shiftEnterMode : CKEDITOR.ENTER_P,
   filebrowserUploadUrl : "/admin/goods/ckUpload"  
 };
 
 CKEDITOR.replace("gdsDes",ckeditor_config);
 
 
 
/*  
  var csrfHeaderName = "${_csrf.headerName}";
 var csrfTokenValue = "${_csrf.token}";
 $(document).ajaxSend(function(e,xhr,options) {
     xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
 
 });
  */

</script>



<%-- 스마트 에디터  


<div>
<form action="nome" name="writefrm">
<textarea name="irl" id="irl" rows="10" cols="100">asdfads 에디터에 기본으로 삽입할 글 (수정모드) 이 없다면 value 값을 지정하지</textarea>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
<input type="button" id="writebtn" name="writebtn" value="저장">
</form>
</div>

<script src="<%=request.getContextPath()%>/smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script>
var oEditors = [];
var csrfHeaderName = "${_csrf.headerName}";
var csrfTokenValue = "${_csrf.token}";

nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder:"irl",
	sSkinURI:"<%=request.getContextPath()%>/smarteditor/SmartEditor2Skin.html",
	htParams :{
		bUseToolnar:true,
		bUseVerticalResizer:false,
		bUseModeChanger : true,
		fOnBeforeUnload:function(){
			
		}
		
	},
	
	fCreator:"createSEditor2"
});
</script>
<script>
window.onload=function(){
	//버튼을 눌렀을때 실행
	var btn= document.getElementById("writebtn");
	btn.onclick=function(){
		submitContents(btn);
	}	
}
// 저장 버튼을 누르는 등 저장을 위한 액션을 했을때 submitContents 가 호출된다고 가정한다
function submitContents(elClickedObj){
	//에디터의 내용이 textarea에 적용된다
	oEditors.getById["irl"].exec("UPDATE_CONTENTS_FIELD",[]);
	//에디터의 내용에 대한 값 검증은 이곳에서
	// document.getElementById("irl").values를 이용해서 처리한다.
	try {
		elClickedObj.form.submit();
	} catch (e) {
		// TODO: handle exception
	}
	
}
</script>
 --%>


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

<%@ include file="../includes/adminFooter.jsp" %>