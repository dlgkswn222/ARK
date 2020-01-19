package kr.icia.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import kr.icia.domain.MemberVO;
import kr.icia.domain.NewMemberVO;
import kr.icia.mapper.MemberMapper;
import kr.icia.security.domain.CustomUser;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
@Log4j
public class CustomUserDetailsService implements UserDetailsService {

	@Setter(onMethod_= {@Autowired})
	private MemberMapper memberMapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) 
			throws UsernameNotFoundException {
		log.warn("load user by userName : " +username);
		// WARN : 처리 가능한 문제, 향후 시스템 에러의 원인이 될 수 있는 경고성 메시지를 나타냄 

		
		
		NewMemberVO vo=memberMapper.read(username);
		// 전달된 id로 사용자 정보를 검색
		
		
		return vo==null?null:new CustomUser(vo);
		// 검색되지 않은면 널, 검색되면 해당정보를 리턴
		
	//입력된 아이디와 패스워드는 여기서 정보를 유저 디테일에 담아 로그인을 성공시키는것이다
	}

}
