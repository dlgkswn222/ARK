package kr.icia.persistence;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.icia.mapper.TimeMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

// root-context.xml 에 있는 설정을 가지고 테스트를 진행.
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")

@Log4j
public class TimeMapperTests {
	//lombok 라이브러리를 이용하여 @Setter 어노테이션을 추가하면
	// 필드 속성이 셋터를 자동생성 . 참고 @Getter도있음

	@Setter(onMethod_=@Autowired)
private TimeMapper timeMapper;
//setBoardMapper(BoardMapper);
//onMethod_: 자동생성된 메소드 부분 전달값
//@Autowired : 자동 객체 생성.

@Test
public void testGetTime() {
		log.info(timeMapper.getClass().getName());
		log.info(timeMapper.getTime());
	}

	
	  @Test 
	  public void testGetTime2() { 
	  log.info("getTime2");
	  log.info(timeMapper.getTime2()); 
	  
	  }
	 

}
