package com.easyfit.domain;

import lombok.Data;

@Data
public class TrainerAuthVO {
	private String tno;
	private String tid; //id로 사용
	private String auth;
}
