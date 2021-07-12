package org.conan.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.conan.domain.IngreVO;
import org.conan.domain.ProceVO;
import org.conan.domain.RecipeVO;
import org.conan.domain.SearchResultVO;
import org.conan.mapper.RecipeMapper;
import org.conan.service.BoardService;
import org.conan.service.RecipeService;
import org.conan.domain.BoardVO;
import org.conan.domain.Criteria;
import org.conan.domain.pageDTO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
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

	@GetMapping("/main")
	public void main(HttpServletRequest request,Criteria cri, Model model) {
		log.info("메인페이지");
		Criteria cri1=new Criteria(1,7);
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("board", board.getList(cri1)); 
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
	public void get(@RequestParam("rid") int rid, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("/get");
		model.addAttribute("recipe", service.readRecipe(rid));
		model.addAttribute("ingre", service.readIngre(rid));
		model.addAttribute("proce", service.readProce(rid));
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
