package com.TeamProject.Kdemy.model.admin.dto;

import java.util.Date;

public class AdminDTO {
	private String admin_id;
	private String admin_passwd;
	private String admin_name;
	private String admin_email;
	private String admin_hp;
	private Date join_date;
	private int admin_level;
	
	private String admin_hp1;
	private String admin_hp2;
	private String admin_hp3;
	
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getAdmin_passwd() {
		return admin_passwd;
	}
	public void setAdmin_passwd(String admin_passwd) {
		this.admin_passwd = admin_passwd;
	}
	public String getAdmin_name() {
		return admin_name;
	}
	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}
	public String getAdmin_email() {
		return admin_email;
	}
	public void setAdmin_email(String admin_email) {
		this.admin_email = admin_email;
	}
	public String getAdmin_hp() {
		return admin_hp;
	}
	public void setAdmin_hp(String admin_hp) {
		this.admin_hp = admin_hp;
	}
	public Date getJoin_date() {
		return join_date;
	}
	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}
	public int getAdmin_level() {
		return admin_level;
	}
	public void setAdmin_level(int admin_level) {
		this.admin_level = admin_level;
	}
	public String getAdmin_hp1() {
		return admin_hp1;
	}
	public void setAdmin_hp1(String admin_hp1) {
		this.admin_hp1 = admin_hp1;
	}
	public String getAdmin_hp2() {
		return admin_hp2;
	}
	public void setAdmin_hp2(String admin_hp2) {
		this.admin_hp2 = admin_hp2;
	}
	public String getAdmin_hp3() {
		return admin_hp3;
	}
	public void setAdmin_hp3(String admin_hp3) {
		this.admin_hp3 = admin_hp3;
	}
	@Override
	public String toString() {
		return "AdminDTO [admin_id=" + admin_id + ", admin_passwd=" + admin_passwd + ", admin_name=" + admin_name
				+ ", admin_email=" + admin_email + ", admin_hp=" + admin_hp + ", join_date=" + join_date
				+ ", admin_level=" + admin_level + ", admin_hp1=" + admin_hp1 + ", admin_hp2=" + admin_hp2
				+ ", admin_hp3=" + admin_hp3 + "]";
	}
	
}