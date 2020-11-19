package com.auction.handler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.UUID;

import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.auction.handler.ChatMessage.MessageType;
import com.fasterxml.jackson.databind.ObjectMapper;

public class ChatRoom {
	private String roomId; 
	private String name; // 방이름
	private String user; // 유저이름
	private String userId; // 유저아이디
	private String grade;	// 유저 등급
	private Set<WebSocketSession> sessions = new HashSet<>(); // 접속 세션

	// 방생성
	public static ChatRoom create(String name,String user,String userId) {
		ChatRoom chatRoom = new ChatRoom();
		chatRoom.roomId=UUID.randomUUID().toString();
		chatRoom.name=name;
		chatRoom.user=user;
		chatRoom.userId=userId;
		return chatRoom;
	}
	
	public void handleMessage(WebSocketSession session, ChatMessage chatMessage, ObjectMapper objectMapper) throws IOException {
		if(chatMessage.getType() == MessageType.ENTER) {
			sessions.add(session);
			chatMessage.setMessage(roomId+":"+chatMessage.getWriter()+"님 입장");
		}
		
		boolean check=false;
		Iterator<WebSocketSession> iterator = sessions.iterator();
		while(iterator.hasNext()) {
			if((iterator.next().getId()).equals(session.getId())) {
				check=true;
				break;
			}
		}
		
		if(chatMessage.getType()==MessageType.LEAVE) {
			sessions.remove(session);
			chatMessage.setMessage(roomId+":"+chatMessage.getWriter()+"님 퇴장");
		}else if(chatMessage.getType()==MessageType.CHAT){
			chatMessage.setMessage(roomId+":"+chatMessage.getWriter()+":"+chatMessage.getMessage());
		}
		
		if(check) {
			send(chatMessage,objectMapper);
		}
	}
	
	public void send(ChatMessage chatMessage, ObjectMapper objectMapper) throws IOException {
//		TextMessage textMessage = new TextMessage(objectMapper.writeValueAsString(chatMessage.getMessage()));
		TextMessage textMessage = new TextMessage(chatMessage.getMessage());
		for(WebSocketSession sess : sessions) {
				sess.sendMessage(textMessage);
		}
	}
	
	public String getRoomId() {
		return roomId;
	}

	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Set<WebSocketSession> getSessions() {
		return sessions;
	}

	public void setSessions(Set<WebSocketSession> sessions) {
		this.sessions = sessions;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	
}












