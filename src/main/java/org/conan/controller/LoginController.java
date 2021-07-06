<<<<<<< HEAD
package org.conan.controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class LoginController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	
	@GetMapping("/login")
	public void main(HttpServletRequest request) {
		log.info("메인페이지");
	}
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String login() {
		return "login";
	}
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/loginProcess.do", method = RequestMethod.POST)
	public String loginProcess(@RequestParam String id, HttpServletRequest request) {
		
		logger.info("Welcome "+id);
		
    	HttpSession session = request.getSession();
    	session.setAttribute("id", id);
		return "chat";
	}
	
}

=======
package org.conan.controller;



import javax.servlet.http.HttpServletRequest;
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
	return "redirect:/main";
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
public String loginProc(HttpServletRequest request,  MemberVO vo, RedirectAttributes rttr) {
	log.info("loginProc!!");
	log.info(vo);
	HttpSession session = request.getSession();
	MemberVO lvo = service.login(vo); //lvo 揶쏅�れ뱽筌띾슢諭억옙堉긴빳�꼷苑� �룯�뜃由곤옙�넅 占쎈뻻占쎄땀
    if(lvo == null) {                                // 占쎌뵬燁살꼹釉�筌욑옙 占쎈륫占쎈뮉 占쎈툡占쎌뵠占쎈탵, �뜮袁⑨옙甕곕뜇�깈 占쎌뿯占쎌젾 野껋럩�뒭
        
        int result = 0;
        rttr.addFlashAttribute("result", result);
        return "redirect:/login";
        
    }
    
    session.setAttribute("member", lvo);             // 占쎌뵬燁살꼹釉�占쎈뮉 占쎈툡占쎌뵠占쎈탵, �뜮袁⑨옙甕곕뜇�깈 野껋럩�뒭 (嚥≪뮄�젃占쎌뵥 占쎄쉐�⑨옙)
    
    return "redirect:/main";
	
}
@PostMapping("/logout")
public String logout(HttpServletRequest request) {
	log.info("濡쒓렇�븘�썐");
	HttpSession session = request.getSession();
	session.invalidate();
	return "redirect:/main";
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
>>>>>>> origin/정배
