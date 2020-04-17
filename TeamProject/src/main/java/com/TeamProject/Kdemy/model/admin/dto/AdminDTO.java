package com.TeamProject.Kdemy.model.admin.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString

public class AdminDTO {
	private String admin_id;
	private String admin_passwd;
	private String admin_name;
	private String admin_email;
	private String admin_hp;
	private Date join_date;
	private int admin_level;
	
	private String badmin_passwd;
	private String admin_hp1;
	private String admin_hp2;
	private String admin_hp3;
}