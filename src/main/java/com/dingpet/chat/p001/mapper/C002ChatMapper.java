package com.dingpet.chat.p001.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.dingpet.chat.p001.vo.C002ChatroomVO;

public interface C002ChatMapper {
	// 채팅방 목록 가져오기
	public List<C002ChatroomVO> getChatroomList(Map info);
	// 학생일 경우
	// 내가 신청한 수업 ID 목록 가져오기 
	public List<String> getMyClassList(Map info);
	// 친구 목록 불러오기 // 같은 수업을 듣는 학생 
	public List<Map<String, Object>> getclassFriendList(String info);
	// 내가 듣는 수업의 강사 목록 가져오기
	public List<Map<String, Object>> getTeaList(Map info);
	// 강사일 경우
	// 담당한 수업 목록 가져오기
	public List<String> getTeaClassList(Map info);
	// 본인 수업을 듣는 학생 리스트 가져오기
	public List<Map<String, Object>> getclassStuList(Map info);
	
	// 채팅방에 추가할 멤버 정보 가져오기 
	public List<Map<String, Object>> getmemInfo(Map info);
	// 생성할 채팅방 번호 만들어 가져오기 / 시퀀스 사용
	public String getchatroomId();
	// 채팅방 만들기
	public void insertChatroom(Map info);
	// 채팅방 멤버 등록하기
	public void insertMemberChat(Map info);
	
	// 방장 번호 알아오기
	public String getmakeMember(Map info);
	// 방이름, 방번호, 참여멤버 이름 가져오기
	public List<Map<String, Object>> getChatroomInfo(Map info);
	
	// 접속 할 나의 모든 채팅방 리스트 가져오기
	public List<String> getmychatIdList(String info);
	
	// 채팅메시지 저장하기
	public void insertMsg(Map info);
	// 접속 채팅방 이전 메시지 get
	public List<Map<String, Object>> getpastMsg(Map info);
	
	// 채팅방 이름 수정
	public void updateChatroomName(Map info);
	// 채팅방 나가기
	public void deleteMemberChat(Map info);

}
