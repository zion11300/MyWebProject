package snut.webframework.project.theclassic.board.service;

import java.util.List;

import snut.webframework.project.theclassic.board.domain.Criteria;
import snut.webframework.project.theclassic.board.domain.ReplyVO;

public interface ReplyService {

  public void addReply(ReplyVO vo) throws Exception;

  public List<ReplyVO> listReply(Integer bno) throws Exception;

  public void modifyReply(ReplyVO vo) throws Exception;

  public void removeReply(Integer rno) throws Exception;

  public List<ReplyVO> listReplyPage(Integer bno, Criteria cri) 
      throws Exception;

  public int count(Integer bno) throws Exception;
}
