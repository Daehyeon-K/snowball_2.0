package com.study.dto;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MailDTO {

   private String mail_id; // 메일을 보냈을 때 생성될 번호 & primary key
   private String mail_name; // 변경할 메일 이름(보내는 사람의 명 등)
   private String sender_id; // 보내는 사람 (사번 아이디)
   private String receiver_id; // 수신인
   private String mail_title; // 보내는 메일 제목
   private String mail_content; // 메일 내용
   @DateTimeFormat(pattern = "yyyy-MM-dd")
   private Date mail_send_date;  // 발신 일시 sysdate
   
}
