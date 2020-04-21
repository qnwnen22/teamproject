package com.TeamProject.Kdemy.model.cart.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString

public class CartDTO {

	private int cart_idx;
	private String cell_type;
	private String userid;
	private int lecture_idx;
	private int price;
	private String subject;//강의제목
	private String main_category, sub_category;
}
