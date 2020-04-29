package com.TeamProject.Kdemy.model.teacher.dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@Getter
@Setter
@ToString

public class TeacherDTO {

//	--개인정보 칼럼
	private int teacher_num; //강사 번호(리스트 출력용)
	private String userid; //멤버 아이디 userid
	private String username; //멤버 이름 username
	private String teacher_thumbnail; //강사 등록용 프로필 사진 
//	--학력 칼럼
	private String finalEducation; //최종학력
	private String schoolName;
	private String department;
//	--자격증 칼럼
	private String spec1; //자격증1 이름
	private String spec1_getDate; //취득일자
	private String spec1_img; // 자격증 이미지
	
	private String spec2; //
	private String spec2_getDate; //
	private String spec2_img; //
	
	private String spec3; //te
	private String spec3_getDate; //
	private String spec3_img; //
	
	private String spec4; //
	private String spec4_getDate; //
	private String spec4_img; //
	
	private String spec5; //
	private String spec5_getDate; //
	private String spec5_img; //
//	-- 경력 칼럼
	private String career; //
	private Date request_date; //신청 날짜
	
//	파일 업로드 처리용 변수
	 //썸네일용 파일
	private MultipartFile thumbnailFile;
	// 자격증이미지용 파일
	private MultipartFile spec1File;
	private MultipartFile spec2File; 
	private MultipartFile spec3File; 
	private MultipartFile spec4File; 
	private MultipartFile spec5File; 
	
	private String spec1_y;
	private String spec1_m;
	private String spec1_d;
	
	private String spec2_y;
	private String spec2_m;
	private String spec2_d;
	
	private String spec3_y;
	private String spec3_m;
	private String spec3_d;
	
	private String spec4_y;
	private String spec4_m;
	private String spec4_d;
	
	private String spec5_y;
	private String spec5_m;
	private String spec5_d;
	
}
