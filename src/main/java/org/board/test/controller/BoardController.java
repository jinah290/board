package org.board.test.controller;

import org.board.test.domain.BoardVO;
import org.board.test.domain.Criteria;
import org.board.test.domain.PageDTO;
import org.board.test.service.BoardService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequiredArgsConstructor
@RequestMapping("/board")
@Log4j
public class BoardController {
	//service를 주입
	private final BoardService service;
	
	/*글목록
	@GetMapping("/list")
	public void list(Model model) {
		log.info("list 접속");
		model.addAttribute("list", service.list());	
	}*/
	
	//글목록 - 페이징추가
	@GetMapping("/list")
	public void list(Model model, Criteria cri) {
		
		log.info(cri);
		log.info("list 접속");
		
		model.addAttribute("list", service.getList(cri));	
		model.addAttribute("pageMaker", new PageDTO(cri, service.getTotal(cri)));
	}
	
	//글보기
	@GetMapping("/view")
	public void view(Model model, @RequestParam long no, @ModelAttribute("cri") Criteria cri) {
		log.info("view 접속");
		model.addAttribute("vo", service.view(no));
	}
	
	//글쓰기 폼
	@GetMapping("/write")
	public void writeForm() {
		log.info("write 접속");
		
	}
	
	//글쓰기 처리
	@PostMapping("/write")
	public String write(BoardVO vo,RedirectAttributes rttr) {
	
		log.info("write 완료 " + vo);
		
		Long no = service.write(vo);
		
		log.info("no: " + no);
		rttr.addFlashAttribute("result", no);
		
		return "redirect:/board/list";	
	}
	
	//글수정 폼
	@GetMapping("/update")
	public void update(Model model, @RequestParam long no, @ModelAttribute("cri") Criteria cri) {
		log.info("update 접속");
		model.addAttribute("vo", service.view(no));
	}
	
	//글수정 처리
	@PostMapping("/update")
	public String update(BoardVO vo, RedirectAttributes rttr, Criteria cri) {
		log.info("update 완료 " + vo);
		
		int count = service.update(vo);
		
		if(count == 1) {
			rttr.addFlashAttribute("result", "success");
		}
		
		//수정완료 후 보던 페이지로 이동(7페이지에서 수정시 수정완료 후에도 7페이지)
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/board/list";
	}
	
	//글삭제
	@PostMapping("/delete")
	public String delete(@RequestParam long no, RedirectAttributes rttr, Criteria cri) {
		
		log.info("delete 완료");
		
		int count = service.delete(no);
		
		if(count == 1) {
		rttr.addFlashAttribute("result", "success");
		}
		
		//수정완료 후 보던 페이지로 이동(7페이지에서 수정시 수정완료 후에도 7페이지)
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		return "redirect:/board/list";
		
	}
}
