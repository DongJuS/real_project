package org.conan.service;

import java.util.List;

import org.conan.domain.GetReplyVO;

public interface GetReplyService {
	public void insertGetReply(GetReplyVO rvo);
	public List<GetReplyVO> readRecipeReply(int rid);
	public void replyDelete(GetReplyVO rvo);
	public void replyUpdate(GetReplyVO rvo);
}
