package com.auction.handler;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.auction.handler.ChatMessage.MessageType;
import com.fasterxml.jackson.databind.ObjectMapper;
public class WebSocketHandler extends TextWebSocketHandler{
	@Autowired
	private ChatRoomRepository chatRoomRepository;
	private final ObjectMapper objectMapper = new ObjectMapper();
	private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);
	private static List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>(); // 전체 접속자
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String msg = message.getPayload();
		ChatMessage chatMessage = objectMapper.readValue(msg, ChatMessage.class);
		if(chatMessage.getType() == MessageType.ENTER ) {
			if(chatMessage.getGrade().equals("z") && chatMessage.getChatRoomId()==null) {
				System.out.println("관리자 세션추가:"+chatMessage.getChatRoomId());
				sessionList.add(session);
				System.out.println("세션확인:"+sessionList);
			}else if(!(chatMessage.getGrade().equals("z"))){
				for(WebSocketSession sess : sessionList) {
					System.out.println("사용자 채팅요청");
					System.out.println("세션확인:"+sessionList);
					if(sess.isOpen()) {
						sess.sendMessage(new TextMessage(chatMessage.getWriter()+"님 채팅요청"));
					}
				}
			}
		}
		if(chatMessage.getChatRoomId()!=null) {
			System.out.println("방찾아 들어감");
			ChatRoom chatRoom = chatRoomRepository.findRoomById(chatMessage.getChatRoomId());
			chatRoom.handleMessage(session, chatMessage, objectMapper);
		}
		
	}
}
