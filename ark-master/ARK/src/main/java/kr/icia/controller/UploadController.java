/*
 * package kr.icia.controller;
 * 
 * import java.io.File; import java.io.FileInputStream; import
 * java.io.InputStream; import java.io.UnsupportedEncodingException; import
 * java.net.URLDecoder; import java.net.URLEncoder; import
 * java.text.SimpleDateFormat; import java.util.ArrayList; import
 * java.util.Date; import java.util.List; import java.util.UUID;
 * 
 * import javax.inject.Inject; import javax.servlet.http.HttpServletRequest;
 * import javax.servlet.http.HttpSession;
 * 
 * import org.apache.commons.io.IOUtils; import
 * org.springframework.core.io.FileSystemResource; import
 * org.springframework.core.io.Resource; import
 * org.springframework.http.HttpHeaders; import
 * org.springframework.http.HttpStatus; import
 * org.springframework.http.MediaType; import
 * org.springframework.http.ResponseEntity; import
 * org.springframework.security.access.prepost.PreAuthorize; import
 * org.springframework.stereotype.Controller; import
 * org.springframework.ui.Model; import org.springframework.util.FileCopyUtils;
 * import org.springframework.web.bind.annotation.GetMapping; import
 * org.springframework.web.bind.annotation.PostMapping; import
 * org.springframework.web.bind.annotation.RequestHeader; import
 * org.springframework.web.bind.annotation.RequestMapping; import
 * org.springframework.web.bind.annotation.RequestMethod; import
 * org.springframework.web.bind.annotation.ResponseBody; import
 * org.springframework.web.multipart.MultipartFile; import
 * kr.icia.domain.AttachFileDTO; import kr.icia.domain.UserVO; import
 * kr.icia.mapper.NewMemberMapper; import kr.icia.service.MediaUtils; import
 * kr.icia.service.UploadFileUtils; import lombok.extern.log4j.Log4j;
 * 
 * @Controller
 * 
 * @Log4j public class UploadController {
 * 
 * @Inject private NewMemberMapper map;
 * 
 * 
 * 
 * String uploadPath =
 * "E:\\sts-bundle\\workspace1\\빽업.zip_expanded\\ARK\\src\\main\\webapp\\resources\\images";
 * 
 * String uploadFolder="c\\upload";
 * 
 * 
 * @PreAuthorize("isAuthenticated()")
 * 
 * @PostMapping(value="/uploadAjaxAction", produces=
 * MediaType.APPLICATION_JSON_UTF8_VALUE)
 * 
 * //업로드파일
 * 
 * @ResponseBody public ResponseEntity<List<AttachFileDTO>>
 * uploadAjaxPost(MultipartFile[] uploadFile){ //rest 방식으로 ajax 처리 //파일을 받고 json
 * 값을 리턴.
 * 
 * List<AttachFileDTO> list = new ArrayList<>(); // 여러개 파일 저장을 위한 객체 배열 타입 선언.
 * String uploadFolder="c:\\upload";
 * 
 * 
 * String uploadFolderPath=getFolder(); File uploadPath = new
 * File(uploadFolder,uploadFolderPath); // 예) c:\\upload\\2019\\09\\18 에 파일 저장
 * 예정.
 * 
 * 
 * if(uploadPath.exists()==false) { uploadPath.mkdirs(); //경로에 폴더들이 생성되어 있지 않다면,
 * 폴더생성 }
 * 
 * //파일을 1개일수도 있고, 여러개 일수도 있음 for(MultipartFile multipartFile : uploadFile){
 * AttachFileDTO attachDTO = new AttachFileDTO();
 * 
 * String uploadFileName = multipartFile.getOriginalFilename(); //파일의 원래 이름을 저장
 * 
 * // 인터넷 익스플로러 경우 ,예외처리 uploadFileName = uploadFileName.substring(
 * uploadFileName.lastIndexOf("\\")+1);
 * 
 * 
 * attachDTO.setFileName(uploadFileName); // 파일 이름 저장
 * 
 * UUID uuid = UUID.randomUUID(); // universal unique identifier, 병영 고유 식별자. //
 * 파일의 중복을 회피.
 * 
 * uploadFileName=uuid.toString()+"_"+uploadFileName; // 예) uuid_일일일.txt
 * 
 * try { File saveFile = new File(uploadPath,uploadFileName);
 * 
 * multipartFile.transferTo(saveFile); //서버에 파일 저장
 * 
 * attachDTO.setUuid(uuid.toString());
 * attachDTO.setUploadPath(uploadFolderPath);
 * 
 * list.add(attachDTO); // 업로드된 파일 정보를 객체 배열에 담아서 리턴 }catch (Exception e) {
 * e.printStackTrace(); }
 * 
 * } return new ResponseEntity<>(list,HttpStatus.OK); }//업로드 파일end
 * 
 * //이미지 업로드 처리
 * 
 * @GetMapping("/uploadForm") public void uploadForm() throws Exception { }
 * 
 * @PostMapping("/uploadForm") public String uploadForm(MultipartFile file,
 * Model model) throws Exception { String savedName =
 * uploadFile(file.getOriginalFilename(), file.getBytes());
 * 
 * model.addAttribute("savedName", savedName);
 * 
 * return "uploadResult"; }
 * 
 * private String uploadFile(String originalName, byte[] fileData) throws
 * Exception {
 * 
 * UUID uid = UUID.randomUUID(); String savedName = uid.toString() + "_" +
 * originalName; File target = new File(uploadPath, savedName);
 * FileCopyUtils.copy(fileData, target); return savedName; }
 * 
 * //이미지 업로드처리 and
 * 
 * 
 * private String getFolder() { SimpleDateFormat sdf = new
 * SimpleDateFormat("yyyy-MM-dd"); Date date= new Date(); String str=
 * sdf.format(date);
 * 
 * return str.replace("-",File.separator); // 파일 검색 시간을 줄이기 위해서 //폴더 1개에 모두 저장하는
 * 것이 아니라 // 년월일로 구분하여 폴더를 생성하고 그곳에 파일을 저장 // file.separator : 폴더 구분자를 운영체제에 맞춰서
 * 변경 // 2019-09-18 // 2019/09/18 결과적으로 날짜 별로 파일 저장 }
 * 
 * //삭제파일
 * 
 * @PostMapping("/deleteFile")
 * 
 * @ResponseBody public ResponseEntity<String> deleteFile(String fileName,String
 * type){
 * 
 * log.info("deleteFile:" +fileName);
 * 
 * File file;
 * 
 * try { file=new File("c:\\upload\\"+URLDecoder.decode(fileName,"UTF-8"));
 * System.out.println(file); // 한글인 경우 페이지 변환시 변경됨 // 알맞는 문자 포맷으로 해석해서 읽어 들여야 함.
 * 
 * file.delete(); //파일 삭제 }catch (UnsupportedEncodingException e) {
 * e.printStackTrace(); return new ResponseEntity<>(HttpStatus.NOT_FOUND); }
 * 
 * return new ResponseEntity<String>("deleted",HttpStatus.OK); } //삭제파일 end
 * 
 * 
 * 
 * // 모든 파일은 내부적으로 bit 값을 가짐.(문서, 영상, 이미지, 소리) // 비트스트림을 재조합하여 파일로 구성
 * 
 * @GetMapping(value="/download",produces=MediaType.
 * APPLICATION_OCTET_STREAM_VALUE)
 * 
 * @ResponseBody public ResponseEntity<Resource> downloadFile(
 * 
 * @RequestHeader("User-Agent")String userAgent,String fileName){ //파일다운로드 //
 * 서버에 접속한 브라우저의 정보는 해더의User-Agent을 보면 알수 있음. // User-Agent: 유저가 브러우저 정보를 어디서
 * 보는지 판별
 * 
 * Resource resource = new FileSystemResource("c:\\upload\\"+fileName); //파일을
 * 리소스(자원: 가공처리를 위한 중간 단계)로 변경 log.info("resource :"+resource);
 * 
 * if(resource.exists()==false){
 * 
 * return new ResponseEntity<>(HttpStatus.NOT_FOUND); }
 * 
 * String resourceName= resource.getFilename(); // 리소스에 파일명을 찾아서 할당 String
 * resourceOriginalName = resourceName.substring( resourceName.indexOf("_")+1);
 * //uuid 를 제외한 파일명 만들기
 * 
 * HttpHeaders headers = new HttpHeaders();
 * 
 * try { String downloadName = null;
 * 
 * if(userAgent.contains("Trident")) { log.info("IE browser"); downloadName =
 * URLEncoder.encode(resourceOriginalName,"UTF-8").replaceAll("\\"," "); } else
 * if(userAgent.contains("Edge")) { log.info("Edge browser"); downloadName =
 * URLEncoder.encode( resourceOriginalName,"UTF-8");
 * 
 * 
 * }else { log.info("chrome browser"); downloadName = new
 * String(resourceOriginalName.getBytes("UTF-8") ,"ISO-8859-1"); }
 * log.info("downloadName :" +downloadName);
 * 
 * headers.add("Content-disposition","attachment; filename="+downloadName);
 * //해더에 파일 다운로드 정보 추가.
 * 
 * }catch (UnsupportedEncodingException e) { e.printStackTrace(); } return new
 * ResponseEntity<Resource>(resource,headers,HttpStatus.OK); }//파일 다운로드
 * 
 * 
 * 
 * 
 * 
 * //이미지 처리 Ajax
 * 
 * @ResponseBody
 * 
 * @RequestMapping(value = "/uploadAjax", method = RequestMethod.POST, produces
 * = "text/plain;charset=UTF-8") public String uploadAjax(MultipartFile file,
 * String str, HttpSession session, HttpServletRequest request, Model model)
 * throws Exception {
 * 
 * ResponseEntity<String> img_path = new ResponseEntity<>(
 * UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(),
 * file.getBytes()), HttpStatus.CREATED); String user_imgPath = (String)
 * img_path.getBody();
 * 
 * 
 * UserVO vo = new UserVO(); vo.setUser_profileImagePath(user_imgPath); UserVO
 * id = (UserVO) session.getAttribute("login");
 * 
 * vo.setUser_id(id.getUser_id());
 * 
 * 
 * return user_imgPath; }
 * 
 * @PreAuthorize("isAuthenticated()")
 * 
 * @ResponseBody
 * 
 * @RequestMapping("/displayFile") public ResponseEntity<byte[]>
 * displayFile(String fileName) throws Exception {
 * 
 * InputStream in = null; ResponseEntity<byte[]> entity = null;
 * 
 * 
 * try {
 * 
 * String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
 * 
 * MediaType mType = MediaUtils.getMediaType(formatName);
 * 
 * HttpHeaders headers = new HttpHeaders();
 * 
 * in = new FileInputStream(uploadPath + fileName);
 * 
 * if (mType != null) { headers.setContentType(mType); } else {
 * 
 * fileName = fileName.substring(fileName.indexOf("_") + 1);
 * 
 * headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
 * 
 * headers.add("Content-Disposition", "attachment; filename=\"" + new
 * String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\""); }
 * 
 * entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers,
 * HttpStatus.CREATED); } catch (Exception e) { e.printStackTrace(); entity =
 * new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST); } finally { in.close(); }
 * return entity; }
 * 
 * @ResponseBody
 * 
 * @RequestMapping(value = "/deleteFile", method = RequestMethod.POST) public
 * ResponseEntity<String> deleteFile(String fileName) {
 * 
 * 
 * String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
 * 
 * MediaType mType = MediaUtils.getMediaType(formatName);
 * 
 * if (mType != null) {
 * 
 * String front = fileName.substring(0, 12); String end =
 * fileName.substring(14); new File(uploadPath + (front + end).replace('/',
 * File.separatorChar)).delete(); }
 * 
 * new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();
 * 
 * return new ResponseEntity<String>("deleted", HttpStatus.OK); }
 * 
 * 
 * //이미지처리 Ajax end
 * 
 * 
 * 
 * }
 */