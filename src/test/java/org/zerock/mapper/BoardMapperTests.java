package org.zerock.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageDTO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {

	@Autowired
	private BoardMapper boardMapper;
	
	@Test
	public void testGetList() {
		log.info("========================");
		boardMapper.getList();
	}
	
	@Test
	public void testInsert() {
		BoardVO vo = new BoardVO();
		vo.setTitle("test 테스트");
		vo.setContent("content 테스트");
		vo.setWriter("tester");
		
		boardMapper.insert(vo);
		log.info("===============");
		log.info("after insert " + vo.getBno());
	}
	
	@Test
	public void testInsertSelectKey() {
		BoardVO vo = new BoardVO();
		vo.setTitle("AAAtest 테스트");
		vo.setContent("AAAcontent 테스트");
		vo.setWriter("AAAtester");
		
		boardMapper.insertSelectKey(vo);
		log.info("===============");
		log.info("after insert selectkey " + vo.getBno());
	}
	
	@Test
	public void testRead() {
		BoardVO vo = boardMapper.read(602L);
		log.info(vo);
	}
	
	@Test
	public void testDelete() {
		int count = boardMapper.delete(560L);
		log.info("count: " + count);
	}
	
	@Test
	public void testUpdate() {
		BoardVO vo = new BoardVO();
		vo.setBno(561L);
		vo.setTitle("Update title");
		vo.setContent("Update content");
		vo.setWriter("user00");
		
		int count = boardMapper.update(vo);
		log.info("count===>" + count);
	}
	
	@Test
	public void testPaging() {
		Criteria cri = new Criteria();
		
		List<BoardVO> list = boardMapper.getListWithPaging(cri);
		list.forEach(b -> log.info(b));
	}
	
	@Test
	public void testPageDTO() {
		Criteria cri = new Criteria();
		cri.setPageNum(25);
		PageDTO pageDTO = new PageDTO(cri, 251);
		
		log.info(pageDTO);
	}
	
//	@Test
//	public void testSearch() {
//		Map<String, String> map = new HashMap<>();
//		map.put("T", "TTT");
//		map.put("C", "CCC");
//		
//		Map<String, Map<String, String>> outer = new HashMap<>();
//		outer.put("map", map);
//		
//		List<BoardVO> list = boardMapper.searchTest(outer);
//		log.info(list);
//	}
	
	@Test
	public void testSearchPaging() {
		Criteria cri = new Criteria();
		cri.setType("TCW");
		cri.setKeyword("11");
		
		List<BoardVO> list = boardMapper.getListWithPaging(cri);
		list.forEach(b -> log.info(b));
	}
}
