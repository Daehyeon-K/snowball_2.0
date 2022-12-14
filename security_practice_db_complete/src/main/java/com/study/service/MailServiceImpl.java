package com.study.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.inject.Inject;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.mail.internet.MimeUtility;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSender; // JavaMailSender
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.study.dto.CriteriaDTO;
import com.study.dto.MailDTO;
import com.study.dto.MailFileDTO;
import com.study.mapper.AttachMapper;
import com.study.mapper.MailMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service // 서비스 빈으로 등록
public class MailServiceImpl implements MailService {

	@Inject
	JavaMailSender mailsender; // root-context.xml에 설정한 bean, 의존성을 주입
	
	@Autowired
	MailMapper mailMapper;
	
	@Autowired
	AttachMapper attachMapper;
	
	
	@Override
	public void EmailService11(MailDTO mailDto) {
		String charSet = "UTF-8" ;
		try {
			// 이메일 객체
			MimeMessage msg = mailsender.createMimeMessage();
			
			// 받는 사람 설정 ( 수신자, 받는 사람의 메일을 객체로 생성 수신할 이메일을 주소로 담음 )
			msg.addRecipient(RecipientType.TO, new InternetAddress(mailDto.getReceiver_id()));
			
			/*
			 * createMimeMessage() : MimeMessage객체를 생성시킴 (이것을 이용해서 메시지를 구성한 뒤 메일 발송)
			 * addRecipient() : 메시지의 발신자를 설정 InternetAddress() : 이메일 주소 getReceiveMail() :수신자 이메일 주소
			 */
			
			//String fromName = "1팀화이팅" ;
			InternetAddress from = new InternetAddress() ;
			
			// 보내는 사람(이메일주소+이름)
			// (발신자, 보내는 사람의 이메일 주소와 이름을 담음)
			// 이메일 발신자
			// msg.addFrom(new InternetAddress[] { new InternetAddress(mailDto.getMail_id() ,mailDto.getSender_id()) });
			
			// 메일 발신자 (+인코딩 변경)
			try {
				from = new InternetAddress(new String(mailDto.getMail_name().getBytes(charSet), "8859_1") + "<"+mailDto.getSender_id()+">");
			} catch (UnsupportedEncodingException uee) {
				uee.printStackTrace();
			}
			// 이메일 발신자
			msg.setFrom(from);			
			
			// 이메일 제목 (인코딩 변경)
			msg.setSubject(MimeUtility.encodeText(mailDto.getMail_title(), "utf-8", "B"));
			// 메일 내용 (인코딩 변경)
			msg.setText(mailDto.getMail_content(), "utf-8");
			
			
			mailsender.send(msg);
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}

	@Override
	public MailDTO EmailService(MailDTO mailDto) {
		String charSet = "UTF-8" ;
		
		try {
			// 이메일 객체
			MimeMessage msg = mailsender.createMimeMessage();
			
			MimeMessageHelper helper = new MimeMessageHelper(msg, true);			
			
			// 받는 사람 설정 ( 수신자, 받는 사람의 메일을 객체로 생성 수신할 이메일을 주소로 담음 )
			helper.setTo(new InternetAddress(mailDto.getReceiver_id()));
			helper.setFrom(new InternetAddress(new String(mailDto.getMail_name().getBytes(charSet), "8859_1") + "<"+mailDto.getSender_id()+">"));
			helper.setSubject(MimeUtility.encodeText(mailDto.getMail_title(), "utf-8", "B"));
			
			// 메일 내용 (인코딩 변경)
			helper.setText(mailDto.getMail_content(), "utf-8");			
			
			String uploadBasicPath = "c:\\tempemail";
			File f = new File(uploadBasicPath, mailDto.getAttach().getOriginalFilename());
			mailDto.getAttach().transferTo(f);	
				
			
			helper.addAttachment(mailDto.getAttach().getOriginalFilename(), f);
			
			mailsender.send(msg);
			
			return mailDto;
			
		} catch (Exception e) {
			e.printStackTrace();
			return mailDto;
		} 
		
		
		
		
		
		
		
//		try {
//			// 이메일 객체
//			MimeMessage msg = mailsender.createMimeMessage();
//			
//			MimeMessageHelper helper = new MimeMessageHelper(msg, true);
//			
//			
//			// 받는 사람 설정 ( 수신자, 받는 사람의 메일을 객체로 생성 수신할 이메일을 주소로 담음 )
//			msg.addRecipient(RecipientType.TO, new InternetAddress(mailDto.getReceiver_id()));
//			
//			/*
//			 * createMimeMessage() : MimeMessage객체를 생성시킴 (이것을 이용해서 메시지를 구성한 뒤 메일 발송)
//			 * addRecipient() : 메시지의 발신자를 설정 InternetAddress() : 이메일 주소 getReceiveMail() :수신자 이메일 주소
//			 */
//			
//			//String fromName = "1팀화이팅" ;
//			InternetAddress from = new InternetAddress() ;
//			
//			// 보내는 사람(이메일주소+이름)
//			// (발신자, 보내는 사람의 이메일 주소와 이름을 담음)
//			// 이메일 발신자
//			// msg.addFrom(new InternetAddress[] { new InternetAddress(mailDto.getMail_id() ,mailDto.getSender_id()) });
//			
//			// 메일 발신자 (+인코딩 변경)
//			try {
//				from = new InternetAddress(new String(mailDto.getMail_name().getBytes(charSet), "8859_1") + "<"+mailDto.getSender_id()+">");
//			} catch (UnsupportedEncodingException uee) {
//				uee.printStackTrace();
//			}
//			// 이메일 발신자
//			msg.setFrom(from);			
//			
//			// 이메일 제목 (인코딩 변경)
//			msg.setSubject(MimeUtility.encodeText(mailDto.getMail_title(), "utf-8", "B"));
//			// 메일 내용 (인코딩 변경)
//			msg.setText(mailDto.getMail_content(), "utf-8");
//			
//			
//			
//			mailsender.send(msg);
//			
//			return mailDto;
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//			return mailDto;
//		} 
	}

	@Override
	public boolean emailToDB(MailDTO mailDto) {
		
		log.info(""+mailDto);
		
		
		return mailMapper.emailToDB(mailDto)==1?true:false;
	}

	
	
	
	/*
	 * @Override public List<MailDTO> select(MailDTO mailDto) {
	 * 
	 * return mailMapper.select(mailDto);
	 * 
	 * 
	 * 
	 * }
	 */

	@Override
	public MailDTO read(String mail_id) {
		return mailMapper.read(mail_id);
	}
	
	// 메일 첨부파일 삽입
	@Override
	public void MailFileInsert(MailDTO insertDto) {
		log.info("service---- "+insertDto);
		//첨부 파일 개수만큼 루프돌기
//		mailMapper.emailToDB(insertDto);
//
//		if(insertDto.getAttachList() == null) {
//			return;
//		}
//
//		insertDto.getAttachList().forEach(attach -> {
//			//첨부파일 삽입
//			attachMapper.MailFile(attach);
//		});
	}
	
	// 메일 첨부파일 가져오기
	@Override
	public List<MailFileDTO> attachList(String mail_id) {
		return attachMapper.mailfile(mail_id);
	}

	@Override
	public List<MailDTO> select(@Param("cri") CriteriaDTO cri) {
		return mailMapper.select(cri);
	}

	@Override
	public int totalCnt(@Param("cri") CriteriaDTO cri) {
		return mailMapper.totalCnt(cri);
	}


}
