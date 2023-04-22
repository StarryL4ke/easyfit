package com.easyfit.mapper;

import java.util.List;

import com.easyfit.domain.Criteria;
//import com.easyfit.domain.Criteria;

import com.easyfit.domain.TrainerBoardVO;

public interface TrainerBoardMapper {
	
	//공지사항 목록
	public List<TrainerBoardVO> list(Criteria cri);
	
	//글 세기
	public long count(Criteria cri);
	
	//공지사항 상세보기
	public TrainerBoardVO get(Long tbno);


	//공지 입력
	public int register(TrainerBoardVO trainerboard);

	//공지사항 수정
	public void modify(TrainerBoardVO trainerboard);

	//공지사항 삭제
	public void remove(Long tbno);

}
