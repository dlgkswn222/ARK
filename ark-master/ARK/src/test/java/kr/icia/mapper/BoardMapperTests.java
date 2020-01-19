package kr.icia.mapper;

import java.util.List;

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
public class BoardMapperTests {

	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;

	/*
	 * @Test public void testGetList() {
	 * 
	 * mapper.getList().forEach(board -> log.info(board));
	 * 
	 * }
	 */
	 
		//    한줄이담겨짐 ->   넘어와서 출력
					//  이걸 배열만큼 반복한다
			
		
		// 향상된 for : 배열과 배열 1개를 담을 변수

		// 람다식 : -> 를 기준으로 좌향을 전달값, 우향은 처리

		// 목록은 게시물 여러개(배열) , 그중 1개를 board 에 담은 다음에
		// 해당 내용을 로그로 출력. 배열 원소가 끝날때까지 반복
	

	
	  @Test 
	  public void testInsert() { 
		  BoardVO board= new BoardVO();
	  board.setTitle("새로 작성하는글"); 
	  board.setContent("새로 작성하는 내용");
	  board.setWriter("새로운 작성자");
	  
	  mapper.insert(board); log.info(board); }
	 

	/*
	 * @Test public void testInsertSelectKey() { BoardVO board= new BoardVO();
	 * board.setTitle("새로 작성하는글 SelectKey");
	 * board.setContent("새로 작성하는 내용SelectKey"); board.setWriter("새로운 작성자SelectKey");
	 * 
	 * mapper.insertSelectKey(board); log.info(board); }
	 */

	
	/*
	 * @Test public void testRead() { BoardVO board= mapper.read(5L);
	 * 
	 * log.info(board); }
	 */
	
	/*
	 * @Test public void tsetDelete() {
	 * 
	 * log.info("delete cnt: "+mapper.delete(3L));
	 * 
	 * 
	 * }
	 */
	
	
	/*
	 * @Test public void update(){ BoardVO board = new BoardVO(); board.setBno(5L);
	 * board.setTitle("수정된 제목"); board.setContent("수정된 내용");
	 * board.setWriter("user00");
	 * 
	 * int count=mapper.update(board); log.info("update cnt : " + count); }
	 */
	  
	/*
	 * @Test public void testPaging() { Criteria cri = new Criteria();
	 * 
	 * cri.setPageNum(3); cri.setAmount(10); List<BoardVO>
	 * list=mapper.getListWithPaging(cri); list.forEach(board ->
	 * log.info(board.getBno())); }
	 */
	
	/*
	 * @Test public void testSearch() { Criteria cri = new Criteria();
	 * cri.setKeyword("수"); cri.setType("TCW"); // 제목과 내용에서 "새로" 라는 말이 들어간 게시물 찾기 //
	 * T 제목 C 내용 W 작성자
	 * 
	 * List<BoardVO> list = mapper.getListWithPaging(cri);
	 * list.forEach(board->log.info(board)); }
	 */
}
