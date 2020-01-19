package kr.icia.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.icia.domain.CategoryVO;
import kr.icia.domain.Criteria;
import kr.icia.domain.ReplyVO;
import kr.icia.domain.ReviewVO;

public interface ReviewMapper {

	public List<ReviewVO> getList();
	
	public void register(ReviewVO review);
	
	public ReviewVO read(Long num);
	
	public int delete(Long num);
	
	public boolean count(Long num);

	public int update(ReviewVO review);
	
	public List<ReviewVO> getListWithPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);
	
	public void updateReplyCnt(@Param("num") Long num
			, @Param("amount") int amount);

	public List<ReplyVO> replyList(Long num);

	public void registReply(ReplyVO reply);

	public void deleteReply(ReplyVO reply);

	public void modifyReply(ReplyVO reply);
	
	public List<CategoryVO> Category();
	
	public void deleteReplyAll(ReplyVO reply);
}

