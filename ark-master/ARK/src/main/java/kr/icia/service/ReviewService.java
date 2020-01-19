package kr.icia.service;

import java.util.List;

import kr.icia.domain.CategoryVO;
import kr.icia.domain.Criteria;
import kr.icia.domain.ReplyVO;
import kr.icia.domain.ReviewVO;

public interface ReviewService {
	
	public void register(ReviewVO review);
	
	public ReviewVO get(Long num);
	
	public boolean modify(ReviewVO review);
	
	public boolean remove(Long num);
	
	public List<ReviewVO>getList();

	public boolean count(Long num);
	
	public List<ReviewVO> getList(Criteria cri);
	
	public int getTotal(Criteria cri);

	
	public void registReply(ReplyVO reply);
	
	public List<ReplyVO> replyList(Long num);

	public void deleteReply(ReplyVO reply);
	
	public void modifyReply(ReplyVO reply);
	
	public List<CategoryVO> Category() ;
	
	public void deleteReplyAll(ReplyVO reply);
	
}
