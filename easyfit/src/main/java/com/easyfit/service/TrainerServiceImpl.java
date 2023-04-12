package com.easyfit.service;

import java.util.List;
import org.springframework.stereotype.Service;
import com.easyfit.domain.Criteria;
import com.easyfit.domain.TrainerAuthVO;
import com.easyfit.domain.TrainerVO;
import com.easyfit.mapper.TrainerMapper;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class TrainerServiceImpl implements TrainerService {
	private TrainerMapper trainerMapper;

	@Override
	public List<TrainerVO> getList(Criteria cri) {
		return trainerMapper.list(cri);
	}

	@Override
	public long getCount(Criteria cri) {
		return trainerMapper.count(cri);
	}

	@Override
	public TrainerVO getGet(Long tno) {
		return trainerMapper.get(tno);
	}

	@Override
	public void getRegisterSelectKey(TrainerVO trainer) {
		trainerMapper.registerSelectKey(trainer);		
	}

	@Override
	public void getAuthRegister(TrainerAuthVO trainerAuth) {
		trainerMapper.authRegister(trainerAuth);		
	}

}
