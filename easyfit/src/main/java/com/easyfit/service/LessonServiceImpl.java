package com.easyfit.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.easyfit.domain.Criteria;
import com.easyfit.domain.ExerciseRecordVO;
import com.easyfit.domain.ExerciseTypeVO;
import com.easyfit.domain.join.LessonJoinVO;
import com.easyfit.mapper.LessonMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class LessonServiceImpl implements LessonService {
	private LessonMapper lessonMapper;

	// SELECT	
	@Override
	public List<ExerciseTypeVO> getExerciseTypeList(ExerciseTypeVO et) {
		
		log.info("get Exercise Type List : " + et);
		return lessonMapper.exerciseTypeList(et);
	}
	
	@Override
	public List<LessonJoinVO> getTripleList(Criteria cri, Long tno) {
		
		log.info("get Triple List with criteria : " + cri);
		return lessonMapper.tripleList(cri, tno);
	}
	
	@Override
	public List<LessonJoinVO> getDoubleList(Criteria cri, Long prno) {
		
		log.info("get Double List with criteria : " + cri);
		return lessonMapper.doubleList(cri, prno);
	}

	@Override
	public List<LessonJoinVO> getGet(Long prno, String edate) {
		
		log.info("getGet : " + prno + " , " + edate);
		return lessonMapper.get(prno, edate);
	}
	
	// INSERT
	@Override
	public void getRegister(ExerciseRecordVO vo) {
		
		log.info("getRegister : " + vo);
		lessonMapper.registerSelectKey(vo);
	}

	// UPDATE
	@Override
	public void getModify(ExerciseRecordVO vo) {
		
		log.info("getModify : " + vo);
		lessonMapper.modify(vo);
	}
	
	@Override
	public boolean getPrcountUpdate(Long prno) {
		
		log.info("getPrcountUpdate : " + prno);
		return lessonMapper.prcountUpdate(prno) == 1;
	}

	
	// DELETE
	@Override
	public boolean getRemove(Long prno, String edate) {
		
		log.info("getRemove : " + prno + " , " + edate);
		return lessonMapper.remove(prno, edate) == 1;
	}
	
	// 총 게시글 갯수 구하는 메소드 - 운동기록
	@Override
	public long getExerciseRecordTotal(Criteria cri, @Param("prno") Long prno) {
		
		log.info("get exercise record total count");
		return lessonMapper.exerciseRecordTotalCount(cri, prno);
	}
	
	// 총 게시글 갯수 구하는 메소드 - PT기록(PT계약회차)
	@Override
	public long getPTRecordTotal(Criteria cri) {
		
		log.info("get pt record total count");
		return lessonMapper.ptRecordTotalCount(cri);
	}
	
	
}