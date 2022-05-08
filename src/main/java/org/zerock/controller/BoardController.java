package org.zerock.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageDTO;
import org.zerock.domain.ReplyVO;
import org.zerock.service.BoardService;
import org.zerock.service.ReplyService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequiredArgsConstructor
@RequestMapping("/board/*")
@Log4j
public class BoardController {

	private final BoardService service;
	private final ReplyService replyService;
	
	//게시글 조회 Get
	@GetMapping("/list")
	public void list(Criteria cri, Model model) {
		log.info("===================");
		log.info(cri);
		log.info("list...............");
		
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, service.getTotal(cri)));
	}
	
	//게시글 작성 Get
	@GetMapping("/register")
	public void registerGet() {
		log.info("register get.........");
	}
	
	//게시글 작성 Post
	@PostMapping("/register")
	public String register(BoardVO board, RedirectAttributes rttr) {
		
		log.info("board>>>"+board);
		
		Long bno = service.register(board);
		log.info("BNO: " +bno);
		
		rttr.addFlashAttribute("result", bno);
		
		return "redirect:/board/list";
	}
	
	//게시판 조회 Get
	@GetMapping("/get")
	public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("get.............");
		service.viewCount(bno);
		model.addAttribute("board", service.get(bno));
		
		List<ReplyVO> replyList = replyService.readReply(bno);
		model.addAttribute("replyList", replyList);
	}
	
	//게시글 수정 Get
	@GetMapping("/modify")
	public void modify(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri ,Model model) {
		log.info("modify.............");
		model.addAttribute("board", service.get(bno));
	}
	
	//게시글 수정 Post
	@PostMapping("/modify")
	public String modify(BoardVO board, Criteria cri, RedirectAttributes rttr) {
		int count = service.modify(board);
		
		if(count == 1) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/board/list";
	}
	
	//게시글 삭제 Post
	@PostMapping("/remove")
	public String remove(Long bno, Criteria cri, RedirectAttributes rttr) {
		int count = service.remove(bno);
		
		if(count == 1) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());

		return "redirect:/board/list";
	}
	
	//댓글 작성 Post
	@PostMapping("/replyWrite")
	public String replyWrite(ReplyVO reply, Criteria cri, RedirectAttributes rttr) {
		log.info("reply write.....");
		
		replyService.writeReply(reply);
		
		rttr.addAttribute("bno", reply.getBno());
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/board/get";
	}
	
	//댓글 수정 Get
	@GetMapping("/replyUpdateView")
	public void replyUpdateView(ReplyVO reply, Criteria cri, Model model) {
		log.info("replyUpdateView.........");
		
		model.addAttribute("replyUpdate", replyService.selectReply(reply.getRno()));
		model.addAttribute("cri", cri);
	}
	
	//댓글 수정 Post
	@PostMapping("/replyUpdate")
	public String replyUpdate(ReplyVO reply, Criteria cri, RedirectAttributes rttr) {
		log.info("reply Update.....");
		
		replyService.updateReply(reply);
		
		rttr.addAttribute("bno", reply.getBno());
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/board/get";
	}
	
	//댓글 삭제 Post
	@PostMapping("/replyDelete")
	public String replyDelete(ReplyVO reply, Criteria cri, RedirectAttributes rttr) {
		log.info("reply Delete.....");
		
		replyService.deleteReply(reply);
		
		rttr.addAttribute("bno", reply.getBno());
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/board/get";
	}
}
