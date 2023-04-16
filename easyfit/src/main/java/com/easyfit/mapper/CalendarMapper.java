package com.easyfit.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
@Mapper
public interface CalendarMapper {
	public List<Map<String, Object>> list(@Param("tid") String tid);
}
