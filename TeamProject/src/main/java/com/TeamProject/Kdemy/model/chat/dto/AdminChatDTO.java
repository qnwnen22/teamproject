package com.TeamProject.Kdemy.model.chat.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@ToString
@Getter
public class AdminChatDTO {
	
	public enum MessageType {
	    CHAT,
	    JOIN,
	    LEAVE
	}
	
	private MessageType type; // 메시지 타입
	private String messageAdmin;//메시지
	private String sender;//보내는사람
	private String target;//
	private String num;//1:1채팅넘버
}
