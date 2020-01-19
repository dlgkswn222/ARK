package kr.icia.service;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import kr.icia.service.BoardService;
import kr.icia.service.FindUtil;
import lombok.AllArgsConstructor;

@Controller
public class MailUtilService {


	public static void sendMail(String email,String subject,String msg) 
			throws Exception{
		String charSet ="utf-8";
		String hostSMTP="smtp.naver.com";
		String hostSMTPid="see5456998" ;
		String hostSMTPpwd="ehdrmsdl6";
		
		//보내는 사람
		String fromEmail = "see5456998@naver.com";
		String fromName ="이동근";
		
		//email 전송
		try {
		HtmlEmail mail=new HtmlEmail();
		mail.setDebug(true);
		mail.setCharset(charSet);
		mail.setSSLOnConnect(true); //ssl사용(TLS가 없는 경우 SSL 사용)
		
		mail.setHostName(hostSMTP);
		mail.setSmtpPort(465); //smtp 포트번호
		
		mail.setAuthentication(hostSMTPid, hostSMTPpwd);
		mail.setStartTLSEnabled(true);
		mail.addTo(email);
		mail.setFrom(fromEmail,fromName,charSet);
		mail.setSubject(subject);
		mail.setHtmlMsg(msg);
		mail.send();
		
		
		
		
		
		}catch (Exception e) {
			e.printStackTrace();
			
		}
		
		
	}
	
	
	
	
}
