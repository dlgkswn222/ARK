<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<%@ include file="../includes/adminHeader.jsp" %>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">수정</h1>
	</div>
</div>
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">

			<div class="panel-heading"></div>
			<div class="panel-body">
			
				<form role="form" action="/admin/modify" method="post">	
					
					<input type="hidden" name="${_csrf.parameterName }"
				value="${_csrf.token }"/>
					
					<input type="hidden" id="amount" name="amount" value="${cri.amount }"/>
					<input type="hidden" id="pageNum" name="pageNum" value="${cri.pageNum }"/>
					<input type="hidden" id="type" name="type" value="${cri.type }"/>
					<input type="hidden" id="keyword" name="keyword" value="${cri.keyword }"/>
					
					<div class="form-group">
			게시물번호<input class="form-control" name="bno" readonly="readonly" value='<c:out value="${board.bno }"/>'  >
					</div>
					
					<div class="form-group">
						제목<input class="form-control" name="title" 
						value='<c:out value="${board.title }"/>'>
					</div>
					
					
					<div class="form-group">
						내용
<textarea rows="3" class="form-control" name="content" ><c:out value="${board.content }"/></textarea>
					</div>
					<div class="form-group">
						작성자<input class="form-control" name="writer" readonly="readonly" 
						value='<c:out value="${board.writer }"/>' >
					</div>
					
						<div class="form-group">
						등록일<input class="form-control" name="regDate" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${board.regdate }" />'readonly="readonly" >
					</div>
					
						<div class="form-group">
						수정일<input class="form-control" name="updateDate" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${board.updateDate }"/>'readonly="readonly" >
					</div>
					
					<sec:authentication property="principal" var="pinfo" />

				
				<sec:authorize access="isAuthenticated()">
					<!-- 인증된 사용자만 허가 -->
					<c:if test="${pinfo.username eq board.writer }">
						<!-- 인증되었으면서 작성자가 본인일때 수정 삭제 버튼 표시 -->
					<button type="submit" data-oper="modify" class="btn btn-warning">수정</button>
					
					<button type="submit" data-oper="remove" class="btn btn-danger">삭제</button>
					
					</c:if>
					</sec:authorize>
				
					<button type="submit" data-oper="list" class="btn btn-info">목록</button>
				</form>
			</div>
		</div>
	</div>
</div>


<br/>
<div class="row">
<div class="col-lg-12">
<div class="panel panel-default">

<div class="panel-heading"></div>

<div class="panel-body">
<div class="form-group uploadDiv">
파일 첨부: <input type="file" name="uploadFile" multiple>
</div>

<div class="uploadResult">
<ul></ul>
</div>
</div>

</div>
</div>
</div>



<script>
var regExp = /[^0-9]/gi;

$("#gdsPrice").keyup(function(){ numCheck($(this)); });
$("#gdsStock").keyup(function(){ numCheck($(this)); });

function numCheck(selector) {
 var tempVal = selector.val();
 selector.val(tempVal.replace(regExp, ""));
}
</script>



<script>
$(document).ready(function(){
	var formObj = $("form"); /* form 객체를  변수에 할당. */
	$('button').on("click",function(e){
		/* 버튼이 클릭된다면 */
		
		e.preventDefault(); /* 버튼의 기본 기능을 막고 */
		var operation=$(this).data("oper");
		/* 버튼에서 data oper 를 가져와서 변수할당*/
		
		console.log(operation); 
		/* 웹 브라우저 콘솔로 해당 변수 출력 */
		
		if(operation==='remove'){
			
			formObj.attr("action","/admin/remove");
			/* 삭제라면 액션을 변경함 */
			
		}else if(operation=='list'){
			
			formObj.find("#bno").remove();
			
	
			
			/* formObj.attr("action","/board/list"); */
			
			formObj.attr("action","/admin/list").attr("method","get"); 
			var pageNumTag = $("input[name='pageNum']").clone();
			var amountTag = $("input[name='amount']").clone();
			var typeTag = $("input[name='type']").clone();
			var keywordTag = $("input[name='keyword']").clone();
			
			//클론 = 복사를의미
			
				formObj.empty(); //폼의 내용들을 비우기.
				formObj.append(pageNumTag);
				formObj.append(amountTag);
				formObj.append(typeTag);
				formObj.append(keywordTag);
				//수정시 필요했던 여러가지 정보들중에서
				//페이지번호와 페이지당 게시물수 값만 남기고 지우기
				//그다음에 목록으로 이동.
				
			
			//	self.location="/board/list";
			
			//return;
			
			// 셀프 로케이션은
			
			/* 페이지를 이동하고 진행 중지. */
		}else if(operation === 'modify'){
		
				var str="";
				$(".uploadResult ul li").each(function(i,obj){
					var jobj=$(obj);
					console.dir(jobj);
					console.log("---------------------");
					console.log(jobj.data("filename"));
					
					str+="<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
					
					str+="<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
					
					str+="<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
					
					str+="<input type='hidden' name='attachList["+i+"].fileType' value='"+jobj.data("type")+"'>";
					
					
					});
				formObj.append(str);
			
		}
		formObj.submit();
	});
	

	
});
</script>

<script>
$(document).ready(function(){
	
	(function(){
		// 게시물에 첨부된 파일을 보여주는 부분
		var bno='<c:out value="${board.bno}"/>';
		//화면상에 공유된 bno 값 가져와 사용준비
		
		
		$.getJSON("/admin/getAttachList",
				{bno:bno}, 
				function(arr){
					console.log(arr);
					
					var str="";
					$(arr).each(function(i,attach){
						var fileCallPath = encodeURIComponent(attach.uploadPath+"/"+attach.uuid+"_"+attach.fileName);
						str+="<li data-path='";
						str+=attach.uploadPath+"' data-uuid='";
						str+=attach.uuid+"' data-filename='";
						str+=attach.fileName+"' data-type='";
						str+=attach.fileType+"'><div>";
						str+="<img src='/resources/img/다운로드.png'>";
						str+="<span>"+attach.fileName+"</span> ";
						str+="<b data-file='"+fileCallPath+"' data-type='file'>[x]</b>";
						str+="</div></li>";
					});
					$(".uploadResult ul").html(str);
				});
	})(); //첨부파일 목록 표시 스크립트 끝
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	
	$(".uploadResult").on("click","b",function(e){
		console.log("delete file");
		
		var targetFile=$(this).data("file");
		var type=$(this).data("type");
		var targetLi=$(this).closest("li");
		
		$.ajax({
			url:'/deleteFile',
			data:{fileName : targetFile,
				type:type
				},
				beforeSend: function(xhr){
					xhr.setRequestHeader(
							csrfHeaderName
							,csrfTokenValue);
					
				},
			dataType:'text',
			type: 'POST',
			success: function(result){
				alert(result);
				targetLi.remove();
			}
		})
	});// 첨부파일 삭제
	

	var regex=new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	// 정규표현식. 일부 파일의 업로드 제한.
	// https://developer.mozilla.org/ko/docs/Web/JavaScript/Guide/%EC%A0%95%EA%B7%9C%EC%8B%9D
	// https://regexper.com/
	
	var maxSize = 5242880; // 5MB
	
	function checkExtension(fileName, fileSize){
		if(fileSize >=maxSize){
			alert("파일 크기 초과");
			return false;
		}
		
		if(regex.test(fileName)){
			alert("해당 종류의 파일은 업로드 불가.");
			return false;
		}
		return true;
	}
	
	//파일 첨부
	$("input[type='file']").change(function(e){
		// 인풋타입이 file 이  change 되었을때(이벤트 발생)
		// 즉 파일첨부가 시행될때마다 실행되는것이다
		
		var formData = new FormData();
		//https://www.zerocho.com/category/HTML&DOM/post/59465380f2c7fb0018a1a263
		// FormData 페이지 전환을 하지않고 작업을할때 사용한다
		
		var inputFile=$("input[name='uploadFile']");
		// 인풋중에 name uploadFile 인것을 = inputFile 로 선언
	
		
		var files=inputFile[0].files;
		// files 라는것은 첨파일안에 추가되있는 파일들을 가리키는함수
		// 그것을 배열화 해서  files 안에 넣어준다는 뜻
		
	
		for(var i=0;i<files.length;i++){
			if(!checkExtension(files[i].name
					,files[i].size)){
				return false;
			}
			formData.append("uploadFile",files[i]);
		}
		
		$.ajax({
			url:'/uploadAjaxAction',
			processData:false,
			contentType:false,
			beforeSend: function(xhr){
				xhr.setRequestHeader(
						csrfHeaderName
						,csrfTokenValue);
				
			},
			data:formData,
			type:'POST',
			dataType:'json',
			success:function(result){
				console.log(result);
				showUploadResult(result);
				
				//첨부 파일 업로드 결과를 json으로 받으면
				//그내용을 화면에 표시	
			}
		}); //end ajax
	});	// end_change
	
	function showUploadResult(uploadResultArr){
	
		if(!uploadResultArr || uploadResultArr.length==0){
			return;
		}
		
		var uploadUL=$(".uploadResult ul");
		var str="";
		
		// each  받아온 갯수만큼 반복
		$(uploadResultArr).each(function(i,obj){
			
			var fileCallPath = encodeURIComponent(obj.uploadPath+"/"+obj.uuid+"_"+obj.fileName);
			// encdoeURIComponent: uri 로 전달되는 특수문자의 치환.
			
			// & ? 특수문자를 함수로 인식하지마라
			
			var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
			// 전달되는 값들중 역슬러시를 찾아서 슬러시로 변경
			
			str+="<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'>";        
			str+="<div>";
			str+="<img src='/resources/img/다운로드.png'>";
			str+="<span>'"+obj.fileName+"'</span>";
			str+="<b data-file='"+fileCallPath+"' data-type='file'>[x]</b>";
			str+="</div></li>";
		});
		uploadUL.append(str);
	
	}//end_showUploadResult
	
	
});// end_ready
</script>

<%@ include file="../includes/adminFooter.jsp" %>

