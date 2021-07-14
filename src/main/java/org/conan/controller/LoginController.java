package org.conan.controller;



import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.conan.domain.MemberVO;
import org.conan.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/*")
public class LoginController {
	@Autowired
	MemberService service;
	
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public void Update() {
		log.info("정보수정");
	}
	@RequestMapping(value = "/UpdateProc" , method = RequestMethod.POST)
	public String UpdateProc(MemberVO vo,HttpServletRequest request) {
		log.info("vo"+vo);
		service.Update(vo);
		return null;
	}
	@GetMapping("/join")
	public void Join() {
		log.info("회원가입");
	}
	@GetMapping("/joinProc")
	public void join() {}
	@RequestMapping(value = "/joinProc", method = RequestMethod.POST)
	public String joinProc(MemberVO vo)throws Exception {
		log.info(vo);
		service.register(vo);
		return "redirect:/project/main";
	}
	@GetMapping("/main")
	public void main() {
		log.info("메인페이지");
	}
	@GetMapping("/login")
	public void login() {
		log.info("로그인");
	}
	@PostMapping("/loginProc")
	public String loginProc(HttpServletRequest request,  MemberVO vo, RedirectAttributes rttr)  {
	   log.info("loginProc!!");
	   log.info(vo);
	   HttpSession session = request.getSession();
	   MemberVO lvo = service.login(vo); //lvo 객체값 저장
	    if(lvo == null) {                                // 로그인하지않으면 로그인으로
	        
	        int result = 0;
	        rttr.addFlashAttribute("result", result);
	        return "redirect:/login";

	        
	        
	    }
	    
	    session.setAttribute("member", lvo);             //  lvo에 저장된 객체값을 member에다가 저장
	    
	    return "redirect:project/main";
	   
	}

	/*
	 * @PostMapping("/logout") public String logout(HttpServletRequest request) {
	 * log.info("濡쒓렇�븘�썐"); HttpSession session = request.getSession();
	 * session.invalidate(); return "redirect:/main"; }
	 */
	
	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		log.info("濡쒓렇�븘�썐");
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/project/main";
	}
	@GetMapping("/test")
	public String test(HttpSession session) {
		String id = (String)session.getAttribute("name");
		return null;
	}
	@RequestMapping(value = "/Idcheck", method = RequestMethod.POST)
	@ResponseBody
	public String Idcheck(String id) {
		log.info("아이디체크");
		int result = service.Idcheck(id);
		log.info("아이디는?? :" + result);
		if(result!=0) {
			return "fail";

		}else {
			return "success";
		}
	}
}
