package com.easyfit.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.easyfit.domain.DateData;
import com.easyfit.domain.ScheduleVO;
import com.easyfit.mapper.ScheduleMapper;
//import com.easyfit.service.ScheduleService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/easyfit/*")
public class ScheduleController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	//private ScheduleService scheduleService;
	
	private static final SqlSession sqlSession = null;

	@GetMapping("/calendar")
	public String calendar(Model model, DateData dateData) {
		
		Calendar cal = Calendar.getInstance();
		DateData calendarData;
		// 검색 날짜
		if (dateData.getDate().equals("") && dateData.getMonth().equals("")) {
			dateData = new DateData(String.valueOf(cal.get(Calendar.YEAR)), String.valueOf(cal.get(Calendar.MONTH)),
					String.valueOf(cal.get(Calendar.DATE)), null, null);
		}

		Map<String, Integer> today_info = dateData.today_info(dateData);
		List<DateData> dateList = new ArrayList<DateData>();

		
		// 검색 날짜 end
		ScheduleMapper scheduleMapper =  sqlSession.getMapper(ScheduleMapper.class);
		ArrayList<ScheduleVO> list = scheduleMapper.list(dateData);		
		
		
		//scheduleService.getList(dateData);
		
		// 달력데이터에 넣기 위한 배열 추가
		ScheduleVO[][] schedule_data_arr = new ScheduleVO[32][4];
		if (list.isEmpty() != true) { 
			int j = 0;
			for (int i = 0; i < list.size(); i++) {
				int date = Integer.parseInt(String.valueOf(list.get(i).getSchedule_date()).substring(
						String.valueOf(list.get(i).getSchedule_date()).length() - 2,
						String.valueOf(list.get(i).getSchedule_date()).length()));
				if (i > 0) {
					int date_before = Integer.parseInt(String.valueOf(list.get(i - 1).getSchedule_date())
							.substring(String.valueOf(list.get(i - 1).getSchedule_date()).length() - 2,
									String.valueOf(list.get(i - 1).getSchedule_date()).length()));
					if (date_before == date) {
						j = j + 1;
						schedule_data_arr[date][j] = list.get(i);
					} else {
						j = 0;
						schedule_data_arr[date][j] = list.get(i);
					}
				} else {
					schedule_data_arr[date][j] = list.get(i);
				}
			}
		}

		// 실질적인 달력 데이터 리스트에 데이터 삽입 시작.
		// 일단 시작 인덱스까지 아무것도 없는 데이터 삽입
		for (int i = 1; i < today_info.get("start"); i++) {
			calendarData = new DateData(null, null, null, null, null);
			dateList.add(calendarData);
		}

		// 날짜 삽입
		for (int i = today_info.get("startDay"); i <= today_info.get("endDay"); i++) {
			ScheduleVO[] schedule_data_arr3 = new ScheduleVO[4];
			schedule_data_arr3 = schedule_data_arr[i];

			if (i == today_info.get("today")) {
				calendarData = new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()),
						String.valueOf(i), "today", schedule_data_arr3);
			} else {
				calendarData = new DateData(String.valueOf(dateData.getYear()), String.valueOf(dateData.getMonth()),
						String.valueOf(i), "normal_date", schedule_data_arr3);
			}
			dateList.add(calendarData);

		}

		// 달력 빈 곳 빈 데이터로 삽입
		int index = 7 - dateList.size() % 7;

		if (dateList.size() % 7 != 0) {

			for (int i = 0; i < index; i++) {
				calendarData = new DateData(null, null, null, null, null);
				dateList.add(calendarData);
			}
		}

		// 배열에 담음
		model.addAttribute("dateList", dateList); // 날짜 데이터 배열
		model.addAttribute("today_info", today_info);
		return "easyfit/calendar";
	}

	@GetMapping("/scheduleRegister")
	public String register(ScheduleVO schedule, RedirectAttributes rttr) {
		ScheduleMapper scheduleMapper = sqlSession.getMapper(ScheduleMapper.class);
		int count = scheduleMapper.before_schedule_add_search(schedule);
		String message = "";
		String url = "redirect:easyfit/calendar";

		if (count >= 4) {
			message = "스케쥴은 최대 4개만 등록 가능합니다.";
		} else {
			scheduleMapper.register(schedule);
			message = "스케쥴이 등록되었습니다";
		}

		rttr.addFlashAttribute("message", message);
		return url;
	}

		
	@GetMapping("/scheduleGet")
	public String get(Model model, @RequestParam("schedule_idx") int idx, RedirectAttributes rttr) {
		ScheduleMapper scheduleMapper = sqlSession.getMapper(ScheduleMapper.class);
		String url = "redirect:easyfit/calendar";
		scheduleMapper.get(idx);
		model.addAttribute("schedule_show",scheduleMapper.get(idx));
		return null;
	}
	
	@GetMapping("/scheduleModify")
	public String modify(Model model, ScheduleVO schedule, RedirectAttributes rttr) {
		ScheduleMapper scheduleMapper = sqlSession.getMapper(ScheduleMapper.class);
		scheduleMapper.update(schedule);
		model.addAttribute("schedule_modify",scheduleMapper.update(schedule));
		return "/scheduleModify";
	}
	
	@GetMapping("/scheduleRemove")
	public String remove(Model model, ScheduleVO schedule, RedirectAttributes rttr) {
		ScheduleMapper scheduleMapper = sqlSession.getMapper(ScheduleMapper.class);
		scheduleMapper.remove(schedule);
		model.addAttribute("schedule_delete",scheduleMapper.remove(schedule));
		return null;
	}
}
