package com.TeamProject.Kdemy.model.lecture.dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString

public class LectureDTO {

	private int lecture_idx; //강의 번호(리스트 출력용)
	private String cell_type; //판매타입
	private String main_category; //메인 카테고리
	private String sub_category; //서브 카테고리
	private String userid; //유저아이디
	private String nickname;
	private String subject; //강의제목
	private String main_img; //썸네일
	private String videofile; //영상 파일 이름
	private String content; //설명
	private Date upload_date; //업로드 날짜
	private int price; //가격
	
	//여기서 부터는 실시간/현장 강의 용 칼럼 
	private String lecture_date; //강의 시작 날짜
	private String lecture_start; //강의 시작 시간
	private String lecture_time; //강의 총 시간
	private String lecture_address; //강의장 도로명 주소
	private String lecture_address2; //상세 주소
	
	private MultipartFile file1;
	private MultipartFile file2;
	
	private int tcount;
	// 구매한 유저 수&추천수
	private int cellCount;
	private int upCount;
	// 판매 금액
	private int revenue;
	private String rank;
	
}
