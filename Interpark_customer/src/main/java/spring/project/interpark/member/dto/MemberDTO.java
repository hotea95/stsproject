package spring.project.interpark.member.dto;



import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Component
@Getter
@Setter
@ToString
public class MemberDTO {
	// 아이디
	private String id;
	
	// 비밀번호
	private String password;
	
	// 회원이름
	private String mname;
	
	// 이메일
	private String email;
	
	// 휴대폰번호
	private String phone;
}
