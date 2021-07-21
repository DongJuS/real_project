package org.conan.controller;

import org.conan.domain.BoardVO;
import org.conan.domain.Criteria;
import org.conan.domain.pageDTO;
import org.conan.service.BoardService;
import org.conan.service.RecipeService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {
	private BoardService service;
	@GetMapping("/list") 
	public void list(Criteria cri, Model model) {
		log.info("list : "+cri);
		model.addAttribute("list", service.getList(cri));
		int total=service.getTotal(cri);
		log.info("total : "+ total);	
		model.addAttribute("pageMaker", new pageDTO(cri, total));
		
	}
	@GetMapping("/list2")
	public void list2(Criteria cri, Model model) {
		log.info("list2");
//		model.addAttribute("list2",service2.getList(cri));
		model.addAttribute("pageMaker", new pageDTO(cri, 123));
	}
    
    @GetMapping("/register")
    @PreAuthorize("isAuthenticated()")
    public void register() {
        
    }
    
    @PostMapping("/register")
    @PreAuthorize("isAuthenticated()")
    public String register(BoardVO board, RedirectAttributes rttr) {
        log.info("register : "+ board);
        service.register(board);
        rttr.addFlashAttribute("result", board.getBno());
        return "redirect:/board/list";
        
    }
    
    @GetMapping("/get")
    public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
        log.info("/get11 or /modify");
        model.addAttribute("board", service.get(bno));
        service.updateHits(bno);
    }
   
    @GetMapping("/modify")
    public void modify(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
        log.info("/get or /modify");
        model.addAttribute("board", service.get(bno));
    }
    @PreAuthorize("principal.username == #writer")
    @PostMapping("/modify")
    public String modify(BoardVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
        log.info("modify : "+board);
        if(service.modify(board)) {
            rttr.addFlashAttribute("result","success");
        }
        /*
         * rttr.addAttribute("pageNum", cri.getPageNum()); rttr.addAttribute("amount",
         * cri.getAmount()); rttr.addAttribute("keyword", cri.getKeyword());
         * rttr.addAttribute("type", cri.getType());
         */
        return "redirect:/board/list"+cri.getListLink();
    }
    @PreAuthorize("principal.username == #writer")
    @PostMapping("/remove")
    public String remove(@RequestParam("bno") Long bno,
             @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
        
        log.info("remove......."+bno);
        
        
        if(service.remove(bno)) {
            
            rttr.addFlashAttribute("result","success");

        }
        /*
         * rttr.addAttribute("pageNum", cri.getPageNum()); rttr.addAttribute("amount",
         * cri.getAmount()); rttr.addAttribute("keyword", cri.getKeyword());
         * rttr.addAttribute("type", cri.getType());
         */
        return "redirect:/board/list"+cri.getListLink();
        
    }

    

  

	

}
