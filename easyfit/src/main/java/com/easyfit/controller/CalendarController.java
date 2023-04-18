package com.easyfit.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.easyfit.domain.ExerciseRecordVO;
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

		JSONObject jsonObj = new JSONObject();
		JSONArray jsonArr = new JSONArray();
		
		HashMap<String, Object> hash = new HashMap<>();
		
		for(int i = 0 ; i < list.size() ; i++) {
			hash.put("title", list.get(i).get("MNAME"));
			hash.put("start", list.get(i).get("EDATE"));
			hash.put("prno", String.valueOf(list.get(i).get("PRNO")));
			jsonObj = new JSONObject(hash);
			jsonArr.add(jsonObj);
		}
		log.info("jsonArrCheck: {}"+ jsonArr);


		return jsonArr;
	}
	@Transactional
	@PostMapping(value = "/calendarRegister", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> register(@RequestBody ExerciseRecordVO exerciseRecord, String mname){
		log.info("ExerciseRecordVO : " + exerciseRecord);
		
		int insertCount = calendarService.register(exerciseRecord, mname);
		calendarService.getPrcountUpdate(mname);
		return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value= "/calendarClientName", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE})
	public List <String> mnameList() {		
		List<String> mnameList = calendarService.mnameList();
		return mnameList;

		
	}
}

 