package snut.webframework.project.theclassic.board.persistence;

import java.util.List;

import snut.webframework.project.theclassic.board.domain.Criteria;
import snut.webframework.project.theclassic.board.domain.NoticeBoardVO;
import snut.webframework.project.theclassic.board.domain.SearchCriteria;



public interface NoticeBoardDAO {

  public void create(NoticeBoardVO vo) throws Exception;

  public NoticeBoardVO read(Integer bno) throws Exception;
  public void updateviewcnt(NoticeBoardVO vo) throws Exception;
  public void update(NoticeBoardVO vo) throws Exception;

  public void delete(Integer bno) throws Exception;

  public List<NoticeBoardVO> listAll() throws Exception;

 public List<NoticeBoardVO> listPage(int page) throws Exception;

  public List<NoticeBoardVO> listCriteria(Criteria cri) throws Exception;

  public int countPaging(Criteria cri) throws Exception;
//  
//  //use for dynamic sql
//  
  public List<NoticeBoardVO> listSearch(SearchCriteria cri)throws Exception;
  
  public int listSearchCount(SearchCriteria cri)throws Exception;

}
