package com.TeamProject.Kdemy.model.member.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString

public class CouponDTO { 
	private int coupon_idx;
	private String coupon_name;
	private String coupon;
	private int point;
	private String coupon_text;
	private Date create_date;

}
