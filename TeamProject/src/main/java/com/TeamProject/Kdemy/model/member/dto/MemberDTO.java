package com.TeamProject.Kdemy.model.member.dto;

import java.util.Date;

public class MemberDTO {

	private int	usernum;
	private String userid;
	private String passwd; 
	private String username;
	private String birthday; 
	private String useremail;
	private String emaildomain;
	private String phone;
	private String postcode;
	private String address;
	private String address2;
	private Date join_date;
	private char verify;
	private String teacher;
	private Date request_date;
	
	private String bpasswd;
	private String phone1;
	private String phone2;
	private String phone3;
	
	private String birthday1;
	private String birthday2;
	private String birthday3;
	//
	public void setRequest_date(Date request_date) {
		this.request_date = request_date;
	}
	public void setUsernum(int usernum) {
		this.usernum = usernum;
	}
	public int getUsernum() {
		return usernum;
	}
	public Date getRequest_date() {
		return request_date;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getUseremail() {
		return useremail;
	}
	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}
	public String getEmaildomain() {
		return emaildomain;
	}
	public void setEmaildomain(String emaildomain) {
		this.emaildomain = emaildomain;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public Date getJoin_date() {
		return join_date;
	}
	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}
	public char getVerify() {
		return verify;
	}
	public void setVerify(char verify) {
		this.verify = verify;
	}
	public String getTeacher() {
		return teacher;
	}
	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}
	public String getBpasswd() {
		return bpasswd;
	}
	public void setBpasswd(String bpasswd) {
		this.bpasswd = bpasswd;
	}
	public String getPhone1() {
		return phone1;
	}
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	public String getPhone2() {
		return phone2;
	}
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	public String getPhone3() {
		return phone3;
	}
	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}
	public String getBirthday1() {
		return birthday1;
	}
	public void setBirthday1(String birthday1) {
		this.birthday1 = birthday1;
	}
	public String getBirthday2() {
		return birthday2;
	}
	public void setBirthday2(String birthday2) {
		this.birthday2 = birthday2;
	}
	public String getBirthday3() {
		return birthday3;
	}
	public void setBirthday3(String birthday3) {
		this.birthday3 = birthday3;
	}
	@Override
	public String toString() {
		return "MemberDTO [usernum=" + usernum + ", userid=" + userid + ", passwd=" + passwd + ", username=" + username
				+ ", birthday=" + birthday + ", useremail=" + useremail + ", emaildomain=" + emaildomain + ", phone="
				+ phone + ", postcode=" + postcode + ", address=" + address + ", address2=" + address2 + ", join_date="
				+ join_date + ", verify=" + verify + ", teacher=" + teacher + ", bpasswd=" + bpasswd + ", phone1="
				+ phone1 + ", phone2=" + phone2 + ", phone3=" + phone3 + ", birthday1=" + birthday1 + ", birthday2="
				+ birthday2 + ", birthday3=" + birthday3 + "]";
	}
	
}
