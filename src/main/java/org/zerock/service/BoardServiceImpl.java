package org.zerock.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.mapper.BoardMapper;

import lombok.RequiredArgsConstructor;
import lombok.ToString;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@RequiredArgsConstructor
@ToString
public class BoardServiceImpl implements BoardService{

	private final BoardMapper mapper;

//	@Override
//	public void register(BoardVO board) {
//		mapper.insert(board);
//	}
	
	//게시글 등록
	@Override
	public Long register(BoardVO board) {
		mapper.insertSelectKey(board);
		return board.getBno();
	}

	//게시글 조회
	@Override
	public BoardVO get(Long bno) {
		return mapper.read(bno);
	}

	//게시글 수정
	@Override
	public int modify(BoardVO board) {
		return mapper.update(board);
	}

	//게시글 삭제
	@Override
	public int remove(Long bno) {
		return mapper.delete(bno);
	}

	//게시판 리스트
	@Override
	public List<BoardVO> getList() {
		return mapper.getList();
	}

	//게시글 조회수
	@Override
	public int viewCount(Long bno) {
		return mapper.viewCount(bno);
	}

	//게시글 목록
	@Override
	public List<BoardVO> getList(Criteria cri) {
		return mapper.getListWithPaging(cri);
	}

	//전체 게시글 수
	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);
	}
}
