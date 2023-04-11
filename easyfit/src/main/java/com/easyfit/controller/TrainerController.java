package com.easyfit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.easyfit.domain.Criteria;
import com.easyfit.domain.PageDTO;
import com.easyfit.service.TrainerService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/easyfit/*")
public class TrainerController {
	private TrainerService trainerService;	
	
	@GetMapping("/trainerList")//전체 회원 목록	
	public void allList(Criteria cri, Model model) {
		long total = trainerService.getCount(cri);
		model.addAttribute("trainerList", trainerService.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(total, cri));
	}	

	
}
