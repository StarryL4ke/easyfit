package com.easyfit.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.easyfit.controller.CalendarController;
import com.easyfit.mapper.CalendarMapper;



@Service
public class CalendarService {
	@Autowired
	private CalendarMapper calendarMapper;


	public List<Map<String,Object>> list() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String tid = auth.getName();
		return calendarMapper.list(tid);
	}

}
