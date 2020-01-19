package kr.icia.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.icia.domain.ImgDTO;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class NoticeImgController {

	
	String uploadFolder="c:\\ARK";
	
	@PostMapping(value="/uploadAjaxAction" ,produces= MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<ImgDTO>>
	uploadAjaxPost(MultipartFile[] uploadFile){
		
		List<ImgDTO> list = new ArrayList<>();
		// 여러개 파일을 list 에 저장
		String uploadFolder="c:\\ARK";
		String uploadFolderPath = getFolder();
		File uploadPath = new File(uploadFolder,uploadFolderPath);	
		
		
		if(uploadPath.exists()==false) {
			uploadPath.mkdirs();
		}
		
		for(MultipartFile multipartFile : uploadFile){
			ImgDTO imgDTO = new ImgDTO();
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			uploadFileName = uploadFileName.substring(
					uploadFileName.lastIndexOf("\\")+1);
			
			imgDTO.setFileName(uploadFileName);
			
			UUID uuid = UUID.randomUUID();
			// universal unique identifier, 병영 고유 식별자.
			// 파일의 중복을 회피.
			
			uploadFileName=uuid.toString()+"_"+uploadFileName;
			// 예) uuid_일일일.txt
			
			try {
				File saveFile = new File(uploadPath,uploadFileName);
						
						multipartFile.transferTo(saveFile);
						//서버에 파일 저장
						
						imgDTO.setUuid(uuid.toString());
						imgDTO.setUploadPath(uploadFolderPath);
					
					
						list.add(imgDTO);
					// 업로드된 파일 정보를 객체 배열에 담아서 리턴
			}catch (Exception e) {
			e.printStackTrace();	
			}
		
		}
		return new ResponseEntity<>(list,HttpStatus.OK);
	}
	
	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date= new Date();
		String str= sdf.format(date);
		
		return str.replace("-",File.separator);
		// 파일 검색 시간을 줄이기 위해서
		//폴더 1개에 모두 저장하는 것이 아니라
		// 년월일로 구분하여 폴더를 생성하고 그곳에 파일을 저장
		// file.separator : 폴더 구분자를 운영체제에 맞춰서 변경
		// 2019-09-18
		// 2019/09/18 결과적으로 날짜 별로 파일 저장
	}
	
	/* @PreAuthorize("isAuthenticated()") 사용자가 익명이면 false로됨
	 * */
	  
	  @PostMapping("/deleteFile")
	  
	  @ResponseBody 
	  public ResponseEntity<String> deleteFile(
			  String fileName,String type){
	  
	  log.info("deleteFile:" +fileName);
	  
	  File file;
	  
	  try { 
		  file=new File("c:\\ARK\\"
	  +URLDecoder.decode(fileName,"UTF-8"));
	  
	  file.delete(); 
	  
	  }catch (UnsupportedEncodingException e) {
	  e.printStackTrace(); 
	  return new ResponseEntity<>(HttpStatus.NOT_FOUND); 
	  }
	  
	  return new ResponseEntity<String>("deleted",HttpStatus.OK);
	  }
	  
	  
	  
	  // 모든 파일은 내부적으로 bit 값을 가짐.(문서, 영상, 이미지, 소리) // 비트스트림을 재조합하여 파일로 구성
	  
	
	  @GetMapping(value="/download",
			  produces=MediaType.APPLICATION_OCTET_STREAM_VALUE)
	  
	  @ResponseBody
	  public ResponseEntity<Resource>
	  downloadFile(
			  @RequestHeader("User-Agent")String userAgent,String fileName){
	  
	  Resource resource
	  = new FileSystemResource("c:\\ARK\\"+fileName);
	  log.info("resource :"+resource);
	  
	  if(resource.exists()==false){
	  
	  return new ResponseEntity<>(HttpStatus.NOT_FOUND); 
	  }
	  
	  String resourceName= resource.getFilename(); // 리소스에 파일명을 찾아서 할당 
	  String resourceOriginalName = resourceName.substring(
			  resourceName.indexOf("_")+1);
	  
	  HttpHeaders headers = new HttpHeaders();
	  
	  try { 
		  String downloadName = null;
	  
	  if(userAgent.contains("Trident")) {
		  log.info("IE browser");
		  downloadName 
		  = URLEncoder.encode(
				  resourceOriginalName,"UTF-8").replaceAll("\\"," ");
		  } else if(userAgent.contains("Edge")) {
			  log.info("Edge browser"); 
			  downloadName 
			  = URLEncoder.encode(
					  resourceOriginalName,"UTF-8");
	  }else { 
		  log.info("chrome browser");
		  downloadName 
		  = new String(resourceOriginalName.getBytes("UTF-8") ,"ISO-8859-1"); 
		  }
	  log.info("downloadName :" +downloadName);
	  
	  headers.add("Content-disposition","attachment; fileName="+downloadName);
	  
	  }catch (UnsupportedEncodingException e) {
		  e.printStackTrace(); 
		  } 
	  return new ResponseEntity<Resource>(resource,
			  headers,HttpStatus.OK); 
	  }
	 
	
}
