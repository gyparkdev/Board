package org.zerock.service;

import java.util.List;

import org.zerock.domain.ReplyVO;

public interface ReplyService {

	public List<ReplyVO> readReply(Long bno);
	
	public void writeReply(ReplyVO reply);
	
	//댓글 수정
	public void updateReply(ReplyVO reply);
	
	//댓글 삭제
	public void deleteReply(ReplyVO reply);
	
	//선택된 댓글 조회
	public ReplyVO selectReply(Long rno);

}
