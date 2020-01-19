package kr.icia.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.annotations.Param;

import kr.icia.domain.NewMemberVO;

import kr.icia.mapper.MemberdaoMapper;

public class MemberServiceImpl implements MemberService {

@Inject
private MemberdaoMapper memberDao;
	
	
	
	@Override
	public void update(NewMemberVO vo) {
		
		memberDao.update(vo);
		
	} 
	


}
