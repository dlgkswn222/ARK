package kr.icia.persistence;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.junit.Test;

import lombok.extern.log4j.Log4j;

// 시스템 실행 전에 정검을 위한 의존성이 log4j 
// 테스트 모듈을 동착하여 오류를 점검
@Log4j
public class JDBCTests {

	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception e) {
		e.printStackTrace();
		}
	}
	
//어노 테이션: 아래 메소드는 테스트 메소드이다.
//스프링프레임 워크과 개발자 사이의 암호가 어노테이션
@Test
public void testConnection() {
	
	try (Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","admin","1234")){
		log.info(con);
		// 로그로 커넥션 객체명을 출력.
	} catch (SQLException e) {
			
	fail(e.getMessage());
	}
}
}