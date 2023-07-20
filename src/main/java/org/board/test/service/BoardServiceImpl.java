package org.board.test.service;

import java.util.List;

import org.board.test.domain.BoardVO;
import org.board.test.domain.Criteria;
import org.board.test.mapper.BoardMapper;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import lombok.ToString;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@RequiredArgsConstructor
@ToString
public class BoardServiceImpl implements BoardService {

	private final BoardMapper mapper;
	
	@Override
	public List<BoardVO> list() {
		log.info("list..........");
		
		return mapper.list();
	}

	@Override
	public BoardVO view(Long no) {
		
		return mapper.view(no);
	}

	@Override
	public Long write(BoardVO vo) {
		
		 mapper.writeSelectKey(vo);
		 
		 return vo.getNo();

	}

	@Override
	public int update(BoardVO vo) {
		
		return mapper.update(vo);
	}

	@Override
	public int delete(Long no) {
		
		return mapper.delete(no);
	}

	@Override
	public List<BoardVO> getList(Criteria cri) {
		return mapper.getlistWithPaging(cri);
		
	}
	
	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);
	}
}
