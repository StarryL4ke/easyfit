package com.easyfit.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
@Mapper
public interface CalendarMapper {
	public List<Map<String, Object>> list();
}
