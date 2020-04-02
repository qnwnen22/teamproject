package com.TeamProject.Kdemy.socket;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;


@Configuration
@EnableWebSocketMessageBroker
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer {
 
    //messageBroker config
    @Override
    public void configureMessageBroker(MessageBrokerRegistry config) {
        //in-memory message-broker, topic에 대한 prefix 설정
         config.enableSimpleBroker("/sub");
        //메세지를 수신하는 handler의 메세지 prefix 설정 
        config.setApplicationDestinationPrefixes("/pub");
 
    };
    @Override
    public void registerStompEndpoints(StompEndpointRegistry registry) {
       registry.addEndpoint("/ws-stomp").setAllowedOrigins("*").withSockJS();
    }
}
