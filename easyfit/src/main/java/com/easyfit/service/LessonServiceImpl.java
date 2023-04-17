package com.easyfit.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.easyfit.domain.Criteria;
import com.easyfit.domain.ExerciseRecordArrayVO;
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

	// 뷰 페이지(jsp 파일) CRUD (JHR)
	
/*	
	@Override
	public List<LessonJoinVO> getTripleList(Criteria cri, Long tno) {
		
		log.info("get Triple List with criteria : " + cri);
		return lessonMapper.tripleList(cri, tno);
	}
*/	
	
	@Override
	public List<LessonJoinVO> getDoubleList(Criteria cri, Long prno, Long tno) {
		
		log.info("get Double List with criteria : " + cri);
		return lessonMapper.doubleList(cri, prno, tno);
	}
	
	@Override
	public LessonJoinVO getDoubleListNotPaging(Long prno, Long tno) {
		
		log.info("get Double List : " + prno + " , " + tno);
		return lessonMapper.doubleListNotPaging(prno, tno);
	}

	@Override
	public List<LessonJoinVO> getGet(Long prno, String edate, Long tno) {
		
		log.info("getGet : " + prno + " , " + edate + " , " + tno);
		return lessonMapper.get(prno, edate, tno);
	}
	
	
	// INSERT
	@Override
	public void getRegister(ExerciseRecordArrayVO arrayVo) {
	    ExerciseRecordVO[] voArray = toVOArr(arrayVo);
	    
	    for(int i = 0 ; i < voArray.length ; i++ ){
	    	log.info("getRegister : " + voArray);
	    	lessonMapper.register(voArray[i]);
	    }
	}
	
	// 배열에서 데이터 빼내는 메소드 생성
	public ExerciseRecordVO[] toVOArr(ExerciseRecordArrayVO arrayVo){
		
		ExerciseRecordVO[] voArray = new ExerciseRecordVO[10];
		
		for(int i = 0 ; i < arrayVo.eno.length ; i++ ){
			voArray[i] = new ExerciseRecordVO();
			voArray[i].setErno(arrayVo.erno[i]);
			voArray[i].setEdate(arrayVo.edate[i]);
			voArray[i].setEno(arrayVo.eno[i]);
			voArray[i].setErdate(arrayVo.erdate[i]);
			voArray[i].setErgroup(arrayVo.ergroup[i]);
			voArray[i].setErmemo(arrayVo.ermemo[i]);
			voArray[i].setErnumber(arrayVo.ernumber[i]);
			voArray[i].setErset(arrayVo.erset[i]);
			voArray[i].setErweight(arrayVo.erweight[i]);
		}
		
		return voArray;
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

	
	// 운동기록 모달 CRUD (JHR)
	// SELECT
	@Override
	public List<ExerciseTypeVO> getExerciseTypeList(Criteria cri) {
		
		log.info("get Exercise Type List : " + cri);

		return lessonMapper.exerciseTypeList(cri);
	}
	
	@Override
	public List<ExerciseTypeVO> getExerciseTypeListNotPaging() {
		
		log.info("get Exercise Type List Not Paging");
		
		return lessonMapper.exerciseTypeListNotPaging();
	}
	
	@Override
	public ExerciseTypeVO getEno(ExerciseTypeVO et) {
		
		log.info("get eno about ename");
		
		return lessonMapper.eno(et);
	}
	
	
	
	//#{tno} 메소드 모음 (LJW)
	@Override
	public List<LessonJoinVO> getMyTripleList(Criteria cri, Long tno) {
		return lessonMapper.myTripleList(cri, tno);
	}
	@Override
	public long getMyPTRecordTotalCount(Criteria cri, Long tno) {		
		return lessonMapper.myPTRecordTotalCount(cri, tno);
	}
	
	
}
