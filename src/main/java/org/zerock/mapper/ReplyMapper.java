package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.ReplyVO;

public interface ReplyMapper {

	//댓글조회
	public List<ReplyVO> readReply(Long bno); 
	
	//댓글작성
	public void writeReply(ReplyVO reply);
	
	//댓글수정
	public void updateReply(ReplyVO reply);
	
	//댓글삭제
	public void deleteReply(ReplyVO reply);
	
	//선택된 댓글 조회
	public ReplyVO selectReply(Long rno);
}
