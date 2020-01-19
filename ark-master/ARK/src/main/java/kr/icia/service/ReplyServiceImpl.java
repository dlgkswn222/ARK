package kr.icia.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.icia.domain.Criteria;
import kr.icia.domain.ReplyPageDTO;
import kr.icia.domain.ReplyVO;
import kr.icia.mapper.BoardMapper;
import kr.icia.mapper.ReplyMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReplyServiceImpl implements ReplyService {
	
	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private BoardMapper boardMapper;
	
	// 게시물 테이블과 덧글 테이블은 동시에 동작하거나 취소 되어야 함.
	// @Transactional 이용.
	
	
	@Transactional
	@Override
	public int register(ReplyVO vo) {
		log.info("register......"+vo);
		boardMapper.updateReplyCnt(vo.getBno(),1);
		return mapper.insert(vo);
	}

	@Override
	public ReplyVO read(Long rno) {
		log.info("get........."+rno);
		return mapper.read(rno);
	}

	@Override
	public int remove(Long rno) {
		log.info("remove"+rno);
		ReplyVO vo = mapper.read(rno);
		boardMapper.updateReplyCnt(vo.getBno(),-1);
		
		return mapper.delete(rno);
	}

	@Override
	public int modify(ReplyVO reply) {
		log.info("modify......"+reply);
		return mapper.update(reply);
	}
	

	@Override
	public List<ReplyVO> getList(Criteria cri, Long bno) {
		log.info("get Reply list"+bno);
		
		return mapper.getListWithPaging(cri, bno);
	}

	@Override
	public ReplyPageDTO getListPage(Criteria cri, Long bno) {
		
		return new ReplyPageDTO(mapper.getCountByBno(bno) ,
				mapper.getListWithPaging(cri, bno));
	}

	
	


}
