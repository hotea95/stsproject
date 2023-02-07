package spring.project.interpark.customer.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;

import spring.project.interpark.customer.dao.CustomerDAO;
import spring.project.interpark.customer.dto.CustomerDTO;
import spring.project.interpark.customer.page.Criteria;
import spring.project.interpark.reply.dto.ReplyDTO;

@Service
public class CustomerService {
	@Autowired
	private CustomerDAO customerDAO;

	//문의 조회
	public List<CustomerDTO> customerSelectAll(Criteria cri) throws Exception {
		return customerDAO.selectAll(cri);
	}
	//문의상세조희
	public CustomerDTO customerSelect(int num) {
		return customerDAO.select(num);
	}
//문의작성
	public void customerInsert(CustomerDTO customerDTO) {
		try {
			customerDAO.insert(customerDTO);
		} catch (DataIntegrityViolationException e) {
			e.printStackTrace();
		}
	}
//문의 수정
	public void customerUpdate(CustomerDTO customerDTO) {
		customerDAO.update(customerDTO);
	}
//문의 삭제
	public void customerDelete(int num, int renum) {
		customerDAO.delete(num, renum);
	}

	public int listCount() {
		return customerDAO.listCount();
	}
	
	public int replyCount() {
		return customerDAO.replyCount();
	}
	//댓글 조회
	public List<ReplyDTO> replySelect(int num) {
		return customerDAO.replySelect(num);
	}
	
	// 댓글작성
	public void write(ReplyDTO replyDTO) throws Exception{
		customerDAO.write(replyDTO);
	}

	// 댓글 수정
	public void update(ReplyDTO replyDTO) throws Exception{
		customerDAO.update(replyDTO);
	}

	// 댓글 삭제
	public void delete(ReplyDTO replyDTO) throws Exception{
		customerDAO.delete(replyDTO);
	}
	
}