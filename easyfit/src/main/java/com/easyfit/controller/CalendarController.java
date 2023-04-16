package com.easyfit.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.easyfit.service.CalendarService;

import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@RequestMapping("/easyfit/*")
public class CalendarController {	
	private final CalendarService calendarService;
	public CalendarController(CalendarService calendarService) {
		this.calendarService = calendarService;
	}

  //@GetMapping(value= "/calendar", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE})
	@GetMapping("/calendarDisplay")
	@ResponseBody
	public List<Map<String, Object>> calenList(){
		List<Map<String, Object>> list = calendarService.list();
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String tid = auth.getName();
		
		JSONObject jsonObj = new JSONObject();
		JSONArray jsonArr = new JSONArray();
		HashMap<String, Object> hash = new HashMap<>();
		
		for(int i = 0 ; i < list.size() ; i++) {
			hash.put("title", list.get(i).get("MNAME"));
			hash.put("start", list.get(i).get("EDATE"));
			jsonObj = new JSONObject(hash);
			jsonArr.add(jsonObj);
		}
		log.info("jsonArrCheck: {}"+ jsonArr + tid);


		return jsonArr;
	}
}
 