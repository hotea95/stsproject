package spring.project.interpark.customer.dao;



import java.util.List;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


import spring.project.interpark.customer.dto.CustomerDTO;
import spring.project.interpark.customer.page.Criteria;
import spring.project.interpark.reply.dto.ReplyDTO;
@Repository
@EnableAspectJAutoProxy(proxyTargetClass = true)
public class CustomerDAO {
@Autowired
SqlSessionTemplate sqlSessionTemplate;

//문의 조회
public List<CustomerDTO> selectAll(Criteria cri) throws Exception {
	return sqlSessionTemplate.selectList("cusselectAll",cri);
}

public int listCount() {
	return sqlSessionTemplate.selectOne("cuslistCount");
	
}

public int replyCount() {
	return sqlSessionTemplate.selectOne("replyCount");
}
//문의조회
public CustomerDTO select(int num) {
return sqlSessionTemplate.selectOne("cusselect", num);
}

@Transactional
//문의 작성
public void insert(CustomerDTO customerDTO) {
	sqlSessionTemplate.insert("cusinsert", customerDTO);
}
//문의 수정
public void update(CustomerDTO customerDTO) {
	sqlSessionTemplate.update("cusupdate",customerDTO);
}
// 문의 삭제
public void delete(int num,int renum) {
	sqlSessionTemplate.delete("cusdelete",num);
	sqlSessionTemplate.delete("cusdelete",renum);
}
//댓글조회
public List<ReplyDTO> replySelect(int num) {
return sqlSessionTemplate.selectList("readReply", num);
}
//댓글쓰기
public void write(ReplyDTO replyDTO) throws Exception{
	sqlSessionTemplate.insert("replywrite", replyDTO);
}
//댓글수정
public void update(ReplyDTO replyDTO) throws Exception{
	sqlSessionTemplate.update("replyupdate", replyDTO);
}

//댓글 삭제
public void delete(ReplyDTO replyDTO) throws Exception{
	sqlSessionTemplate.delete("replyDelete", replyDTO);
}
}
