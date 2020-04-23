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
import com.TeamProject.Kdemy.model.admin.dto.AdminDTO;
import com.TeamProject.Kdemy.model.member.dto.MemberDTO;

public class KdemyWebSocketHandler extends TextWebSocketHandler{
	
	List<WebSocketSession> sessions =new ArrayList<>();
	  
	Map<String,WebSocketSession> userSessions =new HashMap<>();
	Map<String,WebSocketSession> AdminSessions =new HashMap<>();
	
	
	 // connection이 맺어진 후 실행된다
	@Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		Map<String, Object> httpSession=session.getAttributes();
		AdminDTO adminUser = (AdminDTO)httpSession.get(SessionNames.ADMINLOGIN);
		if(adminUser != null) {
			String adminId=getAdminId(session);
			AdminSessions.put(adminId, session);
		}else {
			String senderId=getId(session);
			userSessions.put(senderId,session);	   
		}
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
    			String sender=strs[1];
    			String target=strs[2];
    			String num=strs[3];
    			WebSocketSession boardWriterSession = userSessions.get(target);
    			if("reply".equals(cmd)) {
    				if(boardWriterSession != null) {
    					TextMessage tmpMsg = new TextMessage(sender + "님이"
    							+"<a href='review/view.do?bno="+num+"'>"+ num +"번 게시글에 댓글을 달았습니다.");
    					boardWriterSession.sendMessage(tmpMsg);   					
    				}else {
    					
    				}
    			}
    		 }
    		 if(strs != null && strs.length == 5) {
    			String cmd= strs[0];
     			String sender=strs[1];
     			String target=strs[2];
     			String num=strs[3];
     			String Msg=strs[4];
     			
     			WebSocketSession chatWTargetSession = AdminSessions.get(target);
     			WebSocketSession userWTargetSession = userSessions.get(target);
     			
     			if("chat".equals(cmd)){
     				if(chatWTargetSession != null) {
     					TextMessage adminSendMsg = new TextMessage(cmd+","+sender+","+target+","+Msg+","+num);
     					chatWTargetSession.sendMessage(adminSendMsg);     					
     				}else {
     					
     				}
    			}else if("usersend".equals(cmd)) {
    				if(userWTargetSession != null) {
    					System.out.println(userWTargetSession);
    					String usermsg = "<li class='bg-light text-left mr-auto mb-1'><b>관리자 :</b><br>"+Msg+"</li>";
     					TextMessage adminSendMsg = new TextMessage(cmd+","+sender+","+target+","+usermsg+","+num);
     					userWTargetSession.sendMessage(adminSendMsg);     					
     				}else {
     					
     				}
    			} 				
    			else if("adminsend".equals(cmd)) {
    		    	if(chatWTargetSession != null) {
    		    		System.out.println(chatWTargetSession);
    		    		String adminmsg = "<li class='bg-light text-left mr-auto mb-1'><b>"+sender+" :</b><br>"+Msg+"</li>";
     					TextMessage adminSendMsg = new TextMessage(cmd+","+sender+","+target+","+adminmsg+","+num);
     					chatWTargetSession.sendMessage(adminSendMsg);     					
     				}else {
     					
     				}
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
    	if(null == loginUser) {
    		return session.getId();
    	}else {
    		return loginUser.getUserid();
    	}
    }
    
    private String getAdminId(WebSocketSession session) {
		Map<String, Object> httpSession=session.getAttributes();
		AdminDTO adminUser = (AdminDTO)httpSession.get(SessionNames.ADMINLOGIN);	  
		if(adminUser != null) {
			return adminUser.getAdmin_id();
		}else {
			return "admin";
		}
	}
}
