package com.easyfit.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.easyfit.domain.Criteria;
import com.easyfit.domain.ExerciseRecordVO;
import com.easyfit.domain.ExerciseTypeVO;
import com.easyfit.domain.join.LessonJoinVO;

public interface LessonService {//변수앞에 get을 붙여서 카멜표기법을 사용합니다.
	
	//	SELECT
	public List<ExerciseTypeVO> getExerciseTypeList(ExerciseTypeVO et);
	//public List<LessonJoinVO> getTripleList(Criteria cri, Long tno);
	public List<LessonJoinVO> getTNOTripleList(Criteria cri, Long tno);
	public List<LessonJoinVO> getDoubleList(Criteria cri, Long prno);
	public List<LessonJoinVO> getGet(Long prno, String edate);
	
	// INSERT
	public void getRegister(ExerciseRecordVO vo);
	
	// UPDATE
	public void getModify(ExerciseRecordVO vo);
	public boolean getPrcountUpdate(Long prno);
	
	// DELETE
	public boolean getRemove(Long erno, String edate);
	
	// 총 게시글 갯수 구하는 메소드
	public long getExerciseRecordTotal(Criteria cri, Long prno);
	public long getPTRecordTotal(Criteria cri);
	
	// #{tno} 의 총 게시글 갯수 구하는 메소드 - PT기록
	//public long getTNOptRecordTotalCount(Criteria cri, Long tno);
	public long getTNOptRecordTotalCount(Long tno);
	
}
