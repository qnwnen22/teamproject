package com.TeamProject.Kdemy.model.member.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@Getter
@Setter
@ToString
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
	private String user_profileImagePath;
	private String nikname;
	
	private String bpasswd;
	private String phone1;
	private String phone2;
	private String phone3;
	
	private String birthday1;
	private String birthday2;
	private String birthday3;
	//

	
}
