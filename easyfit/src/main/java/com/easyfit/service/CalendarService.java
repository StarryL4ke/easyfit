package com.easyfit.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.easyfit.mapper.CalendarMapper;

@Service
public class CalendarService {
	@Autowired
	private CalendarMapper calendarMapper;


	public List<Map<String,Object>> list() {
		
		return calendarMapper.list();
	}

}
