package snut.webframework.project.theclassic.board.persistence;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import snut.webframework.project.theclassic.board.domain.Criteria;
import snut.webframework.project.theclassic.board.domain.TourReplyVO;

@Repository
public class TourReplyDAOImpl implements TourReplyDAO {

  @Inject
  private SqlSession session;

  private static String namespace = "snut.webframework.project.mybatis.sqlmaps.ReplyMapper";

  @Override
  public List<TourReplyVO> list(Integer bno) throws Exception {

    return session.selectList(namespace + ".tourlist", bno);
  }

  @Override
  public void create(TourReplyVO vo) throws Exception {
	  
		  session.insert(namespace + ".tourcreate", vo);
	  
   
  }

  @Override
  public void update(TourReplyVO vo) throws Exception {

    session.update(namespace + ".tourupdate", vo);
  }

  @Override
  public void delete(Integer rno) throws Exception {

    session.update(namespace + ".tourdelete", rno);
  }

  @Override
  public List<TourReplyVO> listPage(Integer bno, Criteria cri)
      throws Exception {

    Map<String, Object> paramMap = new HashMap<>();

    paramMap.put("bno", bno);
    paramMap.put("cri", cri);

    return session.selectList(namespace + ".tourlistPage", paramMap);
  }

  @Override
  public int count(Integer bno) throws Exception {

    return session.selectOne(namespace + ".tourcount", bno);
  }

@Override
public int avg(Integer bno) throws Exception {
	
	return session.selectOne(namespace + ".touravg", bno);
}
}
