package com.study.dto;


import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MsgDTO {
	private String msg_id;
	private String sender_id;
	private String receiver_id;
	private String msg_content;
	private Date msg_send_date;

	
//	//현재 사용자의 메세지 상대 아이디를 담는다.
//	private String other_nick;
//	//현재 사용자의 메세지 상대 프로필을 담는다.
//	private String profile;
//	//현재사용자아이디
//	private String mem_id;
//	//안읽은 메세지 갯수
//	private int unread;
//	
//	public int getUnread() {
//		return unread;
//	}
//	public void setUnread(int unread) {
//		this.unread = unread;
//	}
//	public String getOther_nick() {
//		return other_nick;
//	}
//	public void setOther_nick(String other_nick){
//		this.other_nick = other_nick;
//	}
//	public String getProfile() {
//		return profile;
//	}
//	public void setProfile(String profile) {
//		this.profile = profile;
//	}
//	public int getRoom() {
//		return room;
//	}
//	public void setRoom(int room) {
//		this.room = room;
//	}
//	public String getNick() {
//		return mem_id;
//	}
//	public void setNick(String nick) {
//		this.other_nick=nick;
//	}
//	public String getNo() {
//		return no;
//	}
//	public void setNo(String no) {
//		this.no = no;
//	}
//	public String getSend_nick() {
//		return send_nick;
//	}
//	public void setSend_nick(String send_nick) {
//		this.send_nick = send_nick;
//	}
//	public String getRecv_nick() {
//		return recv_nick;
//	}
//	public void setRecv_nick(String recv_nick) {
//		this.recv_nick = recv_nick;
//	}
//	public String getSend_time() {
//		return send_time;
//	}
//	public void setSend_time(String send_time) {
//		this.send_time = send_time;
//	}
//	public String getRead_time() {
//		return read_time;
//	}
//	public void setRead_time(String read_time) {
//		this.read_time = read_time;
//	}
//	public String getContent() {
//		return content;
//	}
//	public void setContent(String content) {
//		this.content = content;
//	}
//	public String GetRead_chk() {
//		return read_chk;
//	}
//	public void setRead_chk(String read_chk) {
//		this.read_chk = read_chk;
//	}
	
	
	
	
	
}
