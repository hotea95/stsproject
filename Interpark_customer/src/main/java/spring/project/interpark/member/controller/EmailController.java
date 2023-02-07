package spring.project.interpark.member.controller;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import lombok.extern.slf4j.Slf4j;
import spring.project.interpark.member.dto.MemberDTO;
import spring.project.interpark.member.service.MemberService;

@Slf4j
@Controller
public class EmailController {
	@Autowired
	private MemberService memberService;

	public void sendEmail(Model model, MemberDTO memberDTO) throws Exception {
		String senderMail = "rlawhddn1102@naver.com";
		// 보내는 사람의 이름을 설정한다.
		String senderName = "교육용프로젝트";
		// 받는 메일의 주소를 설정한다.
		String receiverMail = "";
		// 메일의 제목을 설정한다.
		String subject = "임시 비밀번호 발급";
		// 메일의 내용을 설정한다.
		String content = "";
		// SMTP 서버의 사용자를 설정한다.
		final String user = "rlawhddn1102@naver.com";
		// SMTP 서버의 비밀번호를 설정한다.
		final String password = "kimmin1101";
		
		// content 안의 내용
		content += memberDTO.getId() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.";
		content += "임시 비밀번호 : ";
		content += memberDTO.getPassword();
		log.info("메일 내용: " + content);
		
		// 사용자가 입력한 이메일
		receiverMail = memberDTO.getEmail();
		
		// 영구 속성 집합을 구현할 인스턴스를 선언한다.
		Properties properties = new Properties();
		// 연결할 SMTP . 서버를 설정한다
		properties.put("mail.smtp.host", "smtp.naver.com");
		// 연결할 SMTP . 서버 포트를 설정한다
		properties.put("mail.smtp.port", "465");
		// 권한 부여 명령인 AUTH . 명령을 사용하여 사용자 인증에 대한 시도를 설정한다
		properties.put("mail.smtp.auth", "true");
		// SSL SSL . 을 사용하여 기본적으로 포트에 연결하고 사용하도록 설정한다
		properties.put("mail.smtp.ssl.enable", "true");
		// SMTP . 호스트에서 신뢰성을 부여할 수 있도록 설정한다
		properties.put("mail.smtp.ssl.trust", "smtp.naver.com");
		// 익명 중첩 클래스를 선언하여 네트워크 연결에 대한 인증 요청을 수행한다.
		Authenticator authenticator = new Authenticator() {
			// 비밀번호 인증이 필요할 때 호출하여 사용자 이름과 비밀번호를 저장소에 저장한다.
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				// 데이터 홀더로 사용자 이름과 비밀번호를 저장소로 반환한다.
				return new PasswordAuthentication(user, password);
			}
		};
		Session session = Session.getInstance(properties, authenticator);
		log.info("세션 확인- " + session);
		session.setDebug(true);
		
		try {
		Message message = new MimeMessage(session);
		// 메시지에서 From . 속성을 주소와 개인 이름으로 설정한다
		message.setFrom(new InternetAddress(senderMail, senderName));
		// 받는 사람의 이메일 주소를 받는 사람 유형과 받는 이메일 주소를 분석하여 설정한다.
		message.setRecipients(RecipientType.TO, InternetAddress.parse(receiverMail));
		// 메시지의 제목을 설정한다.
		message.setSubject(subject);
		// 메시지의 보낸 날짜를 설정한다.
		message.setSentDate(new Date());
		// 메시지의 텍스트를 설정한다.
		message.setText(content);
		// 메시지를 보내며 메시지는 각 주소에 적절한 메시지 전송을 사용하여 메시지에 설정된 모든 수신자 주소로 전송한다.
		Transport.send(message);
		model.addAttribute("receiverMail", receiverMail);
		log.info("메일 전송 성공- " + message);
		log.info("메일 받는 곳- " + receiverMail);
		} catch (Exception e) {
			log.info("메일 전송 실패- " + e);
		}
	}

	// 비밀번호 생성
	public String findPassword(Model model, HttpServletRequest request, HttpServletResponse response,
			MemberDTO memberDTO) throws Exception {
		boolean check = false;
		response.setContentType("text/html;charset=utf-8");
		memberDTO = memberService.memberSelect(memberDTO.getId());

		// id, email이 맞을떄
		if (request.getParameter("id").equals(memberDTO.getId())
				&& request.getParameter("email").equals(memberDTO.getEmail())) {
			log.info("id- " + memberDTO.getId());
			log.info("email- " + memberDTO.getEmail());
			check = true;
			String password = "";
			for (int i = 0; i < 4; i++) {
				password += (int) (Math.random() * 9);
			}
			memberDTO.setPassword(password);
			// 비밀번호 변경 
			memberService.findPassword(memberDTO);
			model.addAttribute("check", check);
			model.addAttribute("memberDTO", memberDTO);
			log.info("memberDTO" + memberDTO);
			// 메일전송
			sendEmail(model, memberDTO);
		}
		// id, email이 틀렸을때(없을때)
		else {
			check = false;
			model.addAttribute("check", check);
		}
		return null;
	}

}
