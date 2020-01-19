package kr.icia.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.icia.domain.BoardAttachVO;
import kr.icia.domain.BoardVO;
import kr.icia.domain.Criteria;
import kr.icia.domain.NewMemberVO;
import kr.icia.mapper.BoardAttachMapper;
import kr.icia.mapper.BoardMapper;
import kr.icia.mapper.MemberMapper;
import kr.icia.mapper.MemberdaoMapper;
import kr.icia.mapper.ReplyMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

//@Service: 컨트롤러와 db 사이에서 데이터 전달 역할을 맞는다
// 이라고 스프링 프레임 워크에 알림.

//@AllArgsConstructor : 모든 클래스 속성을 초기화 하는 생성자 만들기
// 생성자의 역할은: 필드의초기화 
//리턴 타입이 없고, 클래스명과 동일한 메소드명.
//생성자를 여러개 만들면서 전달값을 다르게 하면 오버로딩

@Log4j
@Service
//@AllArgsConstructor
public class BoardServiceImpl implements BoardService {

	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;

	@Setter(onMethod_= @Autowired)
	private BoardAttachMapper attachMapper;
	
	@Setter(onMethod_=@Autowired)
	private ReplyMapper replyMapper;
	
	@Setter(onMethod_=@Autowired)
	private MemberdaoMapper mem ;
	
	@Transactional
	@Override
	public void register(BoardVO board) {
		
		 log.info("register......."+board); 
		 mapper.insertSelectKey(board);
		
		 // 첨부파일이 없거나 사이즈가 0보다 낮다면
		 if(board.getAttachList()==null ||
				 board.getAttachList().size() <=0) {
			 return;
		 }
		 //첨부파일 만큼 반복
		 
		 board.getAttachList().forEach(attach->{
			 
		 attach.setBno(board.getBno());
		 
		 attachMapper.insert(attach);
			 
		 });
	}

	@Override
	public BoardVO get(Long bno) {
		log.info("get......" + bno);
		return mapper.read(bno);
	}

	@Override
	public boolean modify(BoardVO board) {
		log.info("modify........" + board);

		attachMapper.deletAll(board.getBno());
		boolean modifyResult = mapper.update(board)==1;
		
		
		int attachList =0;
		if(board.getAttachList() !=null)
			attachList = board.getAttachList().size();
		
		if(modifyResult && attachList > 0) {
			board.getAttachList().forEach(attach->{
				attach.setBno(board.getBno());
				attachMapper.insert(attach);
			});
		}
		
		return modifyResult;
	}
	
	@Transactional
	@Override
	public boolean remove(Long bno) {
		
		log.info("remove......." + bno);
		replyMapper.delete2(bno);
		attachMapper.deletAll(bno);
		
		return (mapper.delete(bno)) == 1;
		
		
	}

	@Override
	public List<BoardVO> getList(Criteria cri) {

		
		  log.info("getList..........");
		  
		  return mapper.getListWithPaging(cri);
		  

	}

	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count");

		return mapper.getTotalCount(cri);
	}

	@Override
	public List<BoardAttachVO> getAttachList(Long bno) {
		log.info("get Attach list by bno: "+bno);
		
		
		return attachMapper.findByBno(bno);
		// 게시물 번호 전달하고
		// 게시물 번호와 일치하는 첨부파일을 모두 리턴
	}


	

	
	
	
}
