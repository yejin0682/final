package com.auction.handler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
public class WebSocketConfig2 implements WebSocketConfigurer{
	@Autowired
	private WebSocketHandler webSocketHandler;
	
	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		registry.addHandler(webSocketHandler, "/chat");
	}
}
