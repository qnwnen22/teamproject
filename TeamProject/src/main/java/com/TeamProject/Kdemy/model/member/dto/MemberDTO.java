package com.TeamProject.Kdemy.model.member.dto;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString

public class MemberDTO {

	private int usernum;
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
	private String loginsave;
	private String session_key;
	private Date session_limit;
	private boolean useCookie;
	private Date join_date;
	private char verify;
    private String thumbnail;
    private String thumbnail_path;
	private MultipartFile file;
    private String packages_end;
    
    //chart Data
    private int tcount;
	private int join_Month;
	//
    private String key1;
    private String key2;
    private String key3;
    private String coupon;
    private String point; 
    private String coupon_point; 
	private String teacher;
	private Date request_date;
	private String user_profileImagePath;

	private String nickname;
	private String bpasswd;
	private String visitor;
	private String phone1;
	private String phone2;
	private String phone3;
	
	private String birthday1;
	private String birthday2;
	private String birthday3;
	//
	private List<String> list;
}



