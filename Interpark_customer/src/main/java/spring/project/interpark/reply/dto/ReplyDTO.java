package spring.project.interpark.reply.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.ToString;
import lombok.Setter;

@Component
@Setter
@Getter
@ToString
public class ReplyDTO {

	private int num;
	private int renum;
	private String retitle;
	private String recontent;
	private Date redate;
}
