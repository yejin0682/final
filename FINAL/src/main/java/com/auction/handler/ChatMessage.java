package com.auction.handler;

import java.awt.TrayIcon.MessageType;

public class ChatMessage {
	private String chatRoomId;
	private String writer;
	private String message;
	private MessageType type;
	private String grade;
	
	public String getChatRoomId() {
		return chatRoomId;
	}
	public void setChatRoomId(String chatRoomId) {
		this.chatRoomId = chatRoomId;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public MessageType getType() {
		return type;
	}
	public void setType(MessageType type) {
		this.type = type;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	// 메세지 타입 
	public enum MessageType{
		ENTER,CHAT,LEAVE
	}
	
}
