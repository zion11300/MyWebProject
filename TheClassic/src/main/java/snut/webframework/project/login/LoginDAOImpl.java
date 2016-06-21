package snut.webframework.project.login;



import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import snut.webframework.project.login.LoginVO;

@Repository
public class LoginDAOImpl implements LoginDAO{
   
   @Inject
   private SqlSession session;

   private static String namespace = "snut.webframework.project.mybatis.sqlmaps.LoginMapper";

   @Override
   public List<LoginVO> login(String uid) throws Exception {
      return session.selectList(namespace + ".login", uid);
      
   }

   @Override
   public void join(LoginVO vo) throws Exception {
       session.insert(namespace + ".join", vo);
      // TODO Auto-generated method stub
      
   }
   @Override
   public void fix(LoginVO vo) throws Exception {
       session.update(namespace + ".fix", vo);
      // TODO Auto-generated method stub
   }

@Override
public List<LoginVO> uname(String uname) throws Exception {
	// TODO Auto-generated method stub
	return session.selectList(namespace + ".uname", uname);
}


   
      
   

}