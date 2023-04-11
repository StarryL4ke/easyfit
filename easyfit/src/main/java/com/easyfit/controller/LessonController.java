package com.easyfit.controller;

import java.text.SimpleDateFormat;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.easyfit.domain.Criteria;
import com.easyfit.domain.ExerciseRecordVO;
import com.easyfit.domain.ExerciseTypeVO;
import com.easyfit.domain.PageDTO;
import com.easyfit.service.LessonService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/easyfit/*")
public class LessonController {
	
private LessonService lessonService;
	
	// Home
	@GetMapping("")
	public void basic() {}
	
	// SELECT - LIST (PT기록)
	@GetMapping("/lessonList")
	public void lessonList(@ModelAttribute("cri") Criteria cri, long tno, Model model) {		
	  //model.addAttribute("ptRecordList", lessonService.getTripleList(cri, tno));
	  //long total = lessonService.getPTRecordTotal(cri);
		
		model.addAttribute("ptRecordList", lessonService.getMyTripleList(cri, tno));
		long total = lessonService.getMyPTRecordTotalCount(tno);
		
		log.info("list : " + cri);
		log.info("total : " + total);
		
		model.addAttribute("pageMaker", new PageDTO(total, cri));
		model.addAttribute("tno", tno);
	}
	
	// SELECT - LIST (운동기록)
	@GetMapping("/lessonDetailList")
	public void lessonDetailList(@ModelAttribute("cri") Criteria cri, @RequestParam("prno") Long prno, Model model) {		
		
		log.info("list : " + cri + " , " + prno);
		model.addAttribute("exerciseRecordList", lessonService.getDoubleList(cri, prno));
		
		long total = lessonService.getExerciseRecordTotal(cri, prno);
		log.info("total : " + total);
		
		model.addAttribute("pageMaker", new PageDTO(total, cri));
	}
	
	// SELECT - GET
	@GetMapping("/lessonGet")
	public void get(@RequestParam("prno") Long prno, @RequestParam("edate") String edate, @ModelAttribute("cri") Criteria cri, Model model) {
		
		log.info("lessonGet : " + prno + " , " + edate);
		model.addAttribute("vo", lessonService.getGet(prno, edate));
	}
	
	
	// INSERT
	@GetMapping("/lessonRegister")
	public void lessonRegister() {}
	
	// INSERT
	@Transactional
	@PostMapping("/lessonRegister") 
	public String lessonRegister(ExerciseRecordVO vo, RedirectAttributes rttr) {
		
		log.info("lessonRegister: " + vo);
		lessonService.getRegister(vo);
		rttr.addFlashAttribute("result", vo.getErno());
		
		lessonService.getPrcountUpdate(vo.getPrno());
		
		return "redirect:/easyfit/lessonList"; 
	}
	
	
	// UPDATE
	@GetMapping("/lessonModify")
	public void lessonModify(@RequestParam("prno") Long prno, ExerciseTypeVO et, @RequestParam("edate") String edate, Model model) {
		
		log.info("lessonModify : " + prno + " , " + edate);
		model.addAttribute("vo", lessonService.getGet(prno, edate));
	}
	
	// UPDATE
	@PostMapping("/lessonModify")
	public String lessonModify(ExerciseRecordVO vo, Model model) {
										
		log.info("lessonModify : " + vo);
		
		lessonService.getModify(vo);

		//model.addAttribute("prno", vo.getPrno());   // rttr : 주소 바뀔 때 사용, model ; 주소 바뀌지 않을 때 사용
		//model.addAttribute("edate", vo.getEdate());
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		return "redirect:/easyfit/lessonModify?prno=" + vo.getPrno() + "&edate=" + sdf.format(vo.getEdate());
		
	}
	
	// DELETE
	@Transactional
	@PostMapping("/lessonRemove")
	public String lesonRemove(@RequestParam("prno") Long prno, @RequestParam("edate") String edate, RedirectAttributes rttr) {
		
		log.info("lessonRemove : " + prno + " , " + edate);
		
		if(lessonService.getRemove(prno, edate)) {
			rttr.addFlashAttribute("result", "삭제");
		}
		
		lessonService.getPrcountUpdate(prno);
		
		return "redirect:/easyfit/lessonDetailList?prno=" + prno;
	}
}
