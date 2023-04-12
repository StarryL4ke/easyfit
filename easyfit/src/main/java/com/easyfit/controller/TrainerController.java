package com.easyfit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.easyfit.domain.Criteria;
import com.easyfit.domain.PageDTO;
import com.easyfit.domain.TrainerAuthVO;
import com.easyfit.domain.TrainerVO;
import com.easyfit.service.TrainerService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/easyfit/*")
public class TrainerController {
	private TrainerService trainerService;
	@Setter(onMethod_ = @Autowired)
	private PasswordEncoder bcrypt;
	
	@GetMapping("/trainerList")//트레이너 목록
	public void allList(Criteria cri, Model model) {
		long total = trainerService.getCount(cri);
		model.addAttribute("trainerList", trainerService.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(total, cri));
	}
	
	@GetMapping("/trainerGet")//트레이너 정보
	public void get(@RequestParam("tno") Long tno, Model model) {
		model.addAttribute("trainer", trainerService.getGet(tno));
	}
	
	@GetMapping("/trainerRegister")//트레이너 등록(GET)
	public void register(TrainerVO trainer, Model model) {
		model.addAttribute("result", trainer.getTno());
	}
	
	@PostMapping("/trainerRegister")//트레이너 등록(POST)
	public String register(TrainerVO trainer, TrainerAuthVO trainerAuth, RedirectAttributes rttr) {
		String bcryptPassword = bcrypt.encode(trainer.getTpassword());
		trainer.setTpassword(bcryptPassword);
		trainerService.getRegisterSelectKey(trainer);
		trainerService.getAuthRegister(trainerAuth);
		rttr.addFlashAttribute("result", trainer.getTno());
		return "redirect:/easyfit/trainerList";
	}

	
}
