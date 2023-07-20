package org.board.test.mapper;

import java.util.List;

import org.board.test.domain.BoardVO;
import org.board.test.domain.Criteria;

public interface BoardMapper {

	
	// 글목록
	public List<BoardVO> list(); // select

	// 글보기
	public BoardVO view(Long no); // select

	// 글쓰기
	public void write(BoardVO vo); // insert
	
	//selectKey
	public void writeSelectKey(BoardVO vo);

	// 글수정
	public int update(BoardVO vo); // update -> 몇건이 업데이트 되었는지 int

	// 글삭제
	public int delete(Long no); // delete -> 몇건인 삭제 되었는지int

	//페이징
	List<BoardVO> getlistWithPaging(Criteria cri);
	
	//전체 페이지 갯수
	public int getTotalCount(Criteria cri);
}
