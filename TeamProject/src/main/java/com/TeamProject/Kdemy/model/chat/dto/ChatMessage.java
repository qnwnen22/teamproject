package com.TeamProject.Kdemy.model.chat.dto;

import java.util.List;

import com.TeamProject.Kdemy.model.lecture.dto.LectureBoxDTO;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class ChatMessage {

	    // 메시지 타입 : 입장, 채팅
	public enum MessageType {
	    CHAT,
	    JOIN,
	    LEAVE
	}
	    private MessageType type; // 메시지 타입
	    private int lecture_idx; // 방번호
	    private String chatroom_name; //방이름
	    private String sender; // 메시지 보낸사람
	    private String content; //메시지
	    private String userid; //유저아이디
 	    private long userCount; //채팅방 인원수
 	    private List<LectureBoxDTO> userList;

}
