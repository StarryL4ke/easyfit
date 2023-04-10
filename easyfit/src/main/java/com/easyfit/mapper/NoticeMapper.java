package com.easyfit.mapper;

import java.util.List;

import com.easyfit.domain.Criteria;
//import com.easyfit.domain.Criteria;
import com.easyfit.domain.NoticeVO;

public interface NoticeMapper {
	
	//공지사항 목록
	public List<NoticeVO> list(Criteria cri);
	
	//글 세기
	public long count(Criteria cri);
	
	//공지사항 상세보기
	public NoticeVO get(Long nno);


	//공지 입력
	public int register(NoticeVO notice);

	//공지사항 수정
	public void modify(NoticeVO notice);

	//공지사항 삭제
	public void remove(Long nno);

}
