package kr.icia.service;

import javax.inject.Inject;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import kr.icia.domain.NewMemberVO;
import kr.icia.domain.NewpassVO;
import kr.icia.mapper.IdPwMapper;
import kr.icia.mapper.MemberMapper;
import kr.icia.mapper.NewMemberMapper;
import kr.icia.mapper.ReplyMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
@Service
@Log4j
public class NewMemberImpl implements NewMemberService {

	@Inject
	private NewMemberMapper mapper;
	
	
	@Inject
	private IdPwMapper idmapper;
	
	@Override
	public void insert(NewMemberVO member) {
		
		mapper.insert(member);
		
		

		
	}
	@Override
	public void insert2(NewMemberVO member) {
		
		mapper.insert2(member);
		
	}
	
	@Override
	public void update(NewMemberVO v) {
		
		
		idmapper.update(v);
	
		
	}
	@Override
	public int userIdCheck(@Param("id")String id) {
	
		return	mapper.getMapper(id);
		
	}
	@Override
	public void img(NewMemberVO member) {
		
		mapper.img(member);
	}
	@Override
	public String userIdCheck2(NewMemberVO v) {
		
		return mapper.userIdCheck2(v);
		
	}

}
