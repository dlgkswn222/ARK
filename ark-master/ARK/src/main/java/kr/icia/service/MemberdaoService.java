package kr.icia.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.icia.domain.NewMemberVO;
import kr.icia.domain.UserVO;

public interface MemberdaoService {
		public void imgupdate(UserVO vo);
		
		public void update(NewMemberVO vo);
		
		public List<NewMemberVO> memberList();
		
		public NewMemberVO list(String userId);

		public void withdrawal(NewMemberVO vo);
		
		public NewMemberVO passCK(String id);
}
