package kr.icia.mapper;

import java.util.List;
import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.icia.domain.Criteria;
import kr.icia.domain.ReplyVO;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyMapperTests {

	
	private Long[] bnoArr= {258L,257L,256L,255L,254L};
	
	@Setter(onMethod_=@Autowired)
	private ReplyMapper mapper;
	
	/*
	 * @Test public void testMapper() { log.info(mapper); }
	 */
	
	
	/*
	 * @Test public void testCreate() { // 정수형을 스트림 형태로 변환 , 범위는 1부터10까지
	 * IntStream.rangeClosed(1,10).forEach(i->{ReplyVO vo= new ReplyVO();
	 * 
	 * vo.setBno(bnoArr[0]); // 반복한다 1 2 3 4 0 1 2 3 4 0 vo.setReply("댓글 테스트"+i);
	 * vo.setReplyer("replyer "+i);
	 * 
	 * mapper.insert(vo); }); }
	 */
	 
	 
	
	/*
	 * @Test public void testRead() { Long targetRno = 5L; ReplyVO vo =
	 * mapper.read(targetRno); log.info(vo); }
	 */
	
	/*
	 * @Test public void testDelete() { Long targetRno = 1L;
	 * mapper.delete(targetRno);
	 * 
	 * }
	 */
	 

	/*
	 * @Test public void testUpdate() { Long targetRno=10L; ReplyVO vo =
	 * mapper.read(targetRno); vo.setReply("update reply");
	 * 
	 * int count = mapper.update(vo); log.info("update count: " +count);
	 * 
	 * }
	 */

	/*
	 * @Test public void testList() { Criteria cri = new Criteria(); List<ReplyVO>
	 * replies = mapper.getListWithPaging(cri,bnoArr[0]);
	 * replies.forEach(reply->log.info(reply));
	 * 
	 * }
	 */

@Test
public void testList2() {
	Criteria cri = new Criteria(3,2); //1,2
	
	List<ReplyVO>replies = mapper.getListWithPaging(cri, 258L);
	
	replies.forEach(reply->log.info(reply));
	
	
 }
	 
}
