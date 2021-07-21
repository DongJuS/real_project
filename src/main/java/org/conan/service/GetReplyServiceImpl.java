package org.conan.service;

import java.util.List;

import org.conan.domain.GetReplyVO;
import org.conan.domain.ReplyVO;
import org.conan.mapper.GetReplyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
@AllArgsConstructor
@Repository
public class GetReplyServiceImpl implements GetReplyService{
	@Setter(onMethod_=@Autowired)
	private GetReplyMapper mapper;
	
	@Override
	public void insertGetReply(GetReplyVO rvo) {
		mapper.insertGetReply(rvo);
	}
	@Override
	public List<GetReplyVO> readRecipeReply(int rid) {
		return mapper.readRecipeReply(rid);
	}
	@Override
	public void replyDelete(GetReplyVO rvo) {
		mapper.replyDelete(rvo);
	}
	@Override
	public void replyUpdate(GetReplyVO rvo) {
		mapper.replyUpdate(rvo);
	}

}
