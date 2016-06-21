package snut.webframework.project.theclassic.board.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import snut.webframework.project.theclassic.board.domain.Criteria;
import snut.webframework.project.theclassic.board.domain.NoticeBoardVO;
import snut.webframework.project.theclassic.board.domain.SearchCriteria;

@Repository
public class NoticeBoardDAOImpl implements NoticeBoardDAO {

  @Inject
  private SqlSession session;

  private static String namespace = "snut.webframework.project.mybatis.sqlmaps.NoticeBoardMapper";

  @Override
  public void create(NoticeBoardVO vo) throws Exception {
    session.insert(namespace + ".create", vo);
  }

  @Override
  public NoticeBoardVO read(Integer bno) throws Exception {
    return session.selectOne(namespace + ".read", bno);
  }
  @Override
  public void updateviewcnt(NoticeBoardVO vo) {
  	// TODO Auto-generated method stub
  	session.update(namespace + ".updateviewcnt",vo);
  }
  @Override
  public void update(NoticeBoardVO vo) throws Exception {
    session.update(namespace + ".update", vo);
  }

  @Override
  public void delete(Integer bno) throws Exception {
    session.delete(namespace + ".delete", bno);
  }

  @Override
  public List<NoticeBoardVO> listAll() throws Exception {
    return session.selectList(namespace + ".listAll");
  }

  @Override
  public List<NoticeBoardVO> listPage(int page) throws Exception {

    if (page <= 0) {
      page = 1;
    }

    page = (page - 1) * 10;

    return session.selectList(namespace + ".listPage", page);
  }

  @Override
  public List<NoticeBoardVO> listCriteria(Criteria cri) throws Exception {

    return session.selectList(namespace + ".listCriteria", cri);
  }



  @Override
  public int countPaging(Criteria cri) throws Exception {

    return session.selectOne(namespace + ".countPaging", cri);
  }

  @Override
  public List<NoticeBoardVO> listSearch(SearchCriteria cri) throws Exception {

    return session.selectList(namespace + ".listSearch", cri);
  }

  @Override
  public int listSearchCount(SearchCriteria cri) throws Exception {

    return session.selectOne(namespace + ".listSearchCount", cri);
  }




}
