package com.easyfit.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.easyfit.domain.Criteria;
import com.easyfit.domain.ExerciseRecordVO;
import com.easyfit.domain.ExerciseTypeVO;
import com.easyfit.domain.join.LessonJoinVO;

public interface LessonMapper {
	
	// SELECT
	public List<ExerciseTypeVO> exerciseTypeList(ExerciseTypeVO et);
	//public List<LessonJoinVO> tripleList(@Param("cri") Criteria cri, @Param("tno") Long tno);
	public List<LessonJoinVO> TNOtripleList(@Param("cri") Criteria cri, @Param("tno") Long tno);
	public List<LessonJoinVO> doubleList(@Param("cri") Criteria cri, @Param("prno") Long prno);
	public List<LessonJoinVO> get(@Param("prno") Long prno, @Param("edate") String edate);
	
	// INSERT
	public void register(ExerciseRecordVO vo);
	public void registerSelectKey(ExerciseRecordVO vo);
	
	// UPDATE
	public void modify(ExerciseRecordVO vo);
	public long prcountUpdate(Long prno);
	
	// DELETE
	public long remove(@Param("prno") Long erno, @Param("edate") String edate);
	
	// 총 게시글 갯수 구하는 메소드 - 운동기록
	public long exerciseRecordTotalCount(Criteria cri, @Param("prno") Long prno);
	
	// 총 게시글 갯수 구하는 메소드 - PT기록
	public long ptRecordTotalCount(Criteria cri);
	
	// #{tno} 의 총 게시글 갯수 구하는 메소드 - PT기록
	//public long TNOptRecordTotalCount(@Param("cri") Criteria cri, @Param("tno") Long tno);
	public long TNOptRecordTotalCount(@Param("tno") Long tno);
	
}
