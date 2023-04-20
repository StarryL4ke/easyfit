package com.easyfit.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@AllArgsConstructor
@Getter
public class ReplyPageDTO {

  private Long replyCnt; //댓글갯수
  private List<ReplyVO> list; //댓글목록
}