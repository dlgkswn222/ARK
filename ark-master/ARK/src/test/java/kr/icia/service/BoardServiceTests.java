package kr.icia.service;


import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.icia.domain.BoardVO;
import kr.icia.domain.Criteria;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardServiceTests {
// 	어노테이션에 전달값이 여러개의 배열 형태라면 {} 이용
	@Setter(onMethod_= { @Autowired })
	private BoardService service;
	
	@Test
	public void testExist() {
		log.info(service);
		assertNotNull(service);
		// 전달 받은 값이 null이 아님을 확인
	}
	
	/*
	 * @Test public void testRegister() { BoardVO board = new BoardVO();
	 * board.setTitle("새로 작성하는글"); board.setContent("새로 작성하는 내용");
	 * board.setWriter("새로운 작성자");
	 * 
	 * service.register(board); log.info("생성된 게시물 번호:" + board.getBno()); }
	 */
	
	
	
	  @Test 
	  public void testGetList() {
	  service.getList(new Criteria(2,10)).forEach(board->log.info(board)); }
	 
	
	/*@Test
	public void testGet() {
		log.info(service.get(1L));
	}*/
	
	/*
	 * @Test public void testDelete() { log.info("remove result: "
	 * +service.remove(2L)); }
	 */
	
	/*
	 * @Test public void testUpdate() { BoardVO board= service.get(8L);
	 * if(board==null) return; board.setTitle("제묵을 수정합니다");
	 * log.info("modify result: "+service.modify(board));
	 * 
	 * }
	 */
	
}
