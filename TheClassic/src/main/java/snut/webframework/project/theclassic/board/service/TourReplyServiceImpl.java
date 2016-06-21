package snut.webframework.project.theclassic.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import snut.webframework.project.theclassic.board.domain.Criteria;

import snut.webframework.project.theclassic.board.domain.TourReplyVO;

import snut.webframework.project.theclassic.board.persistence.TourReplyDAO;

@Service
public class TourReplyServiceImpl implements TourReplyService {

  @Inject
  private TourReplyDAO dao;

  @Override
  public void addReply(TourReplyVO vo) throws Exception {

    dao.create(vo);
  }

  @Override
  public List<TourReplyVO> listReply(Integer bno) throws Exception {

    return dao.list(bno);
  }

  @Override
  public void modifyReply(TourReplyVO vo) throws Exception {

    dao.update(vo);
  }

  @Override
  public void removeReply(Integer rno) throws Exception {

    dao.delete(rno);
  }

  @Override
  public List<TourReplyVO> listReplyPage(Integer bno, Criteria cri) 
      throws Exception {

    return dao.listPage(bno, cri);
  }

  @Override
  public int count(Integer bno) throws Exception {

    return dao.count(bno);
  }

@Override
public int avg(Integer bno) throws Exception {
	
	return dao.avg(bno);
}

}
