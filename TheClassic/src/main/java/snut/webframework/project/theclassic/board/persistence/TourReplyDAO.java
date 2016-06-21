package snut.webframework.project.theclassic.board.persistence;

import java.util.List;

import snut.webframework.project.theclassic.board.domain.Criteria;
import snut.webframework.project.theclassic.board.domain.TourReplyVO;

public interface TourReplyDAO {

  public List<TourReplyVO> list(Integer bno) throws Exception;

  public void create(TourReplyVO vo) throws Exception;

  public void update(TourReplyVO vo) throws Exception;

  public void delete(Integer rno) throws Exception;

  public List<TourReplyVO> listPage(
      Integer bno, Criteria cri) throws Exception;

  public int count(Integer bno) throws Exception;
  public int avg(Integer bno) throws Exception;

}
