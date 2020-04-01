package com.TeamProject.Kdemy.model.packages.dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class PackagesDTO {
	private String packages_name;
	private String  packages_text;
	private String  packages_image;
	private int packages_price;
	private int packages_date;
	
	private MultipartFile file1;
	
	//getter, setter, toString
	public MultipartFile getfile1() {
		return file1;
	}
	public void setfile1(MultipartFile file1) {
		this.file1 = file1;
	}
	public String getPackages_name() {
		return packages_name;
	}
	public void setPackages_name(String packages_name) {
		this.packages_name = packages_name;
	}
	
	public String getPackages_text() {
		return packages_text;
	}
	public void setPackages_text(String packages_text) {
		this.packages_text = packages_text;
	}
	public String getPackages_image() {
		return packages_image;
	}
	public void setPackages_image(String packages_image) {
		this.packages_image = packages_image;
	}
	public int getPackages_price() {
		return packages_price;
	}
	public void setPackages_price(int packages_price) {
		this.packages_price = packages_price;
	}
	public int getPackages_date() {
		return packages_date;
	}
	public void setPackages_date(int packages_date) {
		this.packages_date = packages_date;
	}
	@Override
	public String toString() {
		return "PackagesDTO [packages_name=" + packages_name + ", packages_text=" + packages_text + ", packages_image="
				+ packages_image + ", packages_price=" + packages_price + ", packages_date=" + packages_date + "]";
	}
}