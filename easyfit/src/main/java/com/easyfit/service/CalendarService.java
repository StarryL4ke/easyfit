package com.easyfit.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.easyfit.domain.ExerciseRecordVO;
import com.easyfit.mapper.CalendarMapper;

import lombok.extern.log4j.Log4j;


@Log4j
@Service
public class CalendarService {
	@Autowired
	private CalendarMapper calendarMapper;
	//일정 목록
	public List<Map<String,Object>> list() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String tid = auth.getName();
		return calendarMapper.list(tid);
	}
	
	//일정 등록
	public int register(ExerciseRecordVO exerciseRecord, String mname) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String tid = auth.getName();
		log.info(exerciseRecord);

		return calendarMapper.register(exerciseRecord, tid, mname);
	}

}