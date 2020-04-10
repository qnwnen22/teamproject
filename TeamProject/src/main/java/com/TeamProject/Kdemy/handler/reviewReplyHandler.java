package com.TeamProject.Kdemy.handler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.TeamProject.Kdemy.interceptor.SessionNames;
import com.TeamProject.Kdemy.model.member.dto.MemberDTO;

public class reviewReplyHandler extends TextWebSocketHandler{
	
	List<WebSocketSession> sessions =new ArrayList<>();
	  
	Map<String,WebSocketSession> userSessions =new HashMap<>();
	
	 // connection이 맺어진 후 실행된다
	@Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        sessions.add(session);
        String senderId=getId(session);
        userSessions.put(senderId,session);
        System.out.println(senderId);
    }
    // 메세지 수신
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
    	 System.out.println("hadelText Message : " +session+ message);
    	 String msg=message.getPayload();
    	 if(StringUtils.isNotEmpty(msg)) {
    		 String[] strs = msg.split(",");
    		 System.out.println(strs);
    		 if(strs != null && strs.length == 4) {
    			String cmd= strs[0];
    			String replyWriter=strs[1];
    			String boardWriter=strs[2];
    			String bno=strs[3];
    			System.out.println(cmd);
    			WebSocketSession boardWriterSession = userSessions.get(boardWriter);
    			System.out.println(boardWriterSession);
    			if("reply".equals(cmd) && boardWriterSession != null) {
    				TextMessage tmpMsg = new TextMessage(replyWriter + "님이"
    			   +"<a href='review/view.do?bno="+bno+"'>"+ bno +"번 게시글에 댓글을 달았습니다.");
    				boardWriterSession.sendMessage(tmpMsg);
    				System.out.println(tmpMsg);
    			}
    		 }
    	 }
    }
    // transport 중 error
    @Override
    public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
        System.err.println("transport error =" + session +", exception =" + exception);
    }
    // connection close
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus closeStatus) throws Exception {
        System.err.println("session close -=" + session);
    }
    
    private String getId(WebSocketSession session) {
    	Map<String, Object> httpSession=session.getAttributes();
    	MemberDTO loginUser = (MemberDTO)httpSession.get(SessionNames.LOGIN);
    	if(null == loginUser ) {
    		return session.getId();
    	}else {
    		return loginUser.getUserid();
    	}
    	
    }
}
