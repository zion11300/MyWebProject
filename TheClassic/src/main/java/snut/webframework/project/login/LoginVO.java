package snut.webframework.project.login;

public class LoginVO {
	private String uid;
	private String upw;
	private String upw2;
	private String uname;
	private String email1;
	private String email2;

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getUpw() {
		return upw;
	}

	public void setUpw(String upw) {
		this.upw = upw;
	}

	public String getUpw2() {
		return upw2;
	}

	public void setUpw2(String upw2) {
		this.upw2 = upw2;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getEmail1() {
		return email1;
	}

	public void setEmail1(String email1) {
		this.email1 = email1;
	}

	public String getEmail2() {
		return email2;
	}

	public void setEmail2(String email2) {
		this.email2 = email2;
	}

	@Override
	public String toString() {
		return "LoginVO [uid=" + uid + ", upw=" + upw + ", uname=" + uname + ", email=" + email1 + "@" + email2 + "]";
	}

}