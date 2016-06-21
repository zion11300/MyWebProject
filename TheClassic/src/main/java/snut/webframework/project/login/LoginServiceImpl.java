package snut.webframework.project.login;


import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import snut.webframework.project.login.LoginVO;

import snut.webframework.project.login.LoginDAO;

@Service
public class LoginServiceImpl implements LoginService{

   @Inject
   private LoginDAO dao;
   
   @Override
   public List<LoginVO> login(String uid) throws Exception {
      
      // TODO Auto-generated method stub
      return dao.login(uid);
      
   }

   @Override
   public void join(LoginVO vo) throws Exception {
      dao.join(vo);
      // TODO Auto-generated method stub
      
   }

@Override
public List<LoginVO> uname(String uname) throws Exception {
	// TODO Auto-generated method stub
	return dao.uname(uname);
}
@Override
public void fix(LoginVO vo) throws Exception {
   dao.fix(vo);
   // TODO Auto-generated method stub
   
}

}