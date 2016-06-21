package snut.webframework.project.theclass.controller;

public class Member {
	int MNO;
	String EMAIL;
	String PWD;
	String MNAME;
	String CRE_DATE;
	String MOD_DATE;
	
	public int getMNO() {
		return MNO;
	}
	public void setMNO(int mNO) {
		MNO = mNO;
	}
	public String getEMAIL() {
		return EMAIL;
	}
	public void setEMAIL(String eMAIL) {
		EMAIL = eMAIL;
	}
	public String getPWD() {
		return PWD;
	}
	public void setPWD(String pWD) {
		PWD = pWD;
	}
	public String getMNAME() {
		return MNAME;
	}
	public void setMNAME(String mNAME) {
		MNAME = mNAME;
	}
	public String getCRE_DATE() {
		return CRE_DATE;
	}
	public void setCRE_DATE(String cRE_DATE) {
		CRE_DATE = cRE_DATE;
	}
	public String getMOD_DATE() {
		return MOD_DATE;
	}
	public void setMOD_DATE(String mOD_DATE) {
		MOD_DATE = mOD_DATE;
	}
}
