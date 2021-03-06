package com.dingpet.chat.p001.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import lombok.RequiredArgsConstructor;

@Component
public class ChatWebSocketHandler extends TextWebSocketHandler {

	   private Map<String, WebSocketSession> usersMap = new HashMap<String,WebSocketSession>();
	   @Override //연결이 성사 되고 나서 해야할 일들.
	   public void afterConnectionEstablished(WebSocketSession session) throws Exception {
	      //로그인시 저장했던 맴버세션을 가져온다
	      Map<String,Object> loginMember = (Map<String, Object>) session.getAttributes().get("customers");
	      System.out.println(loginMember + " 연결 됨");
	      //로그인한 아이디의 이름으로 웹소켓세션을 저장한다.
	      //String loginUser = (String) loginMember.get("mem_Id");
	      //usersMap.put(loginUser,session);
	   }

	   @Override //소켓 연결이 종료되고 나서 서버단에서 실행해야할 일들을 정의해주는 메소드
	   public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
	      //로그인시 저장했던 맴버세션을 가져온다
	      Map<String,Object> loginMember = (Map<String, Object>) session.getAttributes().get("member");
	      System.out.println(loginMember + " 연결 종료됨");
	      //로그인한 아이디의 이름으로 저장된 웹소켓세션을 지운다.
	      //String loginUser = (String) loginMember.get("mem_Id");
	      //usersMap.remove(loginUser);
	   }

	   @Override //웹소켓 서버단으로 메세지가 도착했을때 해주어야할 일들을 정의하는 메소드 입니다.
	   protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
	      log(session.getId() + "로부터 메시지 수신: " + message.getPayload());
	      System.out.println("1111111111111111111111111111111111111111111");
	      //메세지 작성자,대상자,내용을 다 가져오기위해 제이슨 타입으로 메세지를 보냈고 그걸 다시 스트링타입으로 변환을 해준다.
	      JSONParser jsonParser =  new JSONParser();
	      JSONObject obj = (JSONObject) jsonParser.parse(message.getPayload());
	      System.out.println("======================잭슨오브잭트====================");
	      System.out.println(obj);
	      
	      //작성자 아이디
	      String my_Id = (String) obj.get("inId");
	      WebSocketSession myws = (WebSocketSession) usersMap.get(my_Id);
	      //대상자 아이디
	      String target_Id = (String) obj.get("target");
	      WebSocketSession ws = (WebSocketSession) usersMap.get(target_Id);
	      //메세지 보내는 사람 이름과 내용
	      String msgName = (String) obj.get("name");
	      String msg = (String) obj.get("message");
	      
	      //나 자신에게 메세지를 보냄
	      myws.sendMessage(new TextMessage("나:"+msg));
	  
	      //대상이 접속해 있을 경우 대상에게 메세지를 보냄
	      if (ws != null) {
	         ws.sendMessage(new TextMessage(msgName+":"+msg));
	      }
	   }
	   @Override
	   public void handleTransportError(
	         WebSocketSession session, Throwable exception) throws Exception {
	      log(session.getId() + " 익셉션 발생: " + exception.getMessage());
	   }

	   private void log(String logmsg) {
	      System.out.println(new Date() + " : " + logmsg);
	   }


	

}
