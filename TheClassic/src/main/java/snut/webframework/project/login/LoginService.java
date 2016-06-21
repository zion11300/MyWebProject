package snut.webframework.project.login;
import java.util.List;

import snut.webframework.project.login.LoginVO;

public interface LoginService {
   public List<LoginVO> login(String uid) throws Exception;
   public List<LoginVO> uname(String uname) throws Exception;
   public void join(LoginVO vo) throws Exception;
   public void fix(LoginVO vo) throws Exception;
}