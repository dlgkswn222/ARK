function checkblank(){
	var wr_title = $('#wr_title').val();
	var wr_contents = $('#wr_contents').val();
	var writer = $('#name').val();
	if (wr_title == "" || wr_contents == ""){
		alert("내용이 없습니다");
		return false;
		}
	else if(writer == ""){
		alert("로그인 안한 사용자입니다");
		return false;
		}
	}
$(document).ready(function() {
	  $('#summernote').summernote({
		  height:480, 
		  lang: 'ko-KR',
			callbacks: {
				onImageUpload: function(files, editor, welEditable) {
		            for (var i = files.length - 1; i >= 0; i--) {
		                sendFile(files[i], this);
		              }
			}
			}
	  });

});
function sendFile(file, editor, welEditable) {
	var form_data = new FormData();
	console.log(form_data);
  	form_data.append('file', file);
	$.ajax({
		url:'/wrboard/upload',
		cache: false,
		processData: false,//꼭 false여야함
		contentType: false,//꼭 false여야함
		data: form_data,
		type: 'POST',
		enctype: 'multipart/form-data',
		dataType: 'text',
		success: function(result){
			console.log(result);
			if(result == '1'){
				alert("이미지 파일이 아닙니다.");
				return false;
			}else if(result == '2'){
				alert("이미지의 용량이 3MB가 넘어갑니다.");
				return false;
			}else{
				$('#summernote').summernote('editor.insertImage', result);
			}
		},
	     error:function(request,status,error){
	         alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	        }
  	});

} 