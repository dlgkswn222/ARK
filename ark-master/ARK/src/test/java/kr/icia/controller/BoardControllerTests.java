package kr.icia.controller;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

// WebAppConfiguration: 서블릿 설정을 하겠음을 알림.
// 나머지 어노테이션은 테스트를 위한 준비 .
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" })
@Log4j
public class BoardControllerTests {

	@Setter(onMethod_ = @Autowired)
	private WebApplicationContext ctx;
	// web 으로 프로그램 테스트를 위한 객체.

	private MockMvc mockMvc;
	// MockMvc : 모형.
	// mvc 모델 모형 객체.

	// junit
	
	
	// Before : 테스트 실행전에 먼저 실행 하라고알림
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	// 웹 어플리케이션에 띄워주기 위한 작업을 해준것이다
	
	
	 @Test public void testList() throws Exception{
	  log.info(mockMvc.perform(
			  MockMvcRequestBuilders.get("/board/list")
			  .param("pageNum", "2")
			  .param("amount", "10"))
	  .andReturn() .
	  getModelAndView() .
	  getModelMap());
	  
	  // board/list 요청에 대한 처리를 get 방식으로 하고 , 
	  // 그 결과를 (andReturn()) 받아서, 
	  // model 로전환하고(getModelAndView()) 
	  // 결과를 jsp 페이지로 출력(getModelMap())
	  
	  }

	 

	
	/*
	 * @Test public void testRgister()throws Exception{ String result =
	 * mockMvc.perform(MockMvcRequestBuilders.post("/board/register")
	 * .param("title","테스트 새글 제목") .param("content","테스트 새글내용")
	 * .param("writer","user")).andReturn().getModelAndView().getViewName();
	 * 
	 * // 포스트 요청으로 /board/register 발생되면, // 파라미터로 제목, 내용 , 작성자를 전달하고, // 그 결과를 받아서
	 * 전달할수 있는 mav 형태로 바꾸고, // 그 객체의 이름을 표시
	 * 
	 * log.info(result); }
	 */
	 
	
	/*
	 * @Test public void testGet()throws Exception{
	 * log.info(mockMvc.perform(MockMvcRequestBuilders.get("/board/get")
	 * .param("bno","4")) .andReturn() .getModelAndView() .getModelMap()); //2번 게시물
	 * 내용 읽기 }
	 */
	
	
	/*
	 * @Test public void testModify() throws Exception { String result
	 * =mockMvc.perform( MockMvcRequestBuilders.post("/board/modify")
	 * .param("bno","1").param("title","수정된 테스트 새글 제목").param("content",
	 * "수정된 테스트 새글내용").param("writer","user") ).andReturn() .getModelAndView()
	 * .getViewName(); log.info(result); }
	 */
	 

	
	/*
	 * @Test public void testRemove() throws Exception{ String result =
	 * mockMvc.perform(MockMvcRequestBuilders.post("/board/remove")
	 * .param("bno","1")) .andReturn().getModelAndView().getViewName();
	 * 
	 * log.info(result);
	 * 
	 * }
	 */
}
