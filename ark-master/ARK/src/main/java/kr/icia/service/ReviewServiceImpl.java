package kr.icia.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.icia.domain.CategoryVO;
import kr.icia.domain.Criteria;
import kr.icia.domain.ReplyVO;
import kr.icia.domain.ReviewVO;
import kr.icia.mapper.ReviewMapper;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class ReviewServiceImpl implements ReviewService {

	@Inject
	
		@Setter(onMethod_=@Autowired)
		private ReviewMapper mapper;
		
		@Transactional

	@Override
	public void register(ReviewVO review) {
	log.info("글작성"+review);
	
	mapper.register(review);
	}
	@Override
	public ReviewVO get(Long num) {
	log.info("상세보기"+num);
		return mapper.read(num);
	}

	@Override
	public boolean modify(ReviewVO review) {
		log.info("수정"+review);
		return mapper.update(review)==1;
	}

	@Override
	public boolean remove(Long num) {
		log.info("삭제"+num);
		return mapper.delete(num)==1;
	}

	@Override
	public List<ReviewVO> getList() {
		log.info("목록");
		return mapper.getList();
	}

	@Override
	public boolean count(Long num) {
		log.info("조회");
		return mapper.count(num);
	}
	@Override
	public List<ReviewVO> getList(Criteria cri) {
		log.info("페이징처리란다"+cri);
		return mapper.getListWithPaging(cri);
	}
	@Override
	public int getTotal(Criteria cri) {
		log.info("게시물 총량");
		return mapper.getTotalCount(cri);
	}
	@Override
	public List<ReplyVO> replyList(Long num) {
		return mapper.replyList(num);
	}
	@Override
	public void registReply(ReplyVO reply) {
		
		mapper.updateReplyCnt(reply.getNum(),1);
		
		 mapper.registReply(reply);
		
	}
	@Override
	public void deleteReply(ReplyVO reply) {
		mapper.deleteReply(reply);
		
	}
	@Override
	public void modifyReply(ReplyVO reply) {
		mapper.modifyReply(reply);
		
	}
	@Override
	public List<CategoryVO> Category() {
		return mapper.Category();
	}
	@Override
	public void deleteReplyAll(ReplyVO reply) {
			mapper.deleteReplyAll(reply);
	}

}
