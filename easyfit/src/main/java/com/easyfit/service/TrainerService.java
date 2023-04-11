package com.easyfit.service;

import java.util.List;
import com.easyfit.domain.Criteria;
import com.easyfit.domain.TrainerVO;

public interface TrainerService {//get 앞에 붙이기
	public List<TrainerVO> getList(Criteria cri);
	public long getCount(Criteria cri);
}
