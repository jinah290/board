package org.board.test.service;

import org.board.test.domain.BoardVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

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
	public void testlist() {
		
		service.list().forEach(board->log.info(board));
	}
	
	@Test
	public void testWrite() {
		
		BoardVO vo = new BoardVO();
		vo.setTitle("test");
		vo.setContent("content");
		vo.setWriter("writer");
		
		long no = service.write(vo);
		log.info("no :" + no);
	}

}
