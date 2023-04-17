package com.easyfit.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.easyfit.domain.ExerciseRecordVO;
@Mapper
public interface CalendarMapper {
	//일정 목록
	public List<Map<String, Object>> list(@Param("tid") String tid);
	//일정 등록
	public int register(@Param("exerciseRecord") ExerciseRecordVO exerciseRecord, @Param("tid") String tid, @Param("mname") String mname);
}
