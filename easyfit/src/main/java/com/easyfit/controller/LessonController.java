package com.easyfit.controller;

import java.text.SimpleDateFormat;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.easyfit.domain.Criteria;
import com.easyfit.domain.ExerciseRecordVO;
import com.easyfit.domain.PageDTO;
import com.easyfit.service.LessonService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/easyfit/*")
@AllArgsConstructor
public class LessonController {
	
private LessonService lessonService;

	// 뷰 페이지(jsp 파일) CRUD (JHR)

	// Home
	@GetMapping("")
	public void basic() {}
	
	// SELECT - LIST (PT기록)
	@GetMapping("/lessonList")
	public void lessonList(@ModelAttribute("cri") Criteria cri, Long tno, Model model) {		
	  //model.addAttribute("ptRecordList", lessonService.getTripleList(cri, tno));
	  //long total = lessonService.getPTRecordTotal(cri);
		
		model.addAttribute("ptRecordList", lessonService.getMyTripleList(cri, tno));  // (LJW)
		long total = lessonService.getMyPTRecordTotalCount(cri, tno);
		
		log.info("list : " + cri);
		log.info("total : " + total);
		
		model.addAttribute("pageMaker", new PageDTO(total, cri));
		model.addAttribute("tno", tno);
	}
	
	// SELECT - LIST (운동기록)
	@GetMapping("/lessonDetailList")
	public void lessonDetailList(@ModelAttribute("cri") Criteria cri, @RequestParam("prno") Long prno, @RequestParam("tno") Long tno, Model model) {		
		
		log.info("list : " + cri + " , " + prno);
		model.addAttribute("exerciseRecordList", lessonService.getDoubleList(cri, prno, tno));
		
		long total = lessonService.getExerciseRecordTotal(cri, prno);
		log.info("total : " + total);
		
		model.addAttribute("pageMaker", new PageDTO(total, cri));
	}
	
	// SELECT - GET
	@GetMapping("/lessonGet")
	public void get(@RequestParam("prno") Long prno, @RequestParam("edate") String edate, @RequestParam("tno") Long tno, @ModelAttribute("cri") Criteria cri, Model model) {
		
		log.info("lessonGet : " + prno + " , " + edate + " , " + tno);
		model.addAttribute("vo", lessonService.getGet(prno, edate, tno));
		
	}
	
	
	// INSERT
	@GetMapping("/lessonRegister")
	public void lessonRegister(@RequestParam("prno") Long prno, @RequestParam("tno") Long tno, Model model) {
		
		log.info("lessonRegister(get) : " + prno + " , " + tno);
		model.addAttribute("exerciseRecordList", lessonService.getDoubleListNotPaging(prno, tno));

	}
	
	// INSERT
	@Transactional
	@ResponseBody
	@PostMapping(value = "/lessonRegister", consumes="application/json") 
	public void lessonRegister(@RequestBody ExerciseRecordVO vo, @RequestParam("tno") Long tno) {
		
		log.info("lessonRegister(post) : " + vo);
		
	    lessonService.getRegister(vo); 
		lessonService.getPrcountUpdate(vo.getPrno());
		
	}
	
	
	// UPDATE
	@GetMapping("/lessonModify")
	public void lessonModify(@RequestParam("prno") Long prno, @RequestParam("edate") String edate, @RequestParam("tno") Long tno, Model model) {
		
		log.info("lessonModify(get) : " + prno + " , " + edate + " , " + tno);
		model.addAttribute("vo", lessonService.getGet(prno, edate, tno));
	}
	
	// UPDATE - 기입력 내용은 modify, 새로운 입력 내용은 register 해야 됨
	// 파라미터를 하나 추가 (selectbox, radio 등으로) 해서 보낸다. 받을 때 수정과 등록 데이터를 구분하고 서비스에서 for문 돌린다.
	// input type='hidden' name='update' value='u' => 배열 VO에 들어간다. 배열 변수 추가
	// input type='hidden' name='insert' value='i' => 배열 VO에 들어간다. 배열 변수 추가
	
 	@PostMapping("/lessonModify")
	public String lessonModify(ExerciseRecordVO vo, @RequestParam("tno") Long tno, RedirectAttributes rttr) {
										
		log.info("lessonModify(post)");
		lessonService.getModify(vo);
		
		rttr.addFlashAttribute("result", "수정");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return "redirect:/easyfit/lessonModify?prno=" + vo.getPrno() + "&edate=" + sdf.format(vo.getEdate()) + "&tno=" + tno;
		
	}
	
	// DELETE
	@Transactional
	@PostMapping("/lessonRemove")
	public String lesonRemove(@RequestParam("prno") Long prno, @RequestParam("edate") String edate, Long tno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		log.info("lessonRemove : " + prno + " , " + edate);
		
		if(lessonService.getRemove(prno, edate)) {
			rttr.addFlashAttribute("result", "삭제");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		lessonService.getPrcountUpdate(prno);
		
		return "redirect:/easyfit/lessonDetailList?prno=" + prno + "&tno=" + tno;
	}
}
