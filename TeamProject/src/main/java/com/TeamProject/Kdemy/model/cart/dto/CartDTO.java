package com.TeamProject.Kdemy.model.cart.dto;

public class CartDTO {

	private int cart_idx;
	private String cell_type;
	private String userid;
	private int lecture_idx;
	private int price;
	private String subject;//강의제목
	private String main_category, sub_category;
	public int getCart_idx() {
		return cart_idx;
	}
	public void setCart_idx(int cart_idx) {
		this.cart_idx = cart_idx;
	}
	public String getCell_type() {
		return cell_type;
	}
	public void setCell_type(String cell_type) {
		this.cell_type = cell_type;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getLecture_idx() {
		return lecture_idx;
	}
	public void setLecture_idx(int lecture_idx) {
		this.lecture_idx = lecture_idx;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getMain_category() {
		return main_category;
	}
	public void setMain_category(String main_category) {
		this.main_category = main_category;
	}
	public String getSub_category() {
		return sub_category;
	}
	public void setSub_category(String sub_category) {
		this.sub_category = sub_category;
	}
	@Override
	public String toString() {
		return "CartDTO [cart_idx=" + cart_idx + ", cell_type=" + cell_type + ", userid=" + userid + ", lecture_idx="
				+ lecture_idx + ", price=" + price + ", subject=" + subject + ", main_category=" + main_category
				+ ", sub_category=" + sub_category + "]";
	}
}
