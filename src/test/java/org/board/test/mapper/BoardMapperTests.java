package org.board.test.mapper;

import java.util.List;

import org.board.test.domain.BoardVO;
import org.board.test.domain.Criteria;
import org.board.test.domain.PageDTO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
//mybatis이용 테스트
public class BoardMapperTests {
	
	@Autowired
	private BoardMapper boardMapper;

	@Test
	public void testlist() {
		
		log.info("--------------------");
		boardMapper.list();
		
	}
	
	@Test
	public void testwrite() {
		
		BoardVO vo = new BoardVO();
		vo.setTitle("test");
		vo.setContent("content");
		vo.setWriter("writer");
		
		boardMapper.write(vo);
		log.info("------------------------");
		log.info("after write " + vo.getNo());
	}
	
	@Test
	public void testwriteSelectKey() {
		
		BoardVO vo = new BoardVO();
		vo.setTitle("aaatest");
		vo.setContent("aaacontent");
		vo.setWriter("aaawriter");
		
		boardMapper.writeSelectKey(vo);
		log.info("------------------------");
		log.info("after writeSelectKey " + vo.getNo());
	}
	
	@Test
	public void view() {
		
		BoardVO vo = boardMapper.view(3L);
		log.info(vo);
	}
	
	@Test
	public void delete() {
		
		int count = boardMapper.delete(1L);
		log.info(count);
	}
	
	@Test
	public void update() {
		BoardVO vo = new BoardVO();
		vo.setNo(2L);
		vo.setTitle("update title");
		vo.setContent("update content");
		vo.setWriter("update writer");
	log.info("count: " + boardMapper.update(vo));	
	
	}
	@Test
	public void testPaging() {
		Criteria cri = new Criteria();
		
		List<BoardVO> list = boardMapper.getlistWithPaging(cri);
		
		list.forEach(b -> log.info(b));
	}
	
	@Test
	public void testPageDTO() {
		Criteria cri = new Criteria();
		cri.setPageNum(21);
		
		PageDTO pageDTO = new PageDTO(cri, 251);
		
		log.info(pageDTO);
		
	}
}


