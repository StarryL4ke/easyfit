package com.easyfit.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.easyfit.domain.Criteria;
import com.easyfit.domain.TrainerVO;

public interface TrainerMapper {
	public List<TrainerVO> list(@Param("cri") Criteria cri);
	public long count(@Param("cri") Criteria cri);
	
}
