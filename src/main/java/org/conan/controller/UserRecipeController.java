package org.conan.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;



import org.conan.domain.Criteria;
import org.conan.domain.UploadFile;
import org.conan.domain.UrSearchResultVO;
import org.conan.domain.UserIngreVO;
import org.conan.domain.UserProceVO;
import org.conan.domain.UserRecipeVO;
import org.conan.domain.pageDTO;
import org.conan.service.UserRecipeService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("project/urrecipe/*")
@AllArgsConstructor
public class UserRecipeController {
	private UserRecipeService service;

	 @RequestMapping(value = "/list")
	public void list(Model model, Criteria cri) {
		model.addAttribute("list", service.getList(cri));
		int total = service.urrecipeCount(cri);
		model.addAttribute("pageMaker", new pageDTO(cri, total));
	}
	

	@GetMapping("/get")
	public void get(@RequestParam("urrid") int urrid, Model model) {
		model.addAttribute("recipe", service.get(urrid));
		model.addAttribute("ingre", service.getingre(urrid));
		model.addAttribute("proce", service.getproce(urrid));
	}

	@PostMapping("/register")
	public String register(UserRecipeVO urrecipe, UserIngreVO uringre, UserProceVO urproce, RedirectAttributes rttr) {
		log.info("register: " + urrecipe);

		service.register(urrecipe);

		if (urrecipe.getUploadFile() != null) {
			urrecipe.getUploadFile().forEach(uploadFile -> {
				log.info(uploadFile);
			});
		}

		log.info(urrecipe.getUploadFile());

		List<UserIngreVO> list = new ArrayList<UserIngreVO>();
		List<UserProceVO> prolist = new ArrayList<UserProceVO>();
		String[] ing1 = uringre.getUrIngre_name().split(",");
		String[] ing2 = uringre.getUrIngre_count().split(",");
		String[] ing3 = uringre.getUrIngre_unit().split(",");
		String[] pro1 = urproce.getUrtxt().split(",");
		// String[] pro2 = urproce.getSeq().split(",");
		for (int i = 0; i < ing1.length; i++) {
			list.add(new UserIngreVO(ing1[i], ing2[i], ing3[i]));
			log.info(i + "번째 " + ing1[i]);
		}
		for (int i = 0; i < pro1.length; i++) {
			prolist.add(new UserProceVO(pro1[i]));
			log.info(i + "번째 " + pro1[i]);
		}

		/* log.info(str[1]); */
		service.register1(list);
		service.register2(prolist);

		rttr.addFlashAttribute("result", urrecipe.getUrrid());
		return "redirect: /project/urrecipe/list";
	}

	@GetMapping("/register")
	public void register() {

	}

	@GetMapping(value = "/uploadFile", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<List<UploadFile>> uploadList(int urrid) {
		// log.info("uploadList " + urrid);
		return new ResponseEntity<>(service.uploadlist(urrid), HttpStatus.OK);
	}

	@GetMapping(value = "/allImg", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<List<UploadFile>> allImg() {
		log.info("allImg ");
		return new ResponseEntity<>(service.allimg(), HttpStatus.OK);
	}

	@GetMapping("/remove")
	public String remove(@RequestParam("urrid") int urrid, RedirectAttributes rttr,Criteria cri) {
		if (service.remove(urrid)) {
			rttr.addFlashAttribute("result", "success");
		}
		if (service.removeingre(urrid)) {
			rttr.addFlashAttribute("result", "success");
		}
		if (service.removeproce(urrid)) {
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect: /project/urrecipe/list";
	}
	
	@PostMapping("/searching")
	public void search(@RequestParam("data1") String data1, Model model, Criteria cri) {
		log.info(data1);
		int maxIngsCount=0;
		List<UrSearchResultVO> usrv=new ArrayList<UrSearchResultVO>();
		
		String[] search=data1.split(",");
		Collection<String> sl=new ArrayList<>(Arrays.asList(search));
		//log.info(search[1]);
		//log.info(search.length);
		log.info(service.urrecipeCount());
		for(int i=1; i<=service.urrecipeCount(); i++) {
			if(service.readIngreNames(i).size()==0) continue;
			
			Collection<String> rIngs=new ArrayList(service.readIngreNames(i));
			int rIngsCount=rIngs.size();
			rIngs.removeAll(sl);
			int needIngsCount=rIngs.size();
			List<String> needIngs=new ArrayList(rIngs);
			Collection<String> rIngList2=new ArrayList(service.readIngreNames(i));
			rIngList2.removeAll(rIngs);
			List<String> havaIngs=new ArrayList(rIngList2);
			maxIngsCount=needIngsCount>maxIngsCount?needIngsCount:maxIngsCount;
			UserRecipeVO aaa=service.get(i);
			usrv.add(new UrSearchResultVO(i, service.readIngreNames(i), needIngs, havaIngs, aaa.getUrname(), aaa.getUrsummary()));
			
		}
		List<String> yourIngs=new ArrayList<>(Arrays.asList(search));
		model.addAttribute("max", maxIngsCount);
		model.addAttribute("usrv", usrv);
		model.addAttribute("yourIngs", yourIngs);
		log.info(usrv);
		int total = service.urrecipeCount(cri);
		model.addAttribute("pageMaker", new pageDTO(cri, total));
	}
	
	@GetMapping("/modify")
	public void modify(@RequestParam("urrid") int urrid, Model model) {
		model.addAttribute("recipe", service.get(urrid));
		model.addAttribute("ingre", service.getingre(urrid));
		model.addAttribute("proce", service.getproce(urrid));
		
	}
	
	

}
