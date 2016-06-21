package snut.webframework.project.theclassic.board.service;

import java.util.List;

import snut.webframework.project.theclassic.board.domain.Criteria;

import snut.webframework.project.theclassic.board.domain.TourReplyVO;

public interface TourReplyService {

  public void addReply(TourReplyVO vo) throws Exception;

  public List<TourReplyVO> listReply(Integer bno) throws Exception;

  public void modifyReply(TourReplyVO vo) throws Exception;

  public void removeReply(Integer rno) throws Exception;

  public List<TourReplyVO> listReplyPage(Integer bno, Criteria cri) 
      throws Exception;

  public int count(Integer bno) throws Exception;
  public int avg(Integer bno) throws Exception;
}
