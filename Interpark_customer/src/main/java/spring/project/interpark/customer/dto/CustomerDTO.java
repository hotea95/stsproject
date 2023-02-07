package spring.project.interpark.customer.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Component
@Setter
@Getter
@ToString
public class CustomerDTO {

	private int num;
	private String anytype;
	private String title;
	private String content;
	private Date writedate;
	
	
}
