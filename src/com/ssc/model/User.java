package com.ssc.model;

public class User {
	private int id;
	private String uId;
	private String uPw;
	private String name;
	private String postcode;
	private String addr1;
	private String addr2;
	private String tel;
	private String email;
	private String gender;
	private String emailYn;
	private String useArea;
	private String regDate;
	private String editDate;
	private String profileImg;
	private String licNum;
	private String birthdate;
	private String newUPw;
	
	private int limitStart;
	private int listCount;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	public String getuPw() {
		return uPw;
	}
	public void setuPw(String uPw) {
		this.uPw = uPw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmailYn() {
		return emailYn;
	}
	public void setEmailYn(String emailYn) {
		this.emailYn = emailYn;
	}
	public String getUseArea() {
		return useArea;
	}
	public void setUseArea(String useArea) {
		this.useArea = useArea;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getEditDate() {
		return editDate;
	}
	public void setEditDate(String editDate) {
		this.editDate = editDate;
	}
	public String getProfileImg() {
		return profileImg;
	}
	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}
	public String getLicNum() {
		return licNum;
	}
	public void setLicNum(String licNum) {
		this.licNum = licNum;
	}
	public String getBirthdate() {
		return birthdate;
	}
	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}
	public String getNewUPw() {
		return newUPw;
	}
	public void setNewUPw(String newUPw) {
		this.newUPw = newUPw;
	}
	public int getLimitStart() {
		return limitStart;
	}
	public void setLimitStart(int limitStart) {
		this.limitStart = limitStart;
	}
	public int getListCount() {
		return listCount;
	}
	public void setListCount(int listCount) {
		this.listCount = listCount;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", uId=" + uId + ", uPw=" + uPw + ", name=" + name + ", postcode=" + postcode
				+ ", addr1=" + addr1 + ", addr2=" + addr2 + ", tel=" + tel + ", email=" + email + ", gender=" + gender
				+ ", emailYn=" + emailYn + ", useArea=" + useArea + ", regDate=" + regDate + ", editDate=" + editDate
				+ ", profileImg=" + profileImg + ", licNum=" + licNum + ", birthdate=" + birthdate + ", newUPw="
				+ newUPw + ", limitStart=" + limitStart + ", listCount=" + listCount + "]";
	}
	
	
}
