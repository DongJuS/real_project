package org.conan.domain;

import java.util.Date;

import lombok.Data;

@Data
public class GetReplyVO {
	private int rid;
	private int replyNo;
	private String userId;
	private String regDate;
	private String updateDate;
	private String content;
	
	public GetReplyVO() {}
	
	public GetReplyVO(int rid, String content, String userId) {
		super();
		this.rid = rid;
		this.content = content;
		this.userId = userId;
	}

	public GetReplyVO(int rid, String userId, int replyNo) {
		super();
		this.rid = rid;
		this.replyNo = replyNo;
		this.userId = userId;
	}

	public GetReplyVO(int replyNo, String content) {
		super();
		this.replyNo = replyNo;
		this.content = content;
	}
	
	
}
