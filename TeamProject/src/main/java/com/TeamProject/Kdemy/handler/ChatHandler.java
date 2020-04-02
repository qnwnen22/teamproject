package com.TeamProject.Kdemy.handler;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;


public class ChatHandler extends TextWebSocketHandler{
	
	List<WebSocketSession> sessions =new ArrayList<>();
	
	
	 // connection이 맺어진 후 실행된다
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        System.err.println("session connected +=" + session);
        sessions.add(session);
        String senderId=session.getId();
        session.sendMessage(new TextMessage(senderId+"님이 접속하였습니다."));
    }
    // 메세지 수신
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        System.err.println("handle message +=" + session + ", message=" + message);
        String senderId = session.getId();
        for(WebSocketSession sess : sessions) {
        	sess.sendMessage(new TextMessage(senderId +": " + message.getPayload()));
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


}
