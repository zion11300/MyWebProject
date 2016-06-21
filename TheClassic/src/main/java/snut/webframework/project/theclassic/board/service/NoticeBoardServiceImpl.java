package snut.webframework.project.theclassic.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import snut.webframework.project.theclassic.board.domain.Criteria;
import snut.webframework.project.theclassic.board.domain.NoticeBoardVO;
import snut.webframework.project.theclassic.board.domain.SearchCriteria;
import snut.webframework.project.theclassic.board.persistence.NoticeBoardDAO;

@Service
public class NoticeBoardServiceImpl implements NoticeBoardService {

  @Inject
  private NoticeBoardDAO dao;

  @Override
  public void regist(NoticeBoardVO board) throws Exception {
    dao.create(board);
  }

  @Override
  public NoticeBoardVO read(Integer bno) throws Exception {
    return dao.read(bno);
  }
  @Override
  public void updateviewcnt(NoticeBoardVO board) throws Exception {
  	// TODO Auto-generated method stub
  	 dao.updateviewcnt(board);
  }
  @Override
  public void modify(NoticeBoardVO board) throws Exception {
    dao.update(board);
  }

  @Override
  public void remove(Integer bno) throws Exception {
    dao.delete(bno);
  }

  @Override
  public List<NoticeBoardVO> listAll() throws Exception {
    return dao.listAll();
  }

  @Override
  public List<NoticeBoardVO> listCriteria(Criteria cri) throws Exception {

    return dao.listCriteria(cri);
  }

  @Override
  public int listCountCriteria(Criteria cri) throws Exception {

    return dao.countPaging(cri);
  }

  @Override
  public List<NoticeBoardVO> listSearchCriteria(SearchCriteria cri) throws Exception {

    return dao.listSearch(cri);
  }

  @Override
  public int listSearchCount(SearchCriteria cri) throws Exception {

    return dao.listSearchCount(cri);
  }



}