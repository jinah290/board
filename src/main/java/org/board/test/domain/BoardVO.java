package org.board.test.domain;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class BoardVO {

	private Long no;
	private String title;
	private String writer;
	private String content;
	private Date writeDate;
	private Date updateDate;

	// 이미지 데이터를 받는 변수 선온
	private MultipartFile imageFile;
	// 이미지 바꾸기나 삭제를 할 경우 지워질 파일 정보가 필요하다.
	private String deleteFileName;

}
