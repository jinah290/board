package org.board.test.service;

import java.util.List;

import org.board.test.domain.BoardVO;
import org.board.test.domain.Criteria;

public interface BoardService {

	// 글목록
	public List<BoardVO> list(); //select

	// 글보기
	public BoardVO view(Long no); //select

	// 글쓰기
	public Long write(BoardVO vo); //insert --selectKey 불러오기

	// 글수정
	public int update(BoardVO vo); //update

	// 글삭제
	public int delete(Long no); //delete
	
	//페이징
	public List<BoardVO> getList(Criteria cri);
	
	//전체 페이지 갯수
	public int getTotal(Criteria cri);
}


