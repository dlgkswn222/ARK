<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<%@ include file="../includes/adminHeader.jsp" %>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">글 쓰기</h1>
	</div>
</div>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">

			<div class="panel-heading"></div>
			<div class="panel-body">
				<form role="form" action="/admin/register" method="post">
				<input type="hidden" name="${_csrf.parameterName }"
				value="${_csrf.token }"/>
				
					<div class="form-group">
						제목<input class="form-control" name="title">
					</div>
					<div class="form-group">
						내용
						<textarea rows="3" class="form-control" name="content">
</textarea>
					</div>
					
					<div class="form-group">
						작성자<input class="form-control" name="writer"
						value='<sec:authentication property="principal.username"/>' readonly="readonly">
					</div>
					
					<button type="submit" class="btn btn-default">등록</button>
					<button type="reset" class="btn btn-default">취소</button>
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
$(document).ready(function(e){
	var formObj=$("form[role='form']");

	$("button[type='submit']").on("click",function(e){
		e.preventDefault();
		console.log("submit clicked");
		
		//글등록 버튼을 누르면 첨부파일의 정보도 함께 전송 되도록 수정
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
		formObj.append(str).submit();
		// 첨부파일의 정보들을 li 의 data 값으로 가지고 있다가
		// hidden 으로 폼에 포함
	});
	
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
	
	// 파일첨부 처리
	
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	
	/* ajax 처리시 csrf 값을 함께 전송하기 위한 준비 
	스프링 시큐리티는 데이터 전송시 csrf 값을 꼭 확인하므로
	*/
	
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
	}); // 첨부 삭제 부문
	
	
}); // end_ready
</script>

<%@ include file="../includes/adminFooter.jsp" %>















