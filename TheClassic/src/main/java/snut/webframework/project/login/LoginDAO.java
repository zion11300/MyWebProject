package snut.webframework.project.login;

import java.util.List;

import snut.webframework.project.login.LoginVO;

public interface LoginDAO {
	
	public List<LoginVO> login(String uid) throws Exception;

	void join(LoginVO vo) throws Exception;
	public List<LoginVO> uname(String uname) throws Exception;
	void fix(LoginVO vo) throws Exception;
}
