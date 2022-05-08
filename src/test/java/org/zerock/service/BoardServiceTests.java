package org.zerock.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardServiceTests {

	@Autowired
	private BoardService service;
	
	@Test
	public void testPrint() {
		log.info(service);
	}
	
	@Test
	public void testGetList() {
		service.getList().forEach(board -> log.info(board));
	}
	
	@Test
	public void testRegister() {
		BoardVO vo = new BoardVO();
		vo.setTitle("BBB타이틀 테스트");
		vo.setContent("BBB컨텐츠 테스트");
		vo.setWriter("BBB작성자 테스트");
		
		long bno = service.register(vo);
		log.info("BNO : " + bno);
	}
	
	@Test
	public void testGet() {
		log.info(service.get(559L));
	}
	
	@Test
	public void testDelete() {
		int count = service.remove(520L);
		log.info("count>>>" + count);
	}
	
	@Test
	public void testUpdate() {
		BoardVO vo = service.get(474L);
		if(vo == null) {
			return;
		}
		
		vo.setTitle("힘내시오.");
		log.info("count>>>" + service.modify(vo));
	}
}
