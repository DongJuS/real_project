package org.conan.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.conan.domain.Criteria;
import org.conan.domain.GetReplyVO;
import org.conan.domain.IngreVO;
import org.conan.domain.LikeVO;
import org.conan.domain.MemberVO;
import org.conan.domain.ProceVO;
import org.conan.domain.RecipeVO;
import org.conan.domain.SearchResultVO;
import org.conan.domain.pageDTO;
import org.conan.service.BoardService;
import org.conan.service.GetReplyService;
import org.conan.service.LikeService;
import org.conan.service.MemberService;
import org.conan.service.RecipeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/project/*")
@AllArgsConstructor
public class ProjectController {
	private RecipeService service;
	private BoardService board;
	private LikeService likes;
	private MemberService mservice;
	private GetReplyService rrService;

	@GetMapping("/main")
	public void main(HttpServletRequest request,Criteria cri, Model model) {
		log.info("메인페이지");
		Criteria cri1=new Criteria(1,7);
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("board", board.getList(cri1));
		List<RecipeVO> best = service.readBestRecipe();
		request.setAttribute("bestRecipe", best);
		List<RecipeVO> minrecip = service.readMinIngRecipe();
		model.addAttribute("minR", minrecip);
		
		
	}
	@GetMapping("/chatbot")
	public void chat(HttpServletRequest request) {
		log.info("chat");
	}
	

	  
	
	@GetMapping("/index")
	public void test(HttpServletRequest request) {
		log.info("겟으로 인덱스");
		
		
	}
	@GetMapping("/include/header")
	public void headerTest() {
		log.info("테스트");
	}
	@GetMapping("/include/footer")
	public void footerTest() {
		log.info("푸터테스트");
	}
	
	
	@GetMapping("/recipe/register")
	public void register() {
		log.info("글쓰기");
	}
	@GetMapping("/recipe/list")
	public void list(Criteria cri, Model model) {
		log.info("listlist : " + cri);
		model.addAttribute("list", service.getList(cri));
		int total = service.recipeCount(cri);
		log.info("total : " + total);
		model.addAttribute("pageMaker", new pageDTO(cri, total));
	}
	@PostMapping("/recipe/register")
	public String register(RecipeVO recipe,IngreVO ingre, ProceVO proce, RedirectAttributes rttr) {

		log.info("register: " + recipe);

		service.register(recipe);
		
		
		/*
		 * if(recipe.getFileupload()!=null) {
		 * recipe.getFileupload().forEach(fileupload->{ log.info(fileupload); }); }
		 * 
		 * log.info(recipe.getFileupload());
		 */
		List<IngreVO> list = new ArrayList<IngreVO>();
		List<ProceVO> prolist = new ArrayList<ProceVO>();
		String[] ing1 = ingre.getIngre_count().split(",");
		String[] ing2 = ingre.getIngre_name().split(",");
		String[] ing3 = ingre.getIngre_unit().split(",");
		String[] pro1 = proce.getTxt().split(",");
		String[] pro2 = proce.getPimg().split(",");
		for (int i = 0; i < ing1.length; i++) {
			list.add(new IngreVO(ing1[i], ing2[i], ing3[i]));
			log.info(i + "번째 " + ing1[i]);
		}
		for (int i = 0; i < pro1.length; i++) {
			prolist.add(new ProceVO(pro1[i], pro2[i]));
			log.info(i + "번째 " + pro1[i]);
		}

		/* log.info(str[1]); */
		service.register1(list);
		service.register2(prolist);

		rttr.addFlashAttribute("result", recipe.getRid());
		return "redirect: /project/recipe/list";
	}
	@GetMapping("/recipe/get")
	public void get(HttpServletRequest request, HttpSession session,@Param("rid") int rid, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("/get");
		 session = request.getSession();
		  MemberVO mvo = (MemberVO)session.getAttribute("member");
		List<GetReplyVO> rvoList = rrService.readRecipeReply(rid);
		model.addAttribute("recipe", service.readRecipe(rid));
		model.addAttribute("ingre", service.readIngre(rid));
		model.addAttribute("proce", service.readProce(rid));
		model.addAttribute("countLike", likes.countLike2(rid));
		model.addAttribute("rvoList", rvoList);
		
		/* model.addAttribute("like", likes.readLike(rid)); */
		System.out.println("rid는 : !!"+rid);
		System.out.println();
		if(mvo!=null) {
			int yesOrNo = likes.likeOrNot(new LikeVO(rid,mvo.getUserid()))==null?0:1;
			model.addAttribute("yesOrNo", yesOrNo);
		}
		
		 
	}
	
	@ResponseBody
	@RequestMapping(value = "/recipe/getLike")
	public LikeVO getLike(HttpServletRequest request,@RequestParam int rid,@RequestParam String uid) {
		
		int yesNo;
		if (likes.likeOrNot(new LikeVO(rid,uid))==null) {			//좋아요를 누른 적 없거나 지웠으면 null값 반환하니, null일 경우 insert
			likes.insertLike(new LikeVO(rid,uid));
			System.out.println("insert성공");
			likes.updateLikeCount(new LikeVO(rid,likes.countLike2(rid)+1,0));
			yesNo = 1;
		}
		else {			//좋아요를 누른 적 있으면 delete
			likes.deleteLike(new LikeVO(rid,uid));
			System.out.println("delete성공");
			likes.updateLikeCount(new LikeVO(rid,likes.countLike2(rid)-1,0));
			yesNo = 0;
		}
		int likeSum = likes.countLike2(rid)==null?0:likes.countLike2(rid);	//해당 글의 총 종아요 수를 불러온다.없으면 null이라서 0으로 바꾸어줌
		LikeVO toggleLike = new LikeVO(likeSum,yesNo);
		System.out.println("likeSum은 : "+likeSum);
		return toggleLike;
	}
	
	
	@PostMapping("/index") 
	public void toIndex(HttpServletRequest request, Criteria cri, Model model) {
		log.info("포스트로 인덱스페이지 이동");
		int maxIngsCount=0;		//모자른 재료갯수의 최댓값
//		List<HashMap<Integer, SearchResultVO>> haveAll = new ArrayList<HashMap<Integer, SearchResultVO>>();
		List<SearchResultVO> srvo = new ArrayList<SearchResultVO>();	//검색결과 리스트
		
		
		String[] searchList = request.getParameter("data1").split(",");
		Collection<String> sl = new ArrayList(Arrays.asList(searchList));
		//Collection<String> recipeListNames = new ArrayList(recipe.readIngreNames(0));
		//log.info(recipeListNames);	
		//log.info(recipeListNames.size());	
		//recipeListNames.removeAll(sl);
		//log.info(recipeListNames);	
		//log.info(recipeListNames.size());	


		for(int i=0;i<service.recipeCount()+3;i++) { 

			if (service.readIngreNames(i).size()==0) continue;
			
			Collection<String> rIngs= new ArrayList(service.readIngreNames(i)); //요리에 필요한 재료
			int rIngsCount = rIngs.size(); 		//레시피에 총 필요한 갯수
			rIngs.removeAll(sl); 						//요리필요재료 - 가지고있는재료교집합 = 필요한데 없는재료
			int needIngsCount = rIngs.size();			//나머지 필요한 갯수
			List<String> needIngs = new ArrayList(rIngs);
			Collection<String> rIngList2= new ArrayList(service.readIngreNames(i)); //요리에 필요한 재료
			rIngList2.removeAll(rIngs);
			List<String> haveIngs = new ArrayList(rIngList2);
			maxIngsCount = needIngsCount>maxIngsCount?needIngsCount:maxIngsCount;	//최대로 필요한 재료갯수
			RecipeVO aaa = service.readRecipe(i);		//i번 레시피의VO
			srvo.add(new SearchResultVO(i,service.readIngreNames(i),needIngs,haveIngs,aaa.getName(),aaa.getImg(),aaa.getSummary()));
			
		}

	         

		/* System.out.print(mmm); */
		List<String> yourIngs = new ArrayList<>(Arrays.asList(searchList));
		request.setAttribute("max", maxIngsCount);
		request.setAttribute("srvo", srvo);
		request.setAttribute("yourIngs", yourIngs);
		

		//Collection<String> searchli = new ArrayList(Arrays.asList(searchList));
		//Collection<String> listB = new ArrayList(Arrays.asList("간장","계란","들기름","밥","김가루"));

		/*
		 * set(searchList);
		 * 
		 * System.out.print(recipeNames-searchList);
		 */
	}
	@ResponseBody
	@PostMapping("recipe/replyInsert")
	public void replyInsert(HttpServletRequest request) {
		System.out.println("댓글작성메소드");
		int rid = Integer.parseInt(request.getParameter("rid"));
		String content = request.getParameter("content");
		String userId = request.getParameter("userId");
		GetReplyVO rvo = new GetReplyVO(rid, content, userId);
		rrService.insertGetReply(rvo); 		//인서트기능 완성
		System.out.println("댓글작성완료");
		/*
		 * GetReplyVO rvo1 = rvoList.get(0); System.out.println(rvo1.getContent());
		 * request.setAttribute("rvoList", rvoList);
		 */
	}
	
	@ResponseBody
	@PostMapping("recipe/replyUpdate")
	public void replyUpdate(HttpServletRequest request) {
		System.out.println("댓글수정메소드");
		int replyNo = Integer.parseInt(request.getParameter("replyNo"));
		String content = request.getParameter("content");
		
		GetReplyVO rvo = new GetReplyVO(replyNo, content);
		rrService.replyUpdate(rvo);
		System.out.println("댓글수정완료");
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/recipe/replyDelete")
	public void replyDelete(HttpServletRequest request,@RequestParam int rid,@RequestParam String userId,@RequestParam int replyNo) {
		System.out.println(rid);
		System.out.println(userId);
		System.out.println(replyNo);
		GetReplyVO rvo = new GetReplyVO(rid, userId, replyNo);
		rrService.replyDelete(rvo);
		System.out.println("댓글삭제완료");
		
	}
	
	/*
	 * @GetMapping("recipe/replyDelete") public
	 */



	/*
	 * @RequestMapping(value ="/index", method = RequestMethod.POST)
	 * 
	 * @ResponseBody public Object checkTestSave(
	 * 
	 * HttpServletRequest request, HttpServletResponse response,
	 * 
	 * @RequestParam(value="searchList[]") List<String> searchList,
	 * 
	 * ModelAndView mav) throws Exception { request.setCharacterEncoding("euc-kr");
	 * System.out.println(searchList); Map<String, Object> retVal = new
	 * HashMap<String,Object>(); retVal.put("code", "OK"); retVal.put("message",
	 * "�벑濡앹꽦怨�"); retVal.put("cookings", "cookings"); retVal.put("searchList",
	 * "searchList"); RequestDispatcher dp = request.getRequestDispatcher("index");
	 * request.setAttribute("searchList", searchList); dp.forward(request,
	 * response); response.sendRedirect("index");
	 * 
	 * 
	 * 
	 * return retVal;
	 * 
	 * }
	 */

}
